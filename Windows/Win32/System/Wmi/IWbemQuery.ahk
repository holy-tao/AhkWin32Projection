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
     * 
     * @returns {HRESULT} 
     */
    Empty() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @param {Integer} uArraySize 
     * @param {Pointer<UInt32>} puFeatures 
     * @returns {HRESULT} 
     */
    SetLanguageFeatures(uFlags, uArraySize, puFeatures) {
        result := ComCall(4, this, "uint", uFlags, "uint", uArraySize, "uint*", puFeatures, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @param {Pointer<UInt32>} uArraySize 
     * @param {Pointer<UInt32>} puFeatures 
     * @returns {HRESULT} 
     */
    TestLanguageFeatures(uFlags, uArraySize, puFeatures) {
        result := ComCall(5, this, "uint", uFlags, "uint*", uArraySize, "uint*", puFeatures, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszLang 
     * @param {PWSTR} pszQuery 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     */
    Parse(pszLang, pszQuery, uFlags) {
        pszLang := pszLang is String ? StrPtr(pszLang) : pszLang
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(6, this, "ptr", pszLang, "ptr", pszQuery, "uint", uFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uAnalysisType 
     * @param {Integer} uFlags 
     * @param {Pointer<Void>} pAnalysis 
     * @returns {HRESULT} 
     */
    GetAnalysis(uAnalysisType, uFlags, pAnalysis) {
        result := ComCall(7, this, "uint", uAnalysisType, "uint", uFlags, "ptr", pAnalysis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @returns {HRESULT} 
     */
    FreeMemory(pMem) {
        result := ComCall(8, this, "ptr", pMem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uAnalysisType 
     * @param {Integer} uInfoId 
     * @param {Integer} uBufSize 
     * @param {Pointer<Void>} pDestBuf 
     * @returns {HRESULT} 
     */
    GetQueryInfo(uAnalysisType, uInfoId, uBufSize, pDestBuf) {
        result := ComCall(9, this, "uint", uAnalysisType, "uint", uInfoId, "uint", uBufSize, "ptr", pDestBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
