#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\STORAGE_FIRMWARE_SLOT_INFO.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class STORAGE_FIRMWARE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    UpgradeSupport{
        get {
            if(!this.HasProp("__UpgradeSupport"))
                this.__UpgradeSupport := BOOLEAN(this.ptr + 8)
            return this.__UpgradeSupport
        }
    }

    /**
     * @type {Integer}
     */
    SlotCount {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    ActiveSlot {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    PendingActivateSlot {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<STORAGE_FIRMWARE_SLOT_INFO>}
     */
    Slot{
        get {
            if(!this.HasProp("__SlotProxyArray"))
                this.__SlotProxyArray := Win32FixedArray(this.ptr + 16, 1, STORAGE_FIRMWARE_SLOT_INFO, "")
            return this.__SlotProxyArray
        }
    }
}
