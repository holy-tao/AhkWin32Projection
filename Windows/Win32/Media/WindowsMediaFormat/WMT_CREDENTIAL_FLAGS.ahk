#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_CREDENTIAL_FLAGS enumeration type contains values used in the IWMCredentialCallback::AcquireCredentials method.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_credential_flags
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_CREDENTIAL_FLAGS{

    /**
     * The application can set this flag to indicate that the caller should save the credentials in a persistent manner.
     * @type {Integer (Int32)}
     */
    static WMT_CREDENTIAL_SAVE => 1

    /**
     * The application can set this flag to indicate that the caller should not cache the credentials in memory.
     * @type {Integer (Int32)}
     */
    static WMT_CREDENTIAL_DONT_CACHE => 2

    /**
     * If this flag is set when the <b>AcquireCredentials</b> method is called, it indicates that the credentials will be sent over the network unencrypted. Applications should not set this flag.
     * @type {Integer (Int32)}
     */
    static WMT_CREDENTIAL_CLEAR_TEXT => 4

    /**
     * If this flag is set when the <b>AcquireCredentials</b> method is called, it indicates that the credentials are for a proxy server. Applications should not set this flag.
     * @type {Integer (Int32)}
     */
    static WMT_CREDENTIAL_PROXY => 8

    /**
     * If this flag is set when the <b>AcquireCredentials</b> method is called, it indicates that the caller can handle encrypted credentials. When this flag is set, the application has the option of encrypting the credentials. To encrypt the credentials, use the <b>CryptProtectData</b> function, which is described in the Platform SDK documentation. The application can also return the credentials in plain text. In that case, the caller automatically encrypts the credentials, unless the WMT_CREDENTIAL_CLEAR_TEXT flag was set when the <b>AcquireCredentials</b> method was called.
     * 
     * If the application encrypts the credentials, it must set the WMT_CREDENTIAL_ENCRYPT flag before the method returns. If the application returns the credentials in clear text, clear this flag before the method returns.
     * @type {Integer (Int32)}
     */
    static WMT_CREDENTIAL_ENCRYPT => 16
}
