#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_RESERVATION_REPORT_STATUS_HEADER.ahk
#Include .\NVME_REGISTERED_CONTROLLER_DATA.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_REPORT_STATUS_DATA_STRUCTURE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {NVME_RESERVATION_REPORT_STATUS_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NVME_RESERVATION_REPORT_STATUS_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Array<NVME_REGISTERED_CONTROLLER_DATA>}
     */
    RegisteredControllersData{
        get {
            if(!this.HasProp("__RegisteredControllersDataProxyArray"))
                this.__RegisteredControllersDataProxyArray := Win32FixedArray(this.ptr + 24, 8, NVME_REGISTERED_CONTROLLER_DATA, "")
            return this.__RegisteredControllersDataProxyArray
        }
    }
}
