#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMDM\_PROP\_CONFIG structure describes a set of compatible property values across all the properties supported by the device for a particular format. This structure contains a number of property descriptions in an array of WMDM\_PROP\_DESC structures.
 * @remarks
 * The [**WMDM\_FORMAT\_CAPABILITY**](wmdm-format-capability.md) structure returned by [**IWMDMDevice3::GetFormatCapability**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-getformatcapability) for a particular format consists of a number of property configurations. **WMDM\_PROP\_CONFIG** structures describe those configurations.
 * 
 * A property configuration describes values for all the properties supported for a given format. The values of different properties in a single configuration are compatible with each other. For example, for an audio file, a configuration will include valid values of sample rate and valid values of the bit rate such that all combinations of these sample and bit rates can be played on the device.
 * 
 * The caller is required to free the memory used by **pPropDesc**. For an example of how to do this, see [**WMDM\_FORMAT\_CAPABILITY**](wmdm-format-capability.md).
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-prop-config
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_PROP_CONFIG extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Device's level of preference for this configuration. The lowest value indicates the most preferred configuration.
     * @type {Integer}
     */
    nPreference {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of property descriptions contained in this configuration. There is a single property description for each property supported for the specified format.
     * @type {Integer}
     */
    nPropDesc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to an array of [**WMDM\_PROP\_DESC**](wmdm-prop-desc.md) structures containing property descriptions. The size of the array is equal to the value of **nPropDesc**. The application must free this memory when finished with it.
     * @type {Pointer<WMDM_PROP_DESC>}
     */
    pPropDesc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
