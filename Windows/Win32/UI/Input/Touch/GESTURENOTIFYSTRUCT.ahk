#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINTS.ahk

/**
 * When transmitted with WM_GESTURENOTIFY messages, passes information about a gesture.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-gesturenotifystruct
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class GESTURENOTIFYSTRUCT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The target window for the gesture notification.
     * @type {HWND}
     */
    hwndTarget{
        get {
            if(!this.HasProp("__hwndTarget"))
                this.__hwndTarget := HWND(8, this)
            return this.__hwndTarget
        }
    }

    /**
     * The location of the gesture in physical screen coordinates.
     * @type {POINTS}
     */
    ptsLocation{
        get {
            if(!this.HasProp("__ptsLocation"))
                this.__ptsLocation := POINTS(16, this)
            return this.__ptsLocation
        }
    }

    /**
     * A specific gesture instance with gesture messages starting with <b>GID_START</b> and ending with <b>GID_END</b>.
     * @type {Integer}
     */
    dwInstanceID {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
