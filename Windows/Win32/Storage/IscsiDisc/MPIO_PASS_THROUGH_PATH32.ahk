#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCSI_PASS_THROUGH32.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class MPIO_PASS_THROUGH_PATH32 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {SCSI_PASS_THROUGH32}
     */
    PassThrough{
        get {
            if(!this.HasProp("__PassThrough"))
                this.__PassThrough := SCSI_PASS_THROUGH32(0, this)
            return this.__PassThrough
        }
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 51, "char")
        set => NumPut("char", value, this, 51)
    }

    /**
     * @type {Integer}
     */
    MpioPathId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
