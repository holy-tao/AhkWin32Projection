#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD.ahk
#Include .\DEVICEDUMP_STRUCTURE_VERSION.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICEDUMP_STORAGESTACK_PUBLIC_DUMP extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {DEVICEDUMP_STRUCTURE_VERSION}
     */
    Descriptor {
        get {
            if(!this.HasProp("__Descriptor"))
                this.__Descriptor := DEVICEDUMP_STRUCTURE_VERSION(0, this)
            return this.__Descriptor
        }
    }

    /**
     * @type {Integer}
     */
    dwReasonForCollection {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    cDriverName {
        get {
            if(!this.HasProp("__cDriverNameProxyArray"))
                this.__cDriverNameProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__cDriverNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    uiNumRecords {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD}
     */
    RecordArray {
        get {
            if(!this.HasProp("__RecordArrayProxyArray"))
                this.__RecordArrayProxyArray := Win32FixedArray(this.ptr + 40, 1, DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD, "")
            return this.__RecordArrayProxyArray
        }
    }
}
