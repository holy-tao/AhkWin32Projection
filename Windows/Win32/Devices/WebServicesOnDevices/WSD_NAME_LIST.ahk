#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }

/**
 * Represents a node in a single-linked list of XML name structures.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_name_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_NAME_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the linked list of <b>WSD_NAME_LIST</b> structures.
     */
    Next : WSD_NAME_LIST.Ptr

    /**
     * The XML qualified name data referenced by this node.
     */
    Element : WSDXML_NAME.Ptr

}
