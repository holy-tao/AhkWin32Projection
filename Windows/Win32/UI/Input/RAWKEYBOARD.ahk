#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the state of the keyboard.
 * @remarks
 * 
 * For a **MakeCode** value [HID client mapper driver](/windows-hardware/drivers/hid/keyboard-and-mouse-hid-client-drivers) converts HID usages into scan codes according to [USB HID to PS/2 Scan Code Translation Table](https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf) (see **PS/2 Set 1 Make** column).
 * 
 * Older PS/2 keyboards actually transmit Scan Code Set 2 values down the wire from the keyboard to the keyboard port. These values are translated to Scan Code Set 1 by the i8042 port chip. Possible values are listed in [Keyboard Scan Code Specification](https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/scancode.doc) (see **Scan Code Table**).
 * 
 * <b>KEYBOARD_OVERRUN_MAKE_CODE</b> is a special **MakeCode** value sent when an invalid or unrecognizable combination of keys is pressed or the number of keys pressed exceeds the limit for this keyboard.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-rawkeyboard
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAWKEYBOARD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>USHORT</b>
     * 
     * Specifies the scan code (from Scan Code Set 1) associated with a key press. See Remarks.
     * @type {Integer}
     */
    MakeCode {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * Flags for scan code information. It can be one or more of the following:
     * 
     * | Value                | Meaning                          |
     * |----------------------|----------------------------------|
     * | **RI\_KEY\_MAKE** 0  | The key is down.                 |
     * | **RI\_KEY\_BREAK** 1 | The key is up.                   |
     * | **RI\_KEY\_E0** 2    | The scan code has the E0 prefix. |
     * | **RI\_KEY\_E1** 4    | The scan code has the E1 prefix. |
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * Reserved; must be zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * The corresponding [legacy virtual-key code](/windows/win32/inputdev/virtual-key-codes).
     * @type {Integer}
     */
    VKey {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The corresponding [legacy keyboard window message](/windows/win32/inputdev/keyboard-input-notifications), for example [WM_KEYDOWN](/windows/win32/inputdev/wm-keydown), [WM_SYSKEYDOWN](/windows/win32/inputdev/wm-syskeydown), and so forth.
     * @type {Integer}
     */
    Message {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The device-specific additional information for the event.
     * @type {Integer}
     */
    ExtraInformation {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
