#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the minimum and maximum number of items that may appear when using WS_REPEATING_ELEMENT_FIELD_MAPPING, WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING, or WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING within a WS_FIELD_DESCRIPTION.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_item_range
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ITEM_RANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The minimum number of elements that must appear.
     * @type {Integer}
     */
    minItemCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of items that may appear.
     * @type {Integer}
     */
    maxItemCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
