#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the authentication information for the credential manager.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfnetcredentialmanagergetparam
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFNetCredentialManagerGetParam {
    #StructPack 8

    /**
     * The response code of the authentication challenge. For example, NS_E_PROXY_ACCESSDENIED.
     */
    hrOp : HRESULT

    /**
     * Set this flag to <b>TRUE</b> if the currently logged on user's credentials should be used as the default credentials.
     */
    fAllowLoggedOnUser : BOOL

    /**
     * If <b>TRUE</b>, the authentication package will send unencrypted credentials over the network. Otherwise, the authentication package encrypts the credentials.
     */
    fClearTextPackage : BOOL

    /**
     * The original URL that requires authentication.
     */
    pszUrl : PWSTR

    /**
     * The name of the site or proxy that requires authentication.
     */
    pszSite : PWSTR

    /**
     * The name of the realm for this authentication.
     */
    pszRealm : PWSTR

    /**
     * The name of the authentication package. For example, "Digest" or "MBS_BASIC".
     */
    pszPackage : PWSTR

    /**
     * The number of times that the credential manager should retry after authentication fails.
     */
    nRetries : Int32

}
