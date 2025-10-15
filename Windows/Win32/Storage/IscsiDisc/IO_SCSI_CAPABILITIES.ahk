#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class IO_SCSI_CAPABILITIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaximumTransferLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MaximumPhysicalPages {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SupportedAsynchronousEvents {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    AlignmentMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOLEAN}
     */
    TaggedQueuing{
        get {
            if(!this.HasProp("__TaggedQueuing"))
                this.__TaggedQueuing := BOOLEAN(this.ptr + 20)
            return this.__TaggedQueuing
        }
    }

    /**
     * @type {BOOLEAN}
     */
    AdapterScansDown{
        get {
            if(!this.HasProp("__AdapterScansDown"))
                this.__AdapterScansDown := BOOLEAN(this.ptr + 21)
            return this.__AdapterScansDown
        }
    }

    /**
     * @type {BOOLEAN}
     */
    AdapterUsesPio{
        get {
            if(!this.HasProp("__AdapterUsesPio"))
                this.__AdapterUsesPio := BOOLEAN(this.ptr + 22)
            return this.__AdapterUsesPio
        }
    }
}
