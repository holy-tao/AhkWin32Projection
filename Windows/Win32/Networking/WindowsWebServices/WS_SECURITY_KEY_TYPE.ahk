#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The key type of a security token. It is used as the return type when a security token is queried about its key. It is also used to specify the required key type when requesting a security token from a security token service.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_key_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_KEY_TYPE extends Win32Enum{

    /**
     * Has no key -- it may be a bearer token such as a username/password
     * pair.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_KEY_TYPE_NONE => 1

    /**
     * Has a symmetric key.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_KEY_TYPE_SYMMETRIC => 2

    /**
     * Has an asymmetric key.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_KEY_TYPE_ASYMMETRIC => 3
}
