function Import-IdentityAttribute
{
    Add-Type -ReferencedAssemblies System.Security.Principal.Windows, System.Management.Automation -TypeDefinition @'
using System;
using System.Security.Principal;
using System.Management.Automation;

namespace PSPrivilege
{
    public class IdentityAttribute : ArgumentTransformationAttribute
    {
        public override object Transform(EngineIntrinsics e, Object value)
        {
            if (value is IdentityReference)
            {
                return value;
            }

            return new NTAccount(value.ToString());
        }
    }
}
'@
}
