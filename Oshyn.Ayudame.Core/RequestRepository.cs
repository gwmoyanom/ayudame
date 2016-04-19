using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oshyn.Ayudame.Dal;

namespace Oshyn.Ayudame.Core
{
    public class RequestRepository : IRequestRepository
    {
        private AyudameDbEntities dbContext;

        public RequestRepository(AyudameDbEntities ayudameEntities)
        {
            this.dbContext = ayudameEntities;
        }

        public Request Create(int mobileUserId, string title, string description, DbGeography location)
        {
            // TODO Add validations, pass a new db context every time to this class could be changed.

            var request = new Request
            {
                MobileUserId = mobileUserId,
                Title = title,
                Description = description,
                Geolocation = location,
                CreateDate = DateTime.UtcNow
            };

            using (var db = dbContext)
            {
                db.Requests.Add(request);
                db.SaveChanges();
            }

            return request;
        }

        public Request GetById(int id)
        {
            using (var db = dbContext)
            {
                return db.Requests.FirstOrDefault(r => r.Id == id);
            }
        }

        public IEnumerable<Request> GetByMobileUser(int mobileUserId)
        {
            using (var db = dbContext)
            {
                return db.Requests.Where(r => r.MobileUserId == mobileUserId);
            }
        }
    }
}
