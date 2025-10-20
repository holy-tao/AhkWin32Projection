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
     * 
     * @param {PWSTR} pszUrl 
     * @param {PWSTR} pszRealm 
     * @param {Integer} dwAuthenticationFlags 
     * @param {Pointer<IMFNetCredential>} ppCred 
     * @param {Pointer<UInt32>} pdwRequirementsFlags 
     * @returns {HRESULT} 
     */
    GetCredential(pszUrl, pszRealm, dwAuthenticationFlags, ppCred, pdwRequirementsFlags) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszRealm := pszRealm is String ? StrPtr(pszRealm) : pszRealm

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszRealm, "uint", dwAuthenticationFlags, "ptr", ppCred, "uint*", pdwRequirementsFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFNetCredential>} pCred 
     * @param {BOOL} fGood 
     * @returns {HRESULT} 
     */
    SetGood(pCred, fGood) {
        result := ComCall(4, this, "ptr", pCred, "int", fGood, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFNetCredential>} pCred 
     * @param {Integer} dwOptionsFlags 
     * @returns {HRESULT} 
     */
    SetUserOptions(pCred, dwOptionsFlags) {
        result := ComCall(5, this, "ptr", pCred, "uint", dwOptionsFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
