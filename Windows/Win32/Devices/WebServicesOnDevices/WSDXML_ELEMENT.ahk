#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ATTRIBUTE.ahk" { WSDXML_ATTRIBUTE }
#Import ".\WSDXML_PREFIX_MAPPING.ahk" { WSDXML_PREFIX_MAPPING }
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }
#Import ".\WSDXML_NODE.ahk" { WSDXML_NODE }

/**
 * Describes an XML element.
 * @remarks
 * <b>WSDXML_ELEMENT</b> represents an XML element in the DOM tree. The <b>Name</b> member can be used to determine the name and namespace of this element. <b>FirstAttribute</b> points to any attributes, and <b>FirstChild</b> points to anything contained within the element.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_element
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_ELEMENT {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_node">WSDXML_NODE</a> structure that specifies the parent element, next sibling and type of the node.
     */
    Node : WSDXML_NODE

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies name.
     */
    Name : WSDXML_NAME.Ptr

    __FirstAttribute_ptr : IntPtr
    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_attribute">WSDXML_ATTRIBUTE</a> structure that specifies the first attribute.
     */
    FirstAttribute {
        get => (addr := this.__FirstAttribute_ptr) ? WSDXML_ATTRIBUTE.At(addr) : unset
        set => this.__FirstAttribute_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __FirstChild_ptr : IntPtr
    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_node">WSDXML_NODE</a> structure that specifies the first child.
     */
    FirstChild {
        get => (addr := this.__FirstChild_ptr) ? WSDXML_NODE.At(addr) : unset
        set => this.__FirstChild_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_prefix_mapping">WSDXML_PREFIX_MAPPING</a> structure that specifies the prefix mappings.
     */
    PrefixMappings : WSDXML_PREFIX_MAPPING.Ptr

}
