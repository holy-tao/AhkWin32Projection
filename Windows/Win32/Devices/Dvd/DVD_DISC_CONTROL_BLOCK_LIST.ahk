#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_DISC_CONTROL_BLOCK_HEADER.ahk
#Include .\DVD_DISC_CONTROL_BLOCK_LIST_DCB.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DISC_CONTROL_BLOCK_LIST extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {DVD_DISC_CONTROL_BLOCK_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DVD_DISC_CONTROL_BLOCK_HEADER(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ReadabldDCBs {
        get => NumGet(this, 41, "char")
        set => NumPut("char", value, this, 41)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 42, "char")
        set => NumPut("char", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    WritableDCBs {
        get => NumGet(this, 43, "char")
        set => NumPut("char", value, this, 43)
    }

    /**
     * @type {Array<DVD_DISC_CONTROL_BLOCK_LIST_DCB>}
     */
    Dcbs{
        get {
            if(!this.HasProp("__DcbsProxyArray"))
                this.__DcbsProxyArray := Win32FixedArray(this.ptr + 48, 1, DVD_DISC_CONTROL_BLOCK_LIST_DCB, "")
            return this.__DcbsProxyArray
        }
    }
}
