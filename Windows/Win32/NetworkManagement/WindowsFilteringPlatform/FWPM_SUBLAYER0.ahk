#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores the state associated with a sublayer.
 * @remarks
 * <b>FWPM_SUBLAYER0</b> is a specific implementation of FWPM_SUBLAYER. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SUBLAYER0 {
    #StructPack 8

    /**
     * Uniquely identifies the sublayer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-sublayer-identifiers">Filtering Sublayer Identifiers</a> for a list of built-in sublayers.
     * 
     * If the GUID is zero-initialized in the call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>, the Base Filtering Engine (BFE) will generate one.
     */
    subLayerKey : Guid

    /**
     * Allows sublayers to be annotated in human-readable form.   The [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure is required.
     */
    displayData : FWPM_DISPLAY_DATA0

    /**
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Sublayer flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_SUBLAYER_FLAG_PERSISTENT"></a><a id="fwpm_sublayer_flag_persistent"></a><dl>
     * <dt><b>FWPM_SUBLAYER_FLAG_PERSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes sublayer to be persistent, surviving across BFE stop/start.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

    /**
     * Uniquely identifies the provider that manages this sublayer.
     */
    providerKey : Guid.Ptr

    /**
     * An [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that contains optional provider-specific data that allows providers to store additional context info with the object.
     */
    providerData : FWP_BYTE_BLOB

    /**
     * Weight of the sublayer. 
     * 
     * Higher-weighted sublayers are invoked first.
     */
    weight : UInt16

}
