#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_SOAP_FAULT_SUBCODE.ahk" { WSD_SOAP_FAULT_SUBCODE }
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }

/**
 * Represents a generated SOAP fault code.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_code
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SOAP_FAULT_CODE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that contains the  qualified name of the SOAP fault code.
     */
    Value : WSDXML_NAME.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_subcode">WSD_SOAP_FAULT_SUBCODE</a> structure that contains the fault subcode.
     */
    Subcode : WSD_SOAP_FAULT_SUBCODE.Ptr

}
