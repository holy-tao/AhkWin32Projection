#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCSI_BUS_DATA.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class SCSI_ADAPTER_BUS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfBuses {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<SCSI_BUS_DATA>}
     */
    BusData{
        get {
            if(!this.HasProp("__BusDataProxyArray"))
                this.__BusDataProxyArray := Win32FixedArray(this.ptr + 8, 1, SCSI_BUS_DATA, "")
            return this.__BusDataProxyArray
        }
    }
}
