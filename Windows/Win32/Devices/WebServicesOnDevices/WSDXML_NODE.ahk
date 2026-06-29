#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }

/**
 * Describes an XML node.
 * @remarks
 * <b>WSDXML_NODE</b> represents an arbitrary node within the DOM tree. Nodes are weakly typed; the <b>Type</b> member must be inspected to determine the actual type of the node, and the node pointer must then be cast to the structure of the appropriate type (see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_text">WSDXML_TEXT</a>) to obtain the node contents. <b>Parent</b> points to the containing element for the current node, and <b>Next</b> points to any nodes at the same level as the current node.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_node
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_NODE {
    #StructPack 8

    Type : Int32

    __Parent_ptr : IntPtr
    /**
     * Reference to the parent node in a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structures.
     */
    Parent {
        get => (addr := this.__Parent_ptr) ? WSDXML_ELEMENT.At(addr) : unset
        set => this.__Parent_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * Reference to the next node in the linked list of <b>WSDXML_NODE</b> structures.
     */
    Next : WSDXML_NODE.Ptr

    ElementType : Int32

    TextType : Int32

}
