#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides an entry point through which a WMI Query Language (WQL) query can be parsed.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nn-wmiutils-iwbemquery
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemQuery
     * @type {Guid}
     */
    static IID => Guid("{81166f58-dd98-11d3-a120-00105a1f515a}")

    /**
     * The class identifier for WbemQuery
     * @type {Guid}
     */
    static CLSID => Guid("{eac8a024-21e2-4523-ad73-a71a0aa2f56a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Empty", "SetLanguageFeatures", "TestLanguageFeatures", "Parse", "GetAnalysis", "FreeMemory", "GetQueryInfo"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbemquery-empty
     */
    Empty() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @param {Integer} uArraySize 
     * @param {Pointer<Integer>} puFeatures 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nn-wmiutils-iwbemquery
     */
    SetLanguageFeatures(uFlags, uArraySize, puFeatures) {
        result := ComCall(4, this, "uint", uFlags, "uint", uArraySize, "uint*", puFeatures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @param {Pointer<Integer>} uArraySize 
     * @param {Pointer<Integer>} puFeatures 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nn-wmiutils-iwbemquery
     */
    TestLanguageFeatures(uFlags, uArraySize, puFeatures) {
        result := ComCall(5, this, "uint", uFlags, "uint*", uArraySize, "uint*", puFeatures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLang 
     * @param {PWSTR} pszQuery 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbemquery-parse
     */
    Parse(pszLang, pszQuery, uFlags) {
        pszLang := pszLang is String ? StrPtr(pszLang) : pszLang
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(6, this, "ptr", pszLang, "ptr", pszQuery, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uAnalysisType 
     * @param {Integer} uFlags 
     * @param {Pointer<Pointer<Void>>} pAnalysis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbemquery-getanalysis
     */
    GetAnalysis(uAnalysisType, uFlags, pAnalysis) {
        result := ComCall(7, this, "uint", uAnalysisType, "uint", uFlags, "ptr*", pAnalysis, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbemquery-freememory
     */
    FreeMemory(pMem) {
        result := ComCall(8, this, "ptr", pMem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uAnalysisType 
     * @param {Integer} uInfoId 
     * @param {Integer} uBufSize 
     * @param {Pointer<Void>} pDestBuf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nn-wmiutils-iwbemquery
     */
    GetQueryInfo(uAnalysisType, uInfoId, uBufSize, pDestBuf) {
        result := ComCall(9, this, "uint", uAnalysisType, "uint", uInfoId, "uint", uBufSize, "ptr", pDestBuf, "HRESULT")
        return result
    }
}
