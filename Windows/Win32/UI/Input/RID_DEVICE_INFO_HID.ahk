#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the raw input data coming from the specified Human Interface Device (HID).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rid_device_info_hid
 * @namespace Windows.Win32.UI.Input
 */
export default struct RID_DEVICE_INFO_HID {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The vendor identifier for the HID.
     */
    dwVendorId : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The product identifier for the HID.
     */
    dwProductId : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The version number for the HID.
     */
    dwVersionNumber : UInt32

    /**
     * Type: <b>USHORT</b>
     * 
     * The top-level collection Usage Page for the device.
     */
    usUsagePage : UInt16

    /**
     * Type: <b>USHORT</b>
     * 
     * The top-level collection Usage for the device.
     */
    usUsage : UInt16

}
