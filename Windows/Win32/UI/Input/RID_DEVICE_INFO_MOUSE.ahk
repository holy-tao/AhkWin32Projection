#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines the raw input data coming from the specified mouse.
 * @remarks
 * For the mouse, the Usage Page is 1 and the Usage is 2.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rid_device_info_mouse
 * @namespace Windows.Win32.UI.Input
 */
export default struct RID_DEVICE_INFO_MOUSE {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The bitfield of the mouse device identification properties:
     * 
     * | Value  | ntddmou.h constant         | Description                                                                            |
     * |:------:|----------------------------|----------------------------------------------------------------------------------------|
     * | 0x0080 | MOUSE\_HID\_HARDWARE       | [HID mouse](/windows-hardware/drivers/hid/keyboard-and-mouse-hid-client-drivers)       |
     * | 0x0100 | WHEELMOUSE\_HID\_HARDWARE  | [HID wheel mouse](/windows-hardware/drivers/hid/keyboard-and-mouse-hid-client-drivers) |
     * | 0x8000 | HORIZONTAL\_WHEEL\_PRESENT | Mouse with horizontal wheel                                                            |
     */
    dwId : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of buttons for the mouse.
     */
    dwNumberOfButtons : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of data points per second. This information may not be applicable for every mouse device.
     */
    dwSampleRate : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the mouse has a wheel for horizontal scrolling; otherwise, <b>FALSE</b>.
     * 
     * <b>Windows XP:</b> This member is only supported starting with Windows Vista.
     */
    fHasHorizontalWheel : BOOL

}
