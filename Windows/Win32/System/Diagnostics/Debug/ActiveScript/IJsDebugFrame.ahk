#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsDebugFrame
     * @type {Guid}
     */
    static IID => Guid("{c9196637-ab9d-44b2-bad2-13b95b3f390e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStackRange", "GetName", "GetDocumentPositionWithId", "GetDocumentPositionWithName", "GetDebugProperty", "GetReturnAddress", "Evaluate"]

    /**
     * 
     * @param {Pointer<Integer>} pStart 
     * @param {Pointer<Integer>} pEnd 
     * @returns {HRESULT} 
     */
    GetStackRange(pStart, pEnd) {
        result := ComCall(3, this, "uint*", pStart, "uint*", pEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    GetName(pName) {
        result := ComCall(4, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDocumentId 
     * @param {Pointer<Integer>} pCharacterOffset 
     * @param {Pointer<Integer>} pStatementCharCount 
     * @returns {HRESULT} 
     */
    GetDocumentPositionWithId(pDocumentId, pCharacterOffset, pStatementCharCount) {
        result := ComCall(5, this, "uint*", pDocumentId, "uint*", pCharacterOffset, "uint*", pStatementCharCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDocumentName 
     * @param {Pointer<Integer>} pLine 
     * @param {Pointer<Integer>} pColumn 
     * @returns {HRESULT} 
     */
    GetDocumentPositionWithName(pDocumentName, pLine, pColumn) {
        result := ComCall(6, this, "ptr", pDocumentName, "uint*", pLine, "uint*", pColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IJsDebugProperty>} ppDebugProperty 
     * @returns {HRESULT} 
     */
    GetDebugProperty(ppDebugProperty) {
        result := ComCall(7, this, "ptr*", ppDebugProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pReturnAddress 
     * @returns {HRESULT} 
     */
    GetReturnAddress(pReturnAddress) {
        result := ComCall(8, this, "uint*", pReturnAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pExpressionText 
     * @param {Pointer<IJsDebugProperty>} ppDebugProperty 
     * @param {Pointer<BSTR>} pError 
     * @returns {HRESULT} 
     */
    Evaluate(pExpressionText, ppDebugProperty, pError) {
        pExpressionText := pExpressionText is String ? StrPtr(pExpressionText) : pExpressionText

        result := ComCall(9, this, "ptr", pExpressionText, "ptr*", ppDebugProperty, "ptr", pError, "HRESULT")
        return result
    }
}
