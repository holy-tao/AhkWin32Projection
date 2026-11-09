#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CXL_COMMON_EVENT_RECORD_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_COMMON_EVENT_RECORD extends Win32Struct {
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {CXL_COMMON_EVENT_RECORD_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := CXL_COMMON_EVENT_RECORD_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Array<Integer>}
     */
    EventRecordData {
        get {
            if(!this.HasProp("__EventRecordDataProxyArray"))
                this.__EventRecordDataProxyArray := Win32FixedArray(this.ptr + 48, 80, Primitive, "char")
            return this.__EventRecordDataProxyArray
        }
    }
}
