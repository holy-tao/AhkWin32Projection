#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class SCSI_INQUIRY_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PathId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TargetId {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Lun {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {BOOLEAN}
     */
    DeviceClaimed{
        get {
            if(!this.HasProp("__DeviceClaimed"))
                this.__DeviceClaimed := BOOLEAN(this.ptr + 3)
            return this.__DeviceClaimed
        }
    }

    /**
     * @type {Integer}
     */
    InquiryDataLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NextInquiryDataOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    InquiryData{
        get {
            if(!this.HasProp("__InquiryDataProxyArray"))
                this.__InquiryDataProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__InquiryDataProxyArray
        }
    }
}
