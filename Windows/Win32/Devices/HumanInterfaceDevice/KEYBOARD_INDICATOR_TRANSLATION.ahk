#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INDICATOR_LIST.ahk

/**
 * KEYBOARD_INDICATOR_TRANSLATION specifies a device-specific, variable length array of mappings between keyboard scan codes and LED indicators.
 * @remarks
 * This structure is used with an <a href="https://docs.microsoft.com/windows/desktop/api/ntddkbd/ni-ntddkbd-ioctl_keyboard_query_indicator_translation">IOCTL_KEYBOARD_QUERY_INDICATOR_TRANSLATION</a> request to obtain indicator translation information.
 * @see https://learn.microsoft.com/windows/win32/api/ntddkbd/ns-ntddkbd-keyboard_indicator_translation
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class KEYBOARD_INDICATOR_TRANSLATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of elements in the <b>IndicatorList</b> array.
     * @type {Integer}
     */
    NumberOfIndicatorKeys {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

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
     * @type {Array<INDICATOR_LIST>}
     */
    IndicatorList{
        get {
            if(!this.HasProp("__IndicatorListProxyArray"))
                this.__IndicatorListProxyArray := Win32FixedArray(this.ptr + 8, 8, INDICATOR_LIST, "")
            return this.__IndicatorListProxyArray
        }
    }
}
