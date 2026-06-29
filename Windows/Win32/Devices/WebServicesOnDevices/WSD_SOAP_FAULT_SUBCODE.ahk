#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }

/**
 * Represents a generated SOAP fault subcode.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_subcode
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SOAP_FAULT_SUBCODE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that contains the  qualified name of the SOAP fault subcode.
     */
    Value : WSDXML_NAME.Ptr

    /**
     * A <b>WSD_SOAP_FAULT_SUBCODE</b> structure that contains a fault subcode.
     */
    Subcode : WSD_SOAP_FAULT_SUBCODE.Ptr

}
