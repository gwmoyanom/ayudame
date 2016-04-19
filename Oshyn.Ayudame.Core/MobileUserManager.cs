using Oshyn.Ayudame.Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Oshyn.Ayudame.Core
{
    public class MobileUserManager
    {
        private IMobileUserRepository mobileUserRepository;

        public MobileUserManager(IMobileUserRepository mobileUserRepository)
        {
            this.mobileUserRepository = mobileUserRepository;
        }


        public MobileUser Create(int userId, string name, string lastName, string email, string phone, string mobileId, string mobileType)
        {
            // Add business rules here if needed
            return mobileUserRepository.Create(userId, name, lastName, email, phone, mobileId, mobileType);
        }

    }
}
