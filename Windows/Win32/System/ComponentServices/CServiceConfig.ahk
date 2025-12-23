#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies and configures the services that are to be active in the service domain entered when calling either CoCreateActivity or CoEnterServiceDomain.
 * @remarks
 * To create this object, call [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance).
 * 
 * Objects instantiated from the **CServiceConfig** class aggregate the free-threaded marshaler so that they can be stored by system runtimes and reused in different apartments.
 * 
 * To configure an individual service, call [**QueryInterface**](/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) for the interface associated with the service and then call methods on that interface to establish the appropriate configuration.
 * @see https://learn.microsoft.com/windows/win32/cossdk/cserviceconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CServiceConfig extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
