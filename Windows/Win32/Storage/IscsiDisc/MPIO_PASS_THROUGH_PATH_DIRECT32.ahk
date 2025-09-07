#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCSI_PASS_THROUGH_DIRECT32.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class MPIO_PASS_THROUGH_PATH_DIRECT32 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {SCSI_PASS_THROUGH_DIRECT32}
     */
    PassThrough{
        get {
            if(!this.HasProp("__PassThrough"))
                this.__PassThrough := SCSI_PASS_THROUGH_DIRECT32(this.ptr + 0)
            return this.__PassThrough
        }
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 62, "char")
        set => NumPut("char", value, this, 62)
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 63, "char")
        set => NumPut("char", value, this, 63)
    }

    /**
     * @type {Integer}
     */
    MpioPathId {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
