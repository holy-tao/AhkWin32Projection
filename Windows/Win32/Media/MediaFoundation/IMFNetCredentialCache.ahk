#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets credentials from the credential cache.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcredentialcache
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCredentialCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetCredentialCache
     * @type {Guid}
     */
    static IID => Guid("{5b87ef6c-7ed8-434f-ba0e-184fac1628d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCredential", "SetGood", "SetUserOptions"]

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {PWSTR} pszRealm 
     * @param {Integer} dwAuthenticationFlags 
     * @param {Pointer<IMFNetCredential>} ppCred 
     * @param {Pointer<Integer>} pdwRequirementsFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialcache-getcredential
     */
    GetCredential(pszUrl, pszRealm, dwAuthenticationFlags, ppCred, pdwRequirementsFlags) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszRealm := pszRealm is String ? StrPtr(pszRealm) : pszRealm

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszRealm, "uint", dwAuthenticationFlags, "ptr*", ppCred, "uint*", pdwRequirementsFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFNetCredential} pCred 
     * @param {BOOL} fGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialcache-setgood
     */
    SetGood(pCred, fGood) {
        result := ComCall(4, this, "ptr", pCred, "int", fGood, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFNetCredential} pCred 
     * @param {Integer} dwOptionsFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialcache-setuseroptions
     */
    SetUserOptions(pCred, dwOptionsFlags) {
        result := ComCall(5, this, "ptr", pCred, "uint", dwOptionsFlags, "HRESULT")
        return result
    }
}
