#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information passed to a WH_CBT hook procedure, CBTProc, before a window is activated.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cbtactivatestruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CBTACTIVATESTRUCT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>BOOL</b>
     * 
     * This member is <b>TRUE</b> if a mouse click is causing the activation or <b>FALSE</b> if it is not.
     * @type {BOOL}
     */
    fMouse {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the active window.
     * @type {HWND}
     */
    hWndActive{
        get {
            if(!this.HasProp("__hWndActive"))
                this.__hWndActive := HWND(8, this)
            return this.__hWndActive
        }
    }
}
