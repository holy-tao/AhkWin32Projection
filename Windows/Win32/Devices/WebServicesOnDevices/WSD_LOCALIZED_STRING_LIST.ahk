#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_LOCALIZED_STRING.ahk" { WSD_LOCALIZED_STRING }

/**
 * Represents a node in a single-linked list of localized strings.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_LOCALIZED_STRING_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the linked list of <b>WSD_LOCALIZED_STRING_LIST</b> structures.
     */
    Next : WSD_LOCALIZED_STRING_LIST.Ptr

    /**
     * The localized string referenced by this node.
     */
    Element : WSD_LOCALIZED_STRING.Ptr

}
