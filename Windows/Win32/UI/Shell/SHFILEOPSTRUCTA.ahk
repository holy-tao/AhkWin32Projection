#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class SHFILEOPSTRUCTA extends Win32Struct
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
     * @type {Pointer<SByte>}
     */
    pFrom {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<SByte>}
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
     * @type {PSTR}
     */
    lpszProgressTitle{
        get {
            if(!this.HasProp("__lpszProgressTitle"))
                this.__lpszProgressTitle := PSTR(this.ptr + 48)
            return this.__lpszProgressTitle
        }
    }
}
