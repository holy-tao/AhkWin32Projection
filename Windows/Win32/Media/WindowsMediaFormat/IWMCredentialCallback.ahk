#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMCredentialCallback interface is a callback interface used by the reader object to acquire user credentials.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmcredentialcallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCredentialCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCredentialCallback
     * @type {Guid}
     */
    static IID => Guid("{342e0eb7-e651-450c-975b-2ace2c90c48e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireCredentials"]

    /**
     * The AcquireCredentials method acquires the credentials of the user, to verify that the user has permission to access a remote site.
     * @param {PWSTR} pwszRealm Pointer to a wide-character null-terminated string that contains the name of the realm.
     * @param {PWSTR} pwszSite Pointer to a wide-character null-terminated string containing the name of the site. The site is the name of the remote server.
     * @param {PWSTR} pwszUser Pointer to a buffer for the user name. The application should copy the user name into this buffer. When this method is first called, the buffer is empty. If the method is called again — for example, if the user typed his or her credentials incorrectly — the buffer may contain the name from the previous invocation.
     * @param {Integer} cchUser Specifies the size of the <i>pwszUser</i> buffer, in number of wide characters.
     * @param {PWSTR} pwszPassword Pointer to a buffer for the password. The application should copy the user's password into this buffer.
     * @param {Integer} cchPassword Specifies the size of the <i>pwszPassword</i> buffer, in number of wide characters.
     * @param {HRESULT} hrStatus Specifies an <b>HRESULT</b> return code.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_credential_flags">WMT_CREDENTIAL_FLAGS</a> enumeration type. On input, the caller sets whichever flags are relevant. On output, the application should clear the flags that were set by the caller, and set any additional flags, as appropriate. For details, see <b>WMT_CREDENTIAL_FLAGS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmcredentialcallback-acquirecredentials
     */
    AcquireCredentials(pwszRealm, pwszSite, pwszUser, cchUser, pwszPassword, cchPassword, hrStatus) {
        pwszRealm := pwszRealm is String ? StrPtr(pwszRealm) : pwszRealm
        pwszSite := pwszSite is String ? StrPtr(pwszSite) : pwszSite
        pwszUser := pwszUser is String ? StrPtr(pwszUser) : pwszUser
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(3, this, "ptr", pwszRealm, "ptr", pwszSite, "ptr", pwszUser, "uint", cchUser, "ptr", pwszPassword, "uint", cchPassword, "int", hrStatus, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
