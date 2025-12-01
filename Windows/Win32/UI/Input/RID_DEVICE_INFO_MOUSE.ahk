#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the raw input data coming from the specified mouse.
 * @remarks
 * For the mouse, the Usage Page is 1 and the Usage is 2.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rid_device_info_mouse
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RID_DEVICE_INFO_MOUSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

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
     * @type {Integer}
     */
    dwId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of buttons for the mouse.
     * @type {Integer}
     */
    dwNumberOfButtons {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of data points per second. This information may not be applicable for every mouse device.
     * @type {Integer}
     */
    dwSampleRate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the mouse has a wheel for horizontal scrolling; otherwise, <b>FALSE</b>.
     * 
     * <b>Windows XP:</b> This member is only supported starting with Windows Vista.
     * @type {BOOL}
     */
    fHasHorizontalWheel {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
