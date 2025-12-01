#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides access to the current call's security context, which contains information about an object's callers.
 * @remarks
 * You cannot directly create a **SecurityCallContext** object. To use the methods of [**ISecurityCallContext**](/windows/desktop/api/ComSvcs/nn-comsvcs-isecuritycallcontext), you must obtain a reference to its implementation by calling [**CoGetCallContext**](/windows/desktop/api/combaseapi/nf-combaseapi-cogetcallcontext), supplying IID\_ISecurityCallContext for the *riid* parameter.
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A SecurityCallContext object can be declared using "COMSVCSLib.SecurityCallContext" as the class name; it is created by calling [**GetSecurityCallContext**](/windows/desktop/api/ComSvcs/nf-comsvcs-igetsecuritycallcontext-getsecuritycallcontext).
 * @see https://learn.microsoft.com/windows/win32/cossdk/securitycallcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class SecurityCallContext extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
