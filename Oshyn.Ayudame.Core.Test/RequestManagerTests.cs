using Oshyn.Ayudame.Dal;
using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Oshyn.Ayudame.Core.Test
{
    public class RequestManagerTests
    {
        private IRequestRepository requestRepository;

        public RequestManagerTests()
        {
            requestRepository = new RequestRepository(new AyudameDbEntities());
        }


        [Fact]
        public void Should_Create_A_Request()
        {
            var rm = new RequestManager(requestRepository);

            var lon = 0;
            var lat = 0;
            var id = 1721890208; // For test, user previously created

            var point = string.Format("POINT({0} {1})", lon, lat);

            var request = rm.Create(id, "Title 1", "Description 1", DbGeography.FromText(point));

            Assert.NotNull(request);
        }
    }
}
