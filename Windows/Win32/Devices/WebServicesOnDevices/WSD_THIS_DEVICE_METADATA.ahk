#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies metadata that is unique to a specific device.
 * @remarks
 * 
 * ThisDevice metadata follows this form:
 * 
 * 
 * 
 * <pre class="syntax" xml:space="preserve"><code>&lt;wsd:ThisDevice&gt;
 *     &lt;wsd:FriendlyName&gt;
 *         A. Datum WebWeigh Scale
 *     &lt;/wsd:FriendlyName&gt;
 *     &lt;wsd:FirmwareVersion&gt;
 *         2.53c
 *     &lt;/wsd:FirmwareVersion&gt;
 *     &lt;wsd:SerialNumber&gt;
 *         923450982349058
 *     &lt;/wsd:SerialNumber&gt;
 *  &lt;/wsd:ThisDevice&gt;</code></pre>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_this_device_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_THIS_DEVICE_METADATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that contains the list of localized friendly names for the device. It should be set to fewer than 256 characters.
     * @type {Pointer<WSD_LOCALIZED_STRING_LIST>}
     */
    FriendlyName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The firmware version of the device. It should be set to fewer than 256 characters.
     * @type {PWSTR}
     */
    FirmwareVersion {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The serial number of the device. It should be set to fewer than 256 characters.
     * @type {PWSTR}
     */
    SerialNumber {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that provides an extensible space for devices to add custom metadata to the device specific section. For example, you can use this to add a user-defined name for the device.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Any {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
