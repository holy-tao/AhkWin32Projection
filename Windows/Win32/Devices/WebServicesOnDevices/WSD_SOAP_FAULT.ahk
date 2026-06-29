#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_SOAP_FAULT_CODE.ahk" { WSD_SOAP_FAULT_CODE }
#Import ".\WSD_SOAP_FAULT_REASON.ahk" { WSD_SOAP_FAULT_REASON }

/**
 * Represents a generated SOAP fault.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_fault
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SOAP_FAULT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_code">WSD_SOAP_FAULT_CODE</a> structure that contains a SOAP fault code.
     */
    Code : WSD_SOAP_FAULT_CODE.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_reason">WSD_SOAP_FAULT_REASON</a> structure that contains localized human readable explanations of the fault.
     */
    Reason : WSD_SOAP_FAULT_REASON.Ptr

    /**
     * The SOAP node on the SOAP message path that caused the fault.
     */
    Node : PWSTR

    /**
     * The SOAP role in which the <b>Node</b> was acting at the time the fault occurred.
     */
    Role : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that contains application-specific error information pertaining to the fault.
     */
    Detail : WSDXML_ELEMENT.Ptr

}
