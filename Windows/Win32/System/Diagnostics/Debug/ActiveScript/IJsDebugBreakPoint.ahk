#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugBreakPoint extends IUnknown{
    /**
     * The interface identifier for IJsDebugBreakPoint
     * @type {Guid}
     */
    static IID => Guid("{df6773e3-ed8d-488b-8a3e-5812577d1542}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pIsEnabled 
     * @returns {HRESULT} 
     */
    IsEnabled(pIsEnabled) {
        result := ComCall(3, this, "ptr", pIsEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Enable() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disable() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(6, this, "int")
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
    GetDocumentPosition(pDocumentId, pCharacterOffset, pStatementCharCount) {
        result := ComCall(7, this, "uint*", pDocumentId, "uint*", pCharacterOffset, "uint*", pStatementCharCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
