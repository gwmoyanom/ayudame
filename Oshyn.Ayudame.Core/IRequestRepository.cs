using System;
using Oshyn.Ayudame.Dal;
using System.Collections.Generic;
using System.Data.Entity.Spatial;

namespace Oshyn.Ayudame.Core
{
    public interface IRequestRepository
    {
        Request Create(int mobileUserId, string title, string description, DbGeography location);

        Request GetById(int id);

        IEnumerable<Request> GetByMobileUser(int mobileUserId);
    }
}