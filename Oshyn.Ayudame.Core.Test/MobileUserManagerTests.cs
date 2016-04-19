using Oshyn.Ayudame.Dal;
using System;
using Xunit;

namespace Oshyn.Ayudame.Core.Test
{
    public class MobileUserManagerTests
    {
        private IMobileUserRepository mobileUserRepository;

        public MobileUserManagerTests()
        {
            mobileUserRepository = new MobileUserRepository(new AyudameDbEntities());
        }


        [Fact]
        public void Should_Create_A_Mobile_User()
        {
            var m = new MobileUserManager(mobileUserRepository);

            var id = new Random().Next(0123456789, 1799999999);

            var mobileUser = m.Create(id, "Andres", "Villenas", "andresvillenas@hotmail.com", "0987174494", "AndroidUserId", "Android");

            Assert.NotNull(mobileUser);
        }
    }
}
