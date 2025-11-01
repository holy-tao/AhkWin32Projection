#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileopstructw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class SHFILEOPSTRUCTW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(0, this)
            return this.__hwnd
        }
    }

    /**
     * @type {Integer}
     */
    wFunc {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pFrom {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pTo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    fFlags {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    fAnyOperationsAborted {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Pointer<Void>}
     */
    hNameMappings {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {PWSTR}
     */
    lpszProgressTitle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
