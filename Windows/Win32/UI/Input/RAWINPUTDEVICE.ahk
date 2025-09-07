#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Defines information for the raw input devices.
 * @remarks
 * If <b>RIDEV_NOLEGACY</b> is set for a mouse or a keyboard, the system does not generate any legacy message for that device for the application. For example, if the mouse TLC is set with <b>RIDEV_NOLEGACY</b>, **WM_LBUTTONDOWN** and <a href="https://docs.microsoft.com/windows/win32/inputdev/mouse-input-notifications">related legacy mouse messages</a> are not generated. Likewise, if the keyboard TLC is set with <b>RIDEV_NOLEGACY</b>, **WM_KEYDOWN** and <a href="https://docs.microsoft.com/windows/win32/inputdev/keyboard-input-notifications">related legacy keyboard messages</a> are not generated.
  * 
  * If <b>RIDEV_REMOVE</b> is set and the <b>hwndTarget</b> member is not set to <b>NULL</b>, then [RegisterRawInputDevices](nf-winuser-registerrawinputdevices.md) function will fail.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rawinputdevice
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAWINPUTDEVICE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>USHORT</b>
     * 
     * [Top level collection](/windows-hardware/drivers/hid/top-level-collections) [Usage page](/windows-hardware/drivers/hid/hid-usages#usage-page) for the raw input device. See [HID Clients Supported in Windows](/windows-hardware/drivers/hid/hid-architecture#hid-clients-supported-in-windows) for details on possible values.
     * @type {Integer}
     */
    usUsagePage {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * [Top level collection](/windows-hardware/drivers/hid/top-level-collections) [Usage ID](/windows-hardware/drivers/hid/hid-usages#usage-id) for the raw input device. See [HID Clients Supported in Windows](/windows-hardware/drivers/hid/hid-architecture#hid-clients-supported-in-windows) for details on possible values.
     * @type {Integer}
     */
    usUsage {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the target window. If <b>NULL</b> it follows the keyboard focus.
     * @type {HWND}
     */
    hwndTarget{
        get {
            if(!this.HasProp("__hwndTarget"))
                this.__hwndTarget := HWND(this.ptr + 8)
            return this.__hwndTarget
        }
    }
}
