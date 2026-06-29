#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WMDM_PROP_CONFIG.ahk" { WMDM_PROP_CONFIG }

/**
 * The WMDM\_FORMAT\_CAPABILITY structure describes the capabilities of a device for a particular format.
 * @remarks
 * The **WMDM\_FORMAT\_CAPABILITY** structure provides a flexible mechanism to express the capabilities of the device for a particular format.
 * 
 * If the content is meant to be rendered by the device (for example, an audio file to be played by the device), the properties of the content must match one of the property configurations returned by [**IWMDMDevice3::GetFormatCapability**](/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-getformatcapability) in the **WMDM\_FORMAT\_CAPABILITY** structure. For example, for an audio file, the bit rate and sample rate must satisfy one of the property configurations returned.
 * 
 * The caller is responsible for freeing the memory allocated for this structure. The following function demonstrates how to clear a **WMDM\_FORMAT\_CAPABILITY** structure.
 * 
 * 
 * ```C++
 * void FreeFormatCapability(WMDM_FORMAT_CAPABILITY formatCap)
 * {
 *     // Loop through all configurations.
 *     for (UINT i=0; i < formatCap.nPropConfig; i++) 
 *     {
 *         // Loop through all descriptions of a configuration and delete
 *         // the values particular to that description type.
 *         for (UINT j=0; j < formatCap.pConfigs[i].nPropDesc; j++) 
 *         {
 *             switch (formatCap.pConfigs[i].pPropDesc[j].ValidValuesForm)
 *             {
 *                 case WMDM_ENUM_PROP_VALID_VALUES_ENUM:
 *                     for (UINT k=0; k < formatCap.pConfigs[i].pPropDesc[j].ValidValues.EnumeratedValidValues.cEnumValues; k++)
 *                     {
 *                         PropVariantClear (&(formatCap.pConfigs[i].pPropDesc[j].ValidValues.EnumeratedValidValues.pValues[k]));
 *                     }
 *                     CoTaskMemFree(formatCap.pConfigs[i].pPropDesc[j].ValidValues.EnumeratedValidValues.pValues);
 *                     break;
 *                 case WMDM_ENUM_PROP_VALID_VALUES_RANGE:
 *                     PropVariantClear (&(formatCap.pConfigs[i].pPropDesc[j].ValidValues.ValidValuesRange.rangeMin));
 *                     PropVariantClear (&(formatCap.pConfigs[i].pPropDesc[j].ValidValues.ValidValuesRange.rangeMax));
 *                     PropVariantClear (&(formatCap.pConfigs[i].pPropDesc[j].ValidValues.ValidValuesRange.rangeStep));
 *                     break;
 *                 case WMDM_ENUM_PROP_VALID_VALUES_ANY:
 *                     // No dynamically allocated memory for this value.
 *                 default:
 *                     break;
 *             }
 * 
 *             // Free the memory for the description name.
 *             CoTaskMemFree(formatCap.pConfigs[i].pPropDesc[j].pwszPropName);
 *         }
 *         // Free the memory holding the array of description items for this configuration.
 *         CoTaskMemFree(formatCap.pConfigs[i].pPropDesc);
 *     }
 * 
 *     // Free the memory pointing to the array of configurations.
 *     CoTaskMemFree(formatCap.pConfigs);
 *     formatCap.nPropConfig = 0;
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-format-capability
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_FORMAT_CAPABILITY {
    #StructPack 8

    /**
     * Number of property configurations in the **pConfigs** array.
     */
    nPropConfig : UInt32

    /**
     * Pointer to an array of [**WMDM\_PROP\_CONFIG**](wmdm-prop-config.md) structures. The size of array is equal to the value of **nPropConfig**.
     */
    pConfigs : WMDM_PROP_CONFIG.Ptr

}
