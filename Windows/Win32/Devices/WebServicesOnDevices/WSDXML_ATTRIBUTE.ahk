#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }

/**
 * Describes an XML attribute.
 * @remarks
 * <b>WSDXML_ATTRIBUTE</b> is used to describe attribute values in an XML element.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_attribute
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_ATTRIBUTE {
    #StructPack 8

    __Element_ptr : IntPtr
    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies parent element of the attribute.
     */
    Element {
        get => (addr := this.__Element_ptr) ? WSDXML_ELEMENT.At(addr) : unset
        set => this.__Element_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * Reference to a <b>WSDXML_ATTRIBUTE</b> structure that specifies the next sibling attribute, if any.
     */
    Next : WSDXML_ATTRIBUTE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the qualified name of the attribute.
     */
    Name : WSDXML_NAME.Ptr

    /**
     * The value of the attribute.
     */
    Value : PWSTR

}
