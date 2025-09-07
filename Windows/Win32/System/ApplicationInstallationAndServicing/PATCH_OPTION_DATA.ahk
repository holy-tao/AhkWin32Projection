#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PATCH_OPTION_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfThisStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SymbolOptionFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PSTR}
     */
    NewFileSymbolPath{
        get {
            if(!this.HasProp("__NewFileSymbolPath"))
                this.__NewFileSymbolPath := PSTR(this.ptr + 8)
            return this.__NewFileSymbolPath
        }
    }

    /**
     * @type {Pointer<PSTR>}
     */
    OldFileSymbolPathArray {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ExtendedOptionFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SymLoadCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    SymLoadContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PATCH_INTERLEAVE_MAP>}
     */
    InterleaveMapArray {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MaxLzxWindowSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
