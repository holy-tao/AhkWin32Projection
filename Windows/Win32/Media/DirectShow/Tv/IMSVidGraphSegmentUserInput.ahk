#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidGraphSegmentUserInput extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidGraphSegmentUserInput
     * @type {Guid}
     */
    static IID => Guid("{301c060e-20d9-4587-9b03-f82ed9a9943c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Click", "DblClick", "KeyDown", "KeyPress", "KeyUp", "MouseDown", "MouseMove", "MouseUp"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Click() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DblClick() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} KeyCode 
     * @param {Integer} ShiftState 
     * @returns {HRESULT} 
     */
    KeyDown(KeyCode, ShiftState) {
        result := ComCall(5, this, "short*", KeyCode, "short", ShiftState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} KeyAscii 
     * @returns {HRESULT} 
     */
    KeyPress(KeyAscii) {
        result := ComCall(6, this, "short*", KeyAscii, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} KeyCode 
     * @param {Integer} ShiftState 
     * @returns {HRESULT} 
     */
    KeyUp(KeyCode, ShiftState) {
        result := ComCall(7, this, "short*", KeyCode, "short", ShiftState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ButtonState 
     * @param {Integer} ShiftState 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    MouseDown(ButtonState, ShiftState, x, y) {
        result := ComCall(8, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ButtonState 
     * @param {Integer} ShiftState 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    MouseMove(ButtonState, ShiftState, x, y) {
        result := ComCall(9, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ButtonState 
     * @param {Integer} ShiftState 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    MouseUp(ButtonState, ShiftState, x, y) {
        result := ComCall(10, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "HRESULT")
        return result
    }
}
