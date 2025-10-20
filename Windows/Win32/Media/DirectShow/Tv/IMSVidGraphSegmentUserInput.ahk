#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidGraphSegmentUserInput extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    Click() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DblClick() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} KeyCode 
     * @param {Integer} ShiftState 
     * @returns {HRESULT} 
     */
    KeyDown(KeyCode, ShiftState) {
        result := ComCall(5, this, "short*", KeyCode, "short", ShiftState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} KeyAscii 
     * @returns {HRESULT} 
     */
    KeyPress(KeyAscii) {
        result := ComCall(6, this, "short*", KeyAscii, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} KeyCode 
     * @param {Integer} ShiftState 
     * @returns {HRESULT} 
     */
    KeyUp(KeyCode, ShiftState) {
        result := ComCall(7, this, "short*", KeyCode, "short", ShiftState, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(8, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(9, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(10, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
