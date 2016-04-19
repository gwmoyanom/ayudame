using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Oshyn.Ayudame.Core
{
    public class RequestManager
    {
        private IRequestRepository requestRepository;

        public RequestManager(IRequestRepository requestRepository)
        {
            this.requestRepository = requestRepository;
        }





    }
}
