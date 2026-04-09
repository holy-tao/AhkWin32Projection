#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_PD_FIRMWARE_SLOT_INFO.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_FIRMWARE_INFO extends Win32Struct {
    static sizeof => 60

    static packingSize => 4

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
     * @type {Integer}
     */
    ActiveSlot {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NextActiveSlot {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    SlotCount {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {SCM_PD_FIRMWARE_SLOT_INFO}
     */
    Slots {
        get {
            if(!this.HasProp("__SlotsProxyArray"))
                this.__SlotsProxyArray := Win32FixedArray(this.ptr + 12, 1, SCM_PD_FIRMWARE_SLOT_INFO, "")
            return this.__SlotsProxyArray
        }
    }
}
