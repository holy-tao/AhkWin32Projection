#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangConvertCharset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangConvertCharset
     * @type {Guid}
     */
    static IID => Guid("{d66d6f98-cdaa-11d0-b822-00c04fc9b31f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetSourceCodePage", "GetDestinationCodePage", "GetProperty", "DoConversion", "DoConversionToUnicode", "DoConversionFromUnicode"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} uiSrcCodePage 
     * @param {Integer} uiDstCodePage 
     * @param {Integer} dwProperty 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(uiSrcCodePage, uiDstCodePage, dwProperty) {
        result := ComCall(3, this, "uint", uiSrcCodePage, "uint", uiDstCodePage, "uint", dwProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiSrcCodePage 
     * @returns {HRESULT} 
     */
    GetSourceCodePage(puiSrcCodePage) {
        result := ComCall(4, this, "uint*", puiSrcCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiDstCodePage 
     * @returns {HRESULT} 
     */
    GetDestinationCodePage(puiDstCodePage) {
        result := ComCall(5, this, "uint*", puiDstCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwProperty 
     * @returns {HRESULT} 
     */
    GetProperty(pdwProperty) {
        result := ComCall(6, this, "uint*", pdwProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    DoConversion(pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        result := ComCall(7, this, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {PWSTR} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    DoConversionToUnicode(pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pDstStr := pDstStr is String ? StrPtr(pDstStr) : pDstStr

        result := ComCall(8, this, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    DoConversionFromUnicode(pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pSrcStr := pSrcStr is String ? StrPtr(pSrcStr) : pSrcStr

        result := ComCall(9, this, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "HRESULT")
        return result
    }
}
