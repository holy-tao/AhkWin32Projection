#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the authentication information for the credential manager.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfnetcredentialmanagergetparam
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFNetCredentialManagerGetParam extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The response code of the authentication challenge. For example, NS_E_PROXY_ACCESSDENIED.
     * @type {HRESULT}
     */
    hrOp {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Set this flag to <b>TRUE</b> if the currently logged on user's credentials should be used as the default credentials.
     * @type {BOOL}
     */
    fAllowLoggedOnUser {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If <b>TRUE</b>, the authentication package will send unencrypted credentials over the network. Otherwise, the authentication package encrypts the credentials.
     * @type {BOOL}
     */
    fClearTextPackage {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The original URL that requires authentication.
     * @type {PWSTR}
     */
    pszUrl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The name of the site or proxy that requires authentication.
     * @type {PWSTR}
     */
    pszSite {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The name of the realm for this authentication.
     * @type {PWSTR}
     */
    pszRealm {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The name of the authentication package. For example, "Digest" or "MBS_BASIC".
     * @type {PWSTR}
     */
    pszPackage {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The number of times that the credential manager should retry after authentication fails.
     * @type {Integer}
     */
    nRetries {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
