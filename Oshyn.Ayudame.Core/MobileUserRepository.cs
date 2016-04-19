using System.Linq;
using Oshyn.Ayudame.Dal;

namespace Oshyn.Ayudame.Core
{
    public class MobileUserRepository : IMobileUserRepository
    {
        private AyudameDbEntities dbContext;

        public MobileUserRepository(AyudameDbEntities ayudameEntities)
        {
            this.dbContext = ayudameEntities;
        }

        public MobileUser Create(int userId, string name, string lastName, string email, string phone, string mobileId, string mobileType)
        {
            var mobileUser = new MobileUser
            {
                Id = userId,
                Name = name,
                LastName = lastName,
                Email = email,
                Phone = phone,
                MobileId = mobileId,
                MobileType = mobileType
            };

            using (var db = dbContext)
            {
                db.MobileUsers.Add(mobileUser);
            }

            return mobileUser;
        }

        public MobileUser GetById(int id)
        {
            using (var db = dbContext)
            {
                return db.MobileUsers.FirstOrDefault(r => r.Id == id);
            }
        }
    }
}
