#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INDICATOR_LIST.ahk" { INDICATOR_LIST }

/**
 * KEYBOARD_INDICATOR_TRANSLATION specifies a device-specific, variable length array of mappings between keyboard scan codes and LED indicators.
 * @remarks
 * This structure is used with an <a href="https://docs.microsoft.com/windows/desktop/api/ntddkbd/ni-ntddkbd-ioctl_keyboard_query_indicator_translation">IOCTL_KEYBOARD_QUERY_INDICATOR_TRANSLATION</a> request to obtain indicator translation information.
 * @see https://learn.microsoft.com/windows/win32/api/ntddkbd/ns-ntddkbd-keyboard_indicator_translation
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct KEYBOARD_INDICATOR_TRANSLATION {
    #StructPack 2

    /**
     * Specifies the number of elements in the <b>IndicatorList</b> array.
     */
    NumberOfIndicatorKeys : UInt16

    /**
     * Specifies a device-specific, variable-length array of INDICATOR_LIST structures.
     * 
     * 
     * ```
     * typedef struct _INDICATOR_LIST {
     *   USHORT  MakeCode;
     *   USHORT  IndicatorFlags;
     * } INDICATOR_LIST, *PINDICATOR_LIST;
     * ```
     */
    IndicatorList : INDICATOR_LIST[1]

}
