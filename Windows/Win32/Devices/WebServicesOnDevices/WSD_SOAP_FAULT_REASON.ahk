#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A collection of reason codes associated with a WSD_SOAP_FAULT.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_fault_reason
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SOAP_FAULT_REASON extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that contains a collection of localized reason codes.
     * @type {Pointer<WSD_LOCALIZED_STRING_LIST>}
     */
    Text {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
