#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnLMProcessor interface is implemented by the language model text service and is used by an application or text service to enable alternate language model processing.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnlmprocessor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnLMProcessor extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnLMProcessor
     * @type {Guid}
     */
    static IID => Guid("{7afbf8e7-ac4b-4082-b058-890899d3a010}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryRange", "QueryLangID", "GetReconversion", "Reconvert", "QueryKey", "InvokeKey", "InvokeFunc"]

    /**
     * 
     * @param {ITfRange} pRange 
     * @param {Pointer<ITfRange>} ppNewRange 
     * @param {Pointer<BOOL>} pfAccepted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlmprocessor-queryrange
     */
    QueryRange(pRange, ppNewRange, pfAccepted) {
        result := ComCall(4, this, "ptr", pRange, "ptr*", ppNewRange, "ptr", pfAccepted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<BOOL>} pfAccepted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlmprocessor-querylangid
     */
    QueryLangID(langid, pfAccepted) {
        result := ComCall(5, this, "ushort", langid, "ptr", pfAccepted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfRange} pRange 
     * @param {Pointer<ITfCandidateList>} ppCandList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlmprocessor-getreconversion
     */
    GetReconversion(pRange, ppCandList) {
        result := ComCall(6, this, "ptr", pRange, "ptr*", ppCandList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfRange} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlmprocessor-reconvert
     */
    Reconvert(pRange) {
        result := ComCall(7, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fUp 
     * @param {WPARAM} vKey 
     * @param {LPARAM} lparamKeydata 
     * @param {Pointer<BOOL>} pfInterested 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlmprocessor-querykey
     */
    QueryKey(fUp, vKey, lparamKeydata, pfInterested) {
        result := ComCall(8, this, "int", fUp, "ptr", vKey, "ptr", lparamKeydata, "ptr", pfInterested, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fUp 
     * @param {WPARAM} vKey 
     * @param {LPARAM} lparamKeyData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlmprocessor-invokekey
     */
    InvokeKey(fUp, vKey, lparamKeyData) {
        result := ComCall(9, this, "int", fUp, "ptr", vKey, "ptr", lparamKeyData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {Pointer<Guid>} refguidFunc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlmprocessor-invokefunc
     */
    InvokeFunc(pic, refguidFunc) {
        result := ComCall(10, this, "ptr", pic, "ptr", refguidFunc, "HRESULT")
        return result
    }
}
