#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_LOCALIZED_STRING_LIST.ahk" { WSD_LOCALIZED_STRING_LIST }

/**
 * A collection of reason codes associated with a WSD_SOAP_FAULT.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_reason
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SOAP_FAULT_REASON {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that contains a collection of localized reason codes.
     */
    Text : WSD_LOCALIZED_STRING_LIST.Ptr

}
