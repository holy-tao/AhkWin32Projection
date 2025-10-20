#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentTextEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentTextEvents
     * @type {Guid}
     */
    static IID => Guid("{51973c23-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["onDestroy", "onInsertText", "onRemoveText", "onReplaceText", "onUpdateTextAttributes", "onUpdateDocumentAttributes"]

    /**
     * 
     * @returns {HRESULT} 
     */
    onDestroy() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToInsert 
     * @returns {HRESULT} 
     */
    onInsertText(cCharacterPosition, cNumToInsert) {
        result := ComCall(4, this, "uint", cCharacterPosition, "uint", cNumToInsert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToRemove 
     * @returns {HRESULT} 
     */
    onRemoveText(cCharacterPosition, cNumToRemove) {
        result := ComCall(5, this, "uint", cCharacterPosition, "uint", cNumToRemove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToReplace 
     * @returns {HRESULT} 
     */
    onReplaceText(cCharacterPosition, cNumToReplace) {
        result := ComCall(6, this, "uint", cCharacterPosition, "uint", cNumToReplace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToUpdate 
     * @returns {HRESULT} 
     */
    onUpdateTextAttributes(cCharacterPosition, cNumToUpdate) {
        result := ComCall(7, this, "uint", cCharacterPosition, "uint", cNumToUpdate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textdocattr 
     * @returns {HRESULT} 
     */
    onUpdateDocumentAttributes(textdocattr) {
        result := ComCall(8, this, "uint", textdocattr, "HRESULT")
        return result
    }
}
