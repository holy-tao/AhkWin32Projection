#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the raw input data coming from the specified keyboard.
 * @remarks
 * For information about keyboard types, subtypes, scan code modes, and related keyboard layouts, see the documentation in *kbd.h*, *ntdd8042.h* and *ntddkbd.h* headers in Windows SDK, and the [Keyboard Layout Samples](/samples/microsoft/windows-driver-samples/keyboard-layout-samples/).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rid_device_info_keyboard
 * @namespace Windows.Win32.UI.Input
 */
export default struct RID_DEVICE_INFO_KEYBOARD {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The type of keyboard. See [Remarks](#remarks).
     * 
     * | Value | Description                                          |
     * |:-----:|------------------------------------------------------|
     * |  0x4  | Enhanced 101- or 102-key keyboards (and compatibles) |
     * |  0x7  | Japanese Keyboard                                    |
     * |  0x8  | Korean Keyboard                                      |
     * | 0x51  | Unknown type or HID keyboard                         |
     */
    dwType : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The vendor-specific subtype of the keyboard. See [Remarks](#remarks).
     */
    dwSubType : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The scan code mode. Usually 1, which means that *Scan Code Set 1* is used. See [Keyboard Scan Code Specification](https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/scancode.doc).
     */
    dwKeyboardMode : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of function keys on the keyboard.
     */
    dwNumberOfFunctionKeys : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of LED indicators on the keyboard.
     */
    dwNumberOfIndicators : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The total number of keys on the keyboard.
     */
    dwNumberOfKeysTotal : UInt32

}
