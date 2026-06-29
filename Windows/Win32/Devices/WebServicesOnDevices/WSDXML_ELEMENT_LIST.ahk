#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }

/**
 * Represents a node in a linked list of XML elements.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_element_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_ELEMENT_LIST {
    #StructPack 8

    /**
     * Reference to the next node in the linked list of <b>WSDXML_ELEMENT_LIST</b> structures.
     */
    Next : WSDXML_ELEMENT_LIST.Ptr

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure referenced by this node.
     */
    Element : WSDXML_ELEMENT.Ptr

}
