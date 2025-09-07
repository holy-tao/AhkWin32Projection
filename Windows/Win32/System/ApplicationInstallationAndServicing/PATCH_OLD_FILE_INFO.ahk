#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PATCH_OLD_FILE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfThisStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    OldFileNameA{
        get {
            if(!this.HasProp("__OldFileNameA"))
                this.__OldFileNameA := PSTR(this.ptr + 8)
            return this.__OldFileNameA
        }
    }

    /**
     * @type {PWSTR}
     */
    OldFileNameW{
        get {
            if(!this.HasProp("__OldFileNameW"))
                this.__OldFileNameW := PWSTR(this.ptr + 8)
            return this.__OldFileNameW
        }
    }

    /**
     * @type {HANDLE}
     */
    OldFileHandle{
        get {
            if(!this.HasProp("__OldFileHandle"))
                this.__OldFileHandle := HANDLE(this.ptr + 8)
            return this.__OldFileHandle
        }
    }

    /**
     * @type {Integer}
     */
    IgnoreRangeCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<PATCH_IGNORE_RANGE>}
     */
    IgnoreRangeArray {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RetainRangeCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<PATCH_RETAIN_RANGE>}
     */
    RetainRangeArray {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
