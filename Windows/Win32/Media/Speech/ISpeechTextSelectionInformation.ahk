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
     * @type {Integer} 
     */
    ActiveOffset {
        get => this.get_ActiveOffset()
        set => this.put_ActiveOffset(value)
    }

    /**
     * @type {Integer} 
     */
    ActiveLength {
        get => this.get_ActiveLength()
        set => this.put_ActiveLength(value)
    }

    /**
     * @type {Integer} 
     */
    SelectionOffset {
        get => this.get_SelectionOffset()
        set => this.put_SelectionOffset(value)
    }

    /**
     * @type {Integer} 
     */
    SelectionLength {
        get => this.get_SelectionLength()
        set => this.put_SelectionLength(value)
    }

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
     * @returns {Integer} 
     */
    get_ActiveOffset() {
        result := ComCall(8, this, "int*", &ActiveOffset := 0, "HRESULT")
        return ActiveOffset
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
     * @returns {Integer} 
     */
    get_ActiveLength() {
        result := ComCall(10, this, "int*", &ActiveLength := 0, "HRESULT")
        return ActiveLength
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
     * @returns {Integer} 
     */
    get_SelectionOffset() {
        result := ComCall(12, this, "int*", &SelectionOffset := 0, "HRESULT")
        return SelectionOffset
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
     * @returns {Integer} 
     */
    get_SelectionLength() {
        result := ComCall(14, this, "int*", &SelectionLength := 0, "HRESULT")
        return SelectionLength
    }
}
