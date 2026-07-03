#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\RAWINPUTDEVICE_FLAGS.ahk" { RAWINPUTDEVICE_FLAGS }

/**
 * Defines information for the raw input devices.
 * @remarks
 * If <b>RIDEV_NOLEGACY</b> is set for a mouse or a keyboard, the system does not generate any legacy message for that device for the application. For example, if the mouse TLC is set with <b>RIDEV_NOLEGACY</b>, **WM_LBUTTONDOWN** and <a href="https://docs.microsoft.com/windows/win32/inputdev/mouse-input-notifications">related legacy mouse messages</a> are not generated. Likewise, if the keyboard TLC is set with <b>RIDEV_NOLEGACY</b>, **WM_KEYDOWN** and <a href="https://docs.microsoft.com/windows/win32/inputdev/keyboard-input-notifications">related legacy keyboard messages</a> are not generated.
 * 
 * If <b>RIDEV_REMOVE</b> is set and the <b>hwndTarget</b> member is not set to <b>NULL</b>, then [RegisterRawInputDevices](nf-winuser-registerrawinputdevices.md) function will fail.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rawinputdevice
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAWINPUTDEVICE {
    #StructPack 8

    /**
     * Type: <b>USHORT</b>
     * 
     * [Top level collection](/windows-hardware/drivers/hid/top-level-collections) [Usage page](/windows-hardware/drivers/hid/hid-usages#usage-page) for the raw input device. See [HID Clients Supported in Windows](/windows-hardware/drivers/hid/hid-architecture#hid-clients-supported-in-windows) for details on possible values.
     */
    usUsagePage : UInt16

    /**
     * Type: <b>USHORT</b>
     * 
     * [Top level collection](/windows-hardware/drivers/hid/top-level-collections) [Usage ID](/windows-hardware/drivers/hid/hid-usages#usage-id) for the raw input device. See [HID Clients Supported in Windows](/windows-hardware/drivers/hid/hid-architecture#hid-clients-supported-in-windows) for details on possible values.
     */
    usUsage : UInt16

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : RAWINPUTDEVICE_FLAGS

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the target window. If <b>NULL</b> it follows the keyboard focus.
     */
    hwndTarget : HWND

}
