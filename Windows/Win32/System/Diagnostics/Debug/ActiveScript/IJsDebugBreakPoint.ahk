#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugBreakPoint extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEnabled", "Enable", "Disable", "Delete", "GetDocumentPosition"]

    /**
     * 
     * @param {Pointer<BOOL>} pIsEnabled 
     * @returns {HRESULT} 
     */
    IsEnabled(pIsEnabled) {
        result := ComCall(3, this, "ptr", pIsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Enable() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disable() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDocumentId 
     * @param {Pointer<Integer>} pCharacterOffset 
     * @param {Pointer<Integer>} pStatementCharCount 
     * @returns {HRESULT} 
     */
    GetDocumentPosition(pDocumentId, pCharacterOffset, pStatementCharCount) {
        result := ComCall(7, this, "uint*", pDocumentId, "uint*", pCharacterOffset, "uint*", pStatementCharCount, "HRESULT")
        return result
    }
}
