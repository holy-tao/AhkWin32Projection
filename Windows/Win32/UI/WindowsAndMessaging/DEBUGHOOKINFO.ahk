#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include ..\..\Foundation\WPARAM.ahk

/**
 * Contains debugging information passed to a WH_DEBUG hook procedure, DebugProc.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-debughookinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DEBUGHOOKINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A handle to the thread containing the filter function.
     * @type {Integer}
     */
    idThread {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A handle to the thread that installed the debugging filter function.
     * @type {Integer}
     */
    idThreadInstaller {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * The value to be passed to the hook in the 
     * 					<i>lParam</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644978(v=vs.85)">DebugProc</a> callback function.
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 8)
            return this.__lParam
        }
    }

    /**
     * Type: <b>WPARAM</b>
     * 
     * The value to be passed to the hook in the 
     * 					<i>wParam</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644978(v=vs.85)">DebugProc</a> callback function.
     * @type {WPARAM}
     */
    wParam{
        get {
            if(!this.HasProp("__wParam"))
                this.__wParam := WPARAM(this.ptr + 16)
            return this.__wParam
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * The value to be passed to the hook in the 
     * 					<i>nCode</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644978(v=vs.85)">DebugProc</a> callback function.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
