using Oshyn.Ayudame.Dal;

namespace Oshyn.Ayudame.Core
{
    public interface IMobileUserRepository
    {
        MobileUser Create(int userId, string name, string lastName, string email, string phone, string mobileId, string mobileType);

        MobileUser GetById(int id);
    }
}