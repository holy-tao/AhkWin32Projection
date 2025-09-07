#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICEDUMP_STRUCTURE_VERSION.ahk
#Include .\DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_STORAGESTACK_PUBLIC_DUMP extends Win32Struct
{
    static sizeof => 44

    static packingSize => 1

    /**
     * @type {DEVICEDUMP_STRUCTURE_VERSION}
     */
    Descriptor{
        get {
            if(!this.HasProp("__Descriptor"))
                this.__Descriptor := DEVICEDUMP_STRUCTURE_VERSION(this.ptr + 0)
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
     * @type {Array<Byte>}
     */
    cDriverName{
        get {
            if(!this.HasProp("__cDriverNameProxyArray"))
                this.__cDriverNameProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
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
     * @type {Array<DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD>}
     */
    RecordArray{
        get {
            if(!this.HasProp("__RecordArrayProxyArray"))
                this.__RecordArrayProxyArray := Win32FixedArray(this.ptr + 36, 8, DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD, "")
            return this.__RecordArrayProxyArray
        }
    }
}
