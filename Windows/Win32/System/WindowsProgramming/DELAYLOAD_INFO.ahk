#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DELAYLOAD_PROC_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DELAYLOAD_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<IMAGE_DELAYLOAD_DESCRIPTOR>}
     */
    DelayloadDescriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IMAGE_THUNK_DATA32>}
     */
    ThunkAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    TargetDllName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {DELAYLOAD_PROC_DESCRIPTOR}
     */
    TargetApiDescriptor{
        get {
            if(!this.HasProp("__TargetApiDescriptor"))
                this.__TargetApiDescriptor := DELAYLOAD_PROC_DESCRIPTOR(this.ptr + 32)
            return this.__TargetApiDescriptor
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    TargetModuleBase {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    Unused {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    LastError {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
