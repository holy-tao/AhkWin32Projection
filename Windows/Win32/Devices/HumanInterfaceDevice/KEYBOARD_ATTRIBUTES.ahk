#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KEYBOARD_ID.ahk" { KEYBOARD_ID }
#Import ".\KEYBOARD_TYPEMATIC_PARAMETERS.ahk" { KEYBOARD_TYPEMATIC_PARAMETERS }

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
 */
export default struct KEYBOARD_ATTRIBUTES {
    #StructPack 4

    /**
     * Specifies the keyboard type and subtype in a KEYBOARD_ID structure:
     * 
     * ```cpp
     * typedef struct _KEYBOARD_ID {
     *   UCHAR  Type;
     *   UCHAR  Subtype;
     * } KEYBOARD_ID, *PKEYBOARD_ID;
     * ```
     */
    KeyboardIdentifier : KEYBOARD_ID

    /**
     * Specifies the scan code mode. See the [Remarks](#remarks) section.
     */
    KeyboardMode : UInt16

    /**
     * Specifies the number of function keys that a keyboard supports.
     */
    NumberOfFunctionKeys : UInt16

    /**
     * Specifies the number of LED indicators that a keyboard supports.
     */
    NumberOfIndicators : UInt16

    /**
     * Specifies the number of keys that a keyboard supports.
     */
    NumberOfKeysTotal : UInt16

    /**
     * Specifies the size, in bytes, of the input data queue used by the keyboard port driver.
     */
    InputDataQueueLength : UInt32

    /**
     * Specifies the minimum possible value for the keyboard typematic rate and delay in a [KEYBOARD_TYPEMATIC_PARAMETERS](ns-ntddkbd-keyboard_typematic_parameters.md) structure.
     */
    KeyRepeatMinimum : KEYBOARD_TYPEMATIC_PARAMETERS

    /**
     * Specifies the maximum possible value for the keyboard typematic rate and delay in a [KEYBOARD_TYPEMATIC_PARAMETERS](ns-ntddkbd-keyboard_typematic_parameters.md) structure.
     */
    KeyRepeatMaximum : KEYBOARD_TYPEMATIC_PARAMETERS

}
