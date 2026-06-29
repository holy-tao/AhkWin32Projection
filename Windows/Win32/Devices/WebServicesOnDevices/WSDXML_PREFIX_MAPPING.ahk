#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_NAMESPACE.ahk" { WSDXML_NAMESPACE }

/**
 * Describes an XML namespace prefix.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_prefix_mapping
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_PREFIX_MAPPING {
    #StructPack 8

    /**
     * The number of references to the mapping. When the value reaches zero, the mapping is deleted.
     */
    Refs : UInt32

    /**
     * Reference to the next node in a linked list of <b>WSDXML_PREFIX_MAPPING</b> structures.
     */
    Next : WSDXML_PREFIX_MAPPING.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_namespace">WSDXML_NAMESPACE</a> structure.
     */
    Space : WSDXML_NAMESPACE.Ptr

    /**
     * The text of the XML prefix.
     */
    Prefix : PWSTR

}
