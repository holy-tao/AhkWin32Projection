#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KEYBOARD_ID.ahk
#Include .\KEYBOARD_TYPEMATIC_PARAMETERS.ahk

/**
 * KEYBOARD_ATTRIBUTES specifies the attributes of a keyboard.
 * @remarks
 * This structure is used with a [IOCTL_KEYBOARD_QUERY_ATTRIBUTES IOCTL](ni-ntddkbd-ioctl_keyboard_query_attributes.md) request to return information about the attributes that a keyboard supports.
 * 
 * For more information about keyboard types, subtypes, scan code modes, and related keyboard layouts, see [Keyboard and mouse HID client drivers](/windows-hardware/drivers/hid/keyboard-and-mouse-hid-client-drivers) in our drivers documentation.
 * 
 * More details can also be found in the *kbd.h*, *ntdd8042.h* and *ntddkbd.h* headers in the Windows SDK, the [USB HID to PS/2 Scan Code Translation Table](https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf) specification from Microsoft, and the [Keyboard Layout Samples](/samples/microsoft/windows-driver-samples/keyboard-layout-samples/).
 * @see https://learn.microsoft.com/windows/win32/api/ntddkbd/ns-ntddkbd-keyboard_attributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class KEYBOARD_ATTRIBUTES extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Specifies the keyboard type and subtype in a KEYBOARD_ID structure:
     * 
     * ```cpp
     * typedef struct _KEYBOARD_ID {
     *   UCHAR  Type;
     *   UCHAR  Subtype;
     * } KEYBOARD_ID, *PKEYBOARD_ID;
     * ```
     * @type {KEYBOARD_ID}
     */
    KeyboardIdentifier{
        get {
            if(!this.HasProp("__KeyboardIdentifier"))
                this.__KeyboardIdentifier := KEYBOARD_ID(0, this)
            return this.__KeyboardIdentifier
        }
    }

    /**
     * Specifies the scan code mode. See the [Remarks](#remarks) section.
     * @type {Integer}
     */
    KeyboardMode {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies the number of function keys that a keyboard supports.
     * @type {Integer}
     */
    NumberOfFunctionKeys {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the number of LED indicators that a keyboard supports.
     * @type {Integer}
     */
    NumberOfIndicators {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Specifies the number of keys that a keyboard supports.
     * @type {Integer}
     */
    NumberOfKeysTotal {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Specifies the size, in bytes, of the input data queue used by the keyboard port driver.
     * @type {Integer}
     */
    InputDataQueueLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the minimum possible value for the keyboard typematic rate and delay in a [KEYBOARD_TYPEMATIC_PARAMETERS](ns-ntddkbd-keyboard_typematic_parameters.md) structure.
     * @type {KEYBOARD_TYPEMATIC_PARAMETERS}
     */
    KeyRepeatMinimum{
        get {
            if(!this.HasProp("__KeyRepeatMinimum"))
                this.__KeyRepeatMinimum := KEYBOARD_TYPEMATIC_PARAMETERS(16, this)
            return this.__KeyRepeatMinimum
        }
    }

    /**
     * Specifies the maximum possible value for the keyboard typematic rate and delay in a [KEYBOARD_TYPEMATIC_PARAMETERS](ns-ntddkbd-keyboard_typematic_parameters.md) structure.
     * @type {KEYBOARD_TYPEMATIC_PARAMETERS}
     */
    KeyRepeatMaximum{
        get {
            if(!this.HasProp("__KeyRepeatMaximum"))
                this.__KeyRepeatMaximum := KEYBOARD_TYPEMATIC_PARAMETERS(22, this)
            return this.__KeyRepeatMaximum
        }
    }
}
