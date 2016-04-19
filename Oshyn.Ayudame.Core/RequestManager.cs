using Oshyn.Ayudame.Dal;
using System.Data.Entity.Spatial;

namespace Oshyn.Ayudame.Core
{
    public class RequestManager
    {
        private IRequestRepository requestRepository;

        public RequestManager(IRequestRepository requestRepository)
        {
            this.requestRepository = requestRepository;
        }


        public Request Create(int mobileUserId, string title, string description, DbGeography location)
        {
            // Add business rules here if needed
            return requestRepository.Create(mobileUserId, title, description, location);
        }


    }
}
