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
     * The Click event occurs when the user clicks a mouse button on a Windows Media Player control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-click
     */
    Click() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DblClick() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The KeyDown event occurs when a key is pressed. | KeyDown Event of the AxWindowsMediaPlayer Object
     * @remarks
     * The **nKeyCode** property specifies a physical key. The following tables show the possible values for the major keys on a standard keyboard.
     * 
     * Values for the main keys.
     * 
     * 
     * 
     * | Key                     | Value   |
     * |-------------------------|---------|
     * | A-Z                     | 65-90   |
     * | 0-9                     | 48-56   |
     * | F1-F12                  | 112-123 |
     * | ESC                     | 27      |
     * | TAB                     | 9       |
     * | CAPS LOCK               | 20      |
     * | SHIFT (left or right)   | 16      |
     * | CTRL (left or right)    | 17      |
     * | ALT (left or right)     | 18      |
     * | SPACE                   | 32      |
     * | BACKSPACE               | 8       |
     * | ENTER                   | 13      |
     * | Windows logo key, left  | 91      |
     * | Windows logo key, right | 92      |
     * | Application key         | 93      |
     * 
     * 
     * 
     *  
     * 
     * Values for the number pad keys.
     * 
     * 
     * 
     * | Key               | Value  |
     * |-------------------|--------|
     * | 0-9               | 96-105 |
     * | NUM LOCK          | 144    |
     * | DIVIDE (/)        | 111    |
     * | MULTIPLY (\*)     | 106    |
     * | SUBTRACT (-)      | 109    |
     * | ADD (+)           | 107    |
     * | SEPARATOR (Enter) | 108    |
     * | DECIMAL (.)       | 110    |
     * 
     * 
     * 
     *  
     * 
     * Values for the navigation keys.
     * 
     * 
     * 
     * | Key         | Value |
     * |-------------|-------|
     * | INSERT      | 45    |
     * | DELETE      | 46    |
     * | HOME        | 36    |
     * | END         | 35    |
     * | PAGE UP     | 33    |
     * | PAGE DOWN   | 34    |
     * | UP ARROW    | 38    |
     * | DOWN ARROW  | 40    |
     * | LEFT ARROW  | 37    |
     * | RIGHT ARROW | 39    |
     * @param {Pointer<Integer>} KeyCode 
     * @param {Integer} ShiftState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-keydown
     */
    KeyDown(KeyCode, ShiftState) {
        KeyCodeMarshal := KeyCode is VarRef ? "short*" : "ptr"

        result := ComCall(5, this, KeyCodeMarshal, KeyCode, "short", ShiftState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The KeyPress event occurs when a key is pressed and released. | KeyPress Event of the AxWindowsMediaPlayer Object
     * @remarks
     * This event occurs when the keystroke results in any printable keyboard character, the CTRL key combined with a character from the standard alphabet or one of a few special characters, and the ENTER or BACKSPACE key.
     * @param {Pointer<Integer>} KeyAscii 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-keypress
     */
    KeyPress(KeyAscii) {
        KeyAsciiMarshal := KeyAscii is VarRef ? "short*" : "ptr"

        result := ComCall(6, this, KeyAsciiMarshal, KeyAscii, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The KeyUp event occurs when a key is released. | KeyUp Event of the AxWindowsMediaPlayer Object
     * @param {Pointer<Integer>} KeyCode 
     * @param {Integer} ShiftState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-keyup
     */
    KeyUp(KeyCode, ShiftState) {
        KeyCodeMarshal := KeyCode is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, KeyCodeMarshal, KeyCode, "short", ShiftState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The MouseDown event occurs when the user presses a mouse button. | MouseDown Event of the AxWindowsMediaPlayer Object
     * @param {Integer} ButtonState 
     * @param {Integer} ShiftState 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-mousedown
     */
    MouseDown(ButtonState, ShiftState, x, y) {
        result := ComCall(8, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The MouseMove event occurs when the mouse pointer is moved. | MouseMove Event of the AxWindowsMediaPlayer Object
     * @param {Integer} ButtonState 
     * @param {Integer} ShiftState 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-mousemove
     */
    MouseMove(ButtonState, ShiftState, x, y) {
        result := ComCall(9, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The MouseUp event occurs when the user releases a mouse button. | MouseUp Event of the AxWindowsMediaPlayer Object
     * @param {Integer} ButtonState 
     * @param {Integer} ShiftState 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-mouseup
     */
    MouseUp(ButtonState, ShiftState, x, y) {
        result := ComCall(10, this, "short", ButtonState, "short", ShiftState, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
