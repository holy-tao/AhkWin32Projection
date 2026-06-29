#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the minimum and maximum number of items that may appear when using WS_REPEATING_ELEMENT_FIELD_MAPPING, WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING, or WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING within a WS_FIELD_DESCRIPTION.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_item_range
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ITEM_RANGE {
    #StructPack 4

    /**
     * The minimum number of elements that must appear.
     */
    minItemCount : UInt32

    /**
     * The maximum number of items that may appear.
     */
    maxItemCount : UInt32

}
