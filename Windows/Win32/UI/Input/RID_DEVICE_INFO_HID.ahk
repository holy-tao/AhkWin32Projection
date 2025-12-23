#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the raw input data coming from the specified Human Interface Device (HID).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rid_device_info_hid
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RID_DEVICE_INFO_HID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The vendor identifier for the HID.
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The product identifier for the HID.
     * @type {Integer}
     */
    dwProductId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The version number for the HID.
     * @type {Integer}
     */
    dwVersionNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * The top-level collection Usage Page for the device.
     * @type {Integer}
     */
    usUsagePage {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * The top-level collection Usage for the device.
     * @type {Integer}
     */
    usUsage {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
