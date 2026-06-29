#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_LOCALIZED_STRING_LIST.ahk" { WSD_LOCALIZED_STRING_LIST }

/**
 * Specifies metadata that is unique to a specific device.
 * @remarks
 * ThisDevice metadata follows this form:
 * 
 * 
 * 
 * 
 * ``` syntax
 * &lt;wsd:ThisDevice&gt;
 *     &lt;wsd:FriendlyName&gt;
 *         A. Datum WebWeigh Scale
 *     &lt;/wsd:FriendlyName&gt;
 *     &lt;wsd:FirmwareVersion&gt;
 *         2.53c
 *     &lt;/wsd:FirmwareVersion&gt;
 *     &lt;wsd:SerialNumber&gt;
 *         923450982349058
 *     &lt;/wsd:SerialNumber&gt;
 *  &lt;/wsd:ThisDevice&gt;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_this_device_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_THIS_DEVICE_METADATA {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that contains the list of localized friendly names for the device. It should be set to fewer than 256 characters.
     */
    FriendlyName : WSD_LOCALIZED_STRING_LIST.Ptr

    /**
     * The firmware version of the device. It should be set to fewer than 256 characters.
     */
    FirmwareVersion : PWSTR

    /**
     * The serial number of the device. It should be set to fewer than 256 characters.
     */
    SerialNumber : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that provides an extensible space for devices to add custom metadata to the device specific section. For example, you can use this to add a user-defined name for the device.
     */
    Any : WSDXML_ELEMENT.Ptr

}
