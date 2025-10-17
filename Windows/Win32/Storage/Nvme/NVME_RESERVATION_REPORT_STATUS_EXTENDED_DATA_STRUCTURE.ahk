#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_RESERVATION_REPORT_STATUS_HEADER.ahk
#Include .\NVME_REGISTERED_CONTROLLER_EXTENDED_DATA.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_REPORT_STATUS_EXTENDED_DATA_STRUCTURE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {NVME_RESERVATION_REPORT_STATUS_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NVME_RESERVATION_REPORT_STATUS_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 28, 40, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<NVME_REGISTERED_CONTROLLER_EXTENDED_DATA>}
     */
    RegisteredControllersExtendedData{
        get {
            if(!this.HasProp("__RegisteredControllersExtendedDataProxyArray"))
                this.__RegisteredControllersExtendedDataProxyArray := Win32FixedArray(this.ptr + 72, 1, NVME_REGISTERED_CONTROLLER_EXTENDED_DATA, "")
            return this.__RegisteredControllersExtendedDataProxyArray
        }
    }
}
