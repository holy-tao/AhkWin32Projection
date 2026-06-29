#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents a node in a linked list of URIs.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_uri_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_URI_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the single-linked list of <b>WSD_URI_LIST</b> structures.
     */
    Next : WSD_URI_LIST.Ptr

    /**
     * The URI referenced by this node.
     */
    Element : PWSTR

}
