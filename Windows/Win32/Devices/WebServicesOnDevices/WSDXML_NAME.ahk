#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_NAMESPACE.ahk" { WSDXML_NAMESPACE }

/**
 * Specifies an XML qualified name.
 * @remarks
 * <b>WSDXML_NAME</b> represents a single name within a namespace. The relationship between the name and namespace is circular, in that the <b>Space</b> pointer of the name points to the namespace the name belongs to, and the <b>Names</b> array of the namespace will have an entry for the name.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_name
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_NAME {
    #StructPack 8

    __Space_ptr : IntPtr
    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_namespace">WSDXML_NAMESPACE</a> structure that specifies the namespace of the qualified name.
     */
    Space {
        get => (addr := this.__Space_ptr) ? WSDXML_NAMESPACE.At(addr) : unset
        set => this.__Space_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * The local name of the qualified name.
     */
    LocalName : PWSTR

}
