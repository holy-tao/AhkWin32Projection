#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
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
                this.__hwnd := HWND(this.ptr + 0)
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
    pFrom{
        get {
            if(!this.HasProp("__pFrom"))
                this.__pFrom := PWSTR(this.ptr + 16)
            return this.__pFrom
        }
    }

    /**
     * @type {PWSTR}
     */
    pTo{
        get {
            if(!this.HasProp("__pTo"))
                this.__pTo := PWSTR(this.ptr + 24)
            return this.__pTo
        }
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
    fAnyOperationsAborted{
        get {
            if(!this.HasProp("__fAnyOperationsAborted"))
                this.__fAnyOperationsAborted := BOOL(this.ptr + 36)
            return this.__fAnyOperationsAborted
        }
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
    lpszProgressTitle{
        get {
            if(!this.HasProp("__lpszProgressTitle"))
                this.__lpszProgressTitle := PWSTR(this.ptr + 48)
            return this.__lpszProgressTitle
        }
    }
}
