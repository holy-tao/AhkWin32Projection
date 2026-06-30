#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KBUGCHECK_SECONDARY_DUMP_DATA extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    InBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    InBufferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MaximumAllowed {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(16, this)
            return this.__Guid
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    OutBuffer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    OutBufferLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
