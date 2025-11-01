#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechTextSelectionInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechTextSelectionInformation
     * @type {Guid}
     */
    static IID => Guid("{3b9c7e7a-6eee-4ded-9092-11657279adbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ActiveOffset", "get_ActiveOffset", "put_ActiveLength", "get_ActiveLength", "put_SelectionOffset", "get_SelectionOffset", "put_SelectionLength", "get_SelectionLength"]

    /**
     * 
     * @param {Integer} ActiveOffset 
     * @returns {HRESULT} 
     */
    put_ActiveOffset(ActiveOffset) {
        result := ComCall(7, this, "int", ActiveOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ActiveOffset 
     * @returns {HRESULT} 
     */
    get_ActiveOffset(ActiveOffset) {
        result := ComCall(8, this, "int*", ActiveOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ActiveLength 
     * @returns {HRESULT} 
     */
    put_ActiveLength(ActiveLength) {
        result := ComCall(9, this, "int", ActiveLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ActiveLength 
     * @returns {HRESULT} 
     */
    get_ActiveLength(ActiveLength) {
        result := ComCall(10, this, "int*", ActiveLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SelectionOffset 
     * @returns {HRESULT} 
     */
    put_SelectionOffset(SelectionOffset) {
        result := ComCall(11, this, "int", SelectionOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SelectionOffset 
     * @returns {HRESULT} 
     */
    get_SelectionOffset(SelectionOffset) {
        result := ComCall(12, this, "int*", SelectionOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SelectionLength 
     * @returns {HRESULT} 
     */
    put_SelectionLength(SelectionLength) {
        result := ComCall(13, this, "int", SelectionLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SelectionLength 
     * @returns {HRESULT} 
     */
    get_SelectionLength(SelectionLength) {
        result := ComCall(14, this, "int*", SelectionLength, "HRESULT")
        return result
    }
}
