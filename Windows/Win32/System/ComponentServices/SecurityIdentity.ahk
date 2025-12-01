#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides access to a collection of security information representing a caller's identity. Using this class, you can find out about a particular caller in a chain of callers that is part of the security call context.
 * @remarks
 * You cannot directly create a **SecurityIdentity** object. To use the methods of [**ISecurityIdentityColl**](/windows/desktop/api/ComSvcs/nn-comsvcs-isecurityidentitycoll), you must obtain a reference to its implementation by calling [**CoGetCallContext**](/windows/desktop/api/combaseapi/nf-combaseapi-cogetcallcontext), supplying IID\_ISecurityCallContext for the *riid* parameter. Next, call [**ISecurityCallContext::get\_Item**](/windows/desktop/api/ComSvcs/nf-comsvcs-isecuritycallcontext-get_item) requesting a security call context item that is a security identity collection (such as "DirectCaller" or "OriginalCaller"). Then call [**ISecurityIdentityColl::get\_Item**](/windows/desktop/api/ComSvcs/nf-comsvcs-isecurityidentitycoll-get_item) to retrieve a security identity item (such as "Name" or "AuthenticationService").
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. You cannot directly create a SecurityIdentity object. To use its properties, you must obtain a refernece to its implementation using [**GetSecurityCallContext**](/windows/desktop/api/ComSvcs/nf-comsvcs-igetsecuritycallcontext-getsecuritycallcontext). Next, get the Item property of the object, requesting a security call context item that is a security identity collection (such as "DirectCaller" or "OriginalCaller"). Then, use the Item property of the SecurityIdentity object to retrieve a security identity item (such as "Name" or "AuthenticationService").
 * @see https://learn.microsoft.com/windows/win32/cossdk/securityidentity
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class SecurityIdentity extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
