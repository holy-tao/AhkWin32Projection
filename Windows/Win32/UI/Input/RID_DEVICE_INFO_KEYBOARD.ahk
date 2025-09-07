#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the raw input data coming from the specified keyboard.
 * @remarks
 * For information about keyboard types, subtypes, scan code modes, and related keyboard layouts, see the documentation in *kbd.h*, *ntdd8042.h* and *ntddkbd.h* headers in Windows SDK, and the [Keyboard Layout Samples](/samples/microsoft/windows-driver-samples/keyboard-layout-samples/).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rid_device_info_keyboard
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RID_DEVICE_INFO_KEYBOARD extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

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
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The vendor-specific subtype of the keyboard. See [Remarks](#remarks).
     * @type {Integer}
     */
    dwSubType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The scan code mode. Usually 1, which means that *Scan Code Set 1* is used. See [Keyboard Scan Code Specification](https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/scancode.doc).
     * @type {Integer}
     */
    dwKeyboardMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of function keys on the keyboard.
     * @type {Integer}
     */
    dwNumberOfFunctionKeys {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of LED indicators on the keyboard.
     * @type {Integer}
     */
    dwNumberOfIndicators {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The total number of keys on the keyboard.
     * @type {Integer}
     */
    dwNumberOfKeysTotal {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
