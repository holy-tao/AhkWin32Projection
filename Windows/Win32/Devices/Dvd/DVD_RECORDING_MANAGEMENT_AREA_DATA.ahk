#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_RECORDING_MANAGEMENT_AREA_DATA extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    LastRecordedRMASectorNumber{
        get {
            if(!this.HasProp("__LastRecordedRMASectorNumberProxyArray"))
                this.__LastRecordedRMASectorNumberProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__LastRecordedRMASectorNumberProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    RMDBytes{
        get {
            if(!this.HasProp("__RMDBytesProxyArray"))
                this.__RMDBytesProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__RMDBytesProxyArray
        }
    }
}
