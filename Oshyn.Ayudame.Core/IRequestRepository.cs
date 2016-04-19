using System.Collections.Generic;

namespace Oshyn.Ayudame.Core
{
    internal interface IRequestRepository
    {
        public Request GetById(int id)
        {

        }

        public IEnumerable<Request> GetByMobileUser(string mobileUserId)
        {

        }
    }
}