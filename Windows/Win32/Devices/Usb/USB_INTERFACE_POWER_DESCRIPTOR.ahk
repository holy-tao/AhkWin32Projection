#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_INTERFACE_POWER_DESCRIPTOR extends Win32Struct
{
    static sizeof => 15

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bDescriptorType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bmCapabilitiesFlags {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bBusPowerSavingD1 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bSelfPowerSavingD1 {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    bBusPowerSavingD2 {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    bSelfPowerSavingD2 {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    bBusPowerSavingD3 {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Integer}
     */
    bSelfPowerSavingD3 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TransitionTimeFromD1 {
        get => NumGet(this, 9, "ushort")
        set => NumPut("ushort", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    TransitionTimeFromD2 {
        get => NumGet(this, 11, "ushort")
        set => NumPut("ushort", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    TransitionTimeFromD3 {
        get => NumGet(this, 13, "ushort")
        set => NumPut("ushort", value, this, 13)
    }
}
