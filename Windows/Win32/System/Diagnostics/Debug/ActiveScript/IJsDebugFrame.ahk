#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugFrame extends IUnknown{
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
     * 
     * @param {Pointer<UInt64>} pStart 
     * @param {Pointer<UInt64>} pEnd 
     * @returns {HRESULT} 
     */
    GetStackRange(pStart, pEnd) {
        result := ComCall(3, this, "uint*", pStart, "uint*", pEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    GetName(pName) {
        result := ComCall(4, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pDocumentId 
     * @param {Pointer<UInt32>} pCharacterOffset 
     * @param {Pointer<UInt32>} pStatementCharCount 
     * @returns {HRESULT} 
     */
    GetDocumentPositionWithId(pDocumentId, pCharacterOffset, pStatementCharCount) {
        result := ComCall(5, this, "uint*", pDocumentId, "uint*", pCharacterOffset, "uint*", pStatementCharCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDocumentName 
     * @param {Pointer<UInt32>} pLine 
     * @param {Pointer<UInt32>} pColumn 
     * @returns {HRESULT} 
     */
    GetDocumentPositionWithName(pDocumentName, pLine, pColumn) {
        result := ComCall(6, this, "ptr", pDocumentName, "uint*", pLine, "uint*", pColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IJsDebugProperty>} ppDebugProperty 
     * @returns {HRESULT} 
     */
    GetDebugProperty(ppDebugProperty) {
        result := ComCall(7, this, "ptr", ppDebugProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pReturnAddress 
     * @returns {HRESULT} 
     */
    GetReturnAddress(pReturnAddress) {
        result := ComCall(8, this, "uint*", pReturnAddress, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(9, this, "ptr", pExpressionText, "ptr", ppDebugProperty, "ptr", pError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
