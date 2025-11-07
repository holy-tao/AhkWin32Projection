#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IJsDebugProperty.ahk
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
        pStartMarshal := pStart is VarRef ? "uint*" : "ptr"
        pEndMarshal := pEnd is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pStartMarshal, pStart, pEndMarshal, pEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetName() {
        pName := BSTR()
        result := ComCall(4, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @param {Pointer<Integer>} pDocumentId 
     * @param {Pointer<Integer>} pCharacterOffset 
     * @param {Pointer<Integer>} pStatementCharCount 
     * @returns {HRESULT} 
     */
    GetDocumentPositionWithId(pDocumentId, pCharacterOffset, pStatementCharCount) {
        pDocumentIdMarshal := pDocumentId is VarRef ? "uint*" : "ptr"
        pCharacterOffsetMarshal := pCharacterOffset is VarRef ? "uint*" : "ptr"
        pStatementCharCountMarshal := pStatementCharCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pDocumentIdMarshal, pDocumentId, pCharacterOffsetMarshal, pCharacterOffset, pStatementCharCountMarshal, pStatementCharCount, "HRESULT")
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
        pLineMarshal := pLine is VarRef ? "uint*" : "ptr"
        pColumnMarshal := pColumn is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pDocumentName, pLineMarshal, pLine, pColumnMarshal, pColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IJsDebugProperty} 
     */
    GetDebugProperty() {
        result := ComCall(7, this, "ptr*", &ppDebugProperty := 0, "HRESULT")
        return IJsDebugProperty(ppDebugProperty)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReturnAddress() {
        result := ComCall(8, this, "uint*", &pReturnAddress := 0, "HRESULT")
        return pReturnAddress
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
