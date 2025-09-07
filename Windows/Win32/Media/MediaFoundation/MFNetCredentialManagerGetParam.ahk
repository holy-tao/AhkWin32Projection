#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {Integer}
     */
    hrOp {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Set this flag to <b>TRUE</b> if the currently logged on user's credentials should be used as the default credentials.
     * @type {Integer}
     */
    fAllowLoggedOnUser {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If <b>TRUE</b>, the authentication package will send unencrypted credentials over the network. Otherwise, the authentication package encrypts the credentials.
     * @type {Integer}
     */
    fClearTextPackage {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The original URL that requires authentication.
     * @type {PWSTR}
     */
    pszUrl{
        get {
            if(!this.HasProp("__pszUrl"))
                this.__pszUrl := PWSTR(this.ptr + 16)
            return this.__pszUrl
        }
    }

    /**
     * The name of the site or proxy that requires authentication.
     * @type {PWSTR}
     */
    pszSite{
        get {
            if(!this.HasProp("__pszSite"))
                this.__pszSite := PWSTR(this.ptr + 24)
            return this.__pszSite
        }
    }

    /**
     * The name of the realm for this authentication.
     * @type {PWSTR}
     */
    pszRealm{
        get {
            if(!this.HasProp("__pszRealm"))
                this.__pszRealm := PWSTR(this.ptr + 32)
            return this.__pszRealm
        }
    }

    /**
     * The name of the authentication package. For example, "Digest" or "MBS_BASIC".
     * @type {PWSTR}
     */
    pszPackage{
        get {
            if(!this.HasProp("__pszPackage"))
                this.__pszPackage := PWSTR(this.ptr + 40)
            return this.__pszPackage
        }
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
