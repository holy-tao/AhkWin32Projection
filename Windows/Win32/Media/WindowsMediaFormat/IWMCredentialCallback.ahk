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
     * 
     * @param {PWSTR} pwszRealm 
     * @param {PWSTR} pwszSite 
     * @param {PWSTR} pwszUser 
     * @param {Integer} cchUser 
     * @param {PWSTR} pwszPassword 
     * @param {Integer} cchPassword 
     * @param {HRESULT} hrStatus 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmcredentialcallback-acquirecredentials
     */
    AcquireCredentials(pwszRealm, pwszSite, pwszUser, cchUser, pwszPassword, cchPassword, hrStatus, pdwFlags) {
        pwszRealm := pwszRealm is String ? StrPtr(pwszRealm) : pwszRealm
        pwszSite := pwszSite is String ? StrPtr(pwszSite) : pwszSite
        pwszUser := pwszUser is String ? StrPtr(pwszUser) : pwszUser
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(3, this, "ptr", pwszRealm, "ptr", pwszSite, "ptr", pwszUser, "uint", cchUser, "ptr", pwszPassword, "uint", cchPassword, "int", hrStatus, "uint*", pdwFlags, "HRESULT")
        return result
    }
}
