#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCSI_BUS_DATA.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
class SCSI_ADAPTER_BUS_INFO extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfBuses {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {SCSI_BUS_DATA}
     */
    BusData {
        get {
            if(!this.HasProp("__BusDataProxyArray"))
                this.__BusDataProxyArray := Win32FixedArray(this.ptr + 4, 1, SCSI_BUS_DATA, "")
            return this.__BusDataProxyArray
        }
    }
}
