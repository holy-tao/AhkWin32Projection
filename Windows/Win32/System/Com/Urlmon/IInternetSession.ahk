#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetSession
     * @type {Guid}
     */
    static IID => Guid("{79eac9e7-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterNameSpace", "UnregisterNameSpace", "RegisterMimeFilter", "UnregisterMimeFilter", "CreateBinding", "SetSessionOption", "GetSessionOption"]

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {Pointer<Guid>} rclsid 
     * @param {PWSTR} pwzProtocol 
     * @param {Integer} cPatterns 
     * @param {Pointer<PWSTR>} ppwzPatterns 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    RegisterNameSpace(pCF, rclsid, pwzProtocol, cPatterns, ppwzPatterns, dwReserved) {
        pwzProtocol := pwzProtocol is String ? StrPtr(pwzProtocol) : pwzProtocol

        result := ComCall(3, this, "ptr", pCF, "ptr", rclsid, "ptr", pwzProtocol, "uint", cPatterns, "ptr", ppwzPatterns, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {PWSTR} pszProtocol 
     * @returns {HRESULT} 
     */
    UnregisterNameSpace(pCF, pszProtocol) {
        pszProtocol := pszProtocol is String ? StrPtr(pszProtocol) : pszProtocol

        result := ComCall(4, this, "ptr", pCF, "ptr", pszProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {Pointer<Guid>} rclsid 
     * @param {PWSTR} pwzType 
     * @returns {HRESULT} 
     */
    RegisterMimeFilter(pCF, rclsid, pwzType) {
        pwzType := pwzType is String ? StrPtr(pwzType) : pwzType

        result := ComCall(5, this, "ptr", pCF, "ptr", rclsid, "ptr", pwzType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {PWSTR} pwzType 
     * @returns {HRESULT} 
     */
    UnregisterMimeFilter(pCF, pwzType) {
        pwzType := pwzType is String ? StrPtr(pwzType) : pwzType

        result := ComCall(6, this, "ptr", pCF, "ptr", pwzType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBindCtx} pBC 
     * @param {PWSTR} szUrl 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<IUnknown>} ppUnk 
     * @param {Pointer<IInternetProtocol>} ppOInetProt 
     * @param {Integer} dwOption 
     * @returns {HRESULT} 
     */
    CreateBinding(pBC, szUrl, pUnkOuter, ppUnk, ppOInetProt, dwOption) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl

        result := ComCall(7, this, "ptr", pBC, "ptr", szUrl, "ptr", pUnkOuter, "ptr*", ppUnk, "ptr*", ppOInetProt, "uint", dwOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} dwBufferLength 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetSessionOption(dwOption, pBuffer, dwBufferLength, dwReserved) {
        result := ComCall(8, this, "uint", dwOption, "ptr", pBuffer, "uint", dwBufferLength, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pdwBufferLength 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSessionOption(dwOption, pBuffer, pdwBufferLength, dwReserved) {
        result := ComCall(9, this, "uint", dwOption, "ptr", pBuffer, "uint*", pdwBufferLength, "uint", dwReserved, "HRESULT")
        return result
    }
}
