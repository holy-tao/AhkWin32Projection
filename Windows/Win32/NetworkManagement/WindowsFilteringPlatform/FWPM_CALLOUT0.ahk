#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores the state associated with a callout.
 * @remarks
 * The first six members of this structure contain data supplied when adding objects.
 * 
 * The last member, <b>calloutId</b>, provides additional information returned when getting/enumerating objects.
 * 
 * <b>FWPM_CALLOUT0</b> is a specific implementation of FWPM_CALLOUT. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CALLOUT0 {
    #StructPack 8

    /**
     * Uniquely identifies the session. 
     * 
     * If the GUID is initialized to zero in the
     *    call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a>, the base filtering engine (BFE) will generate one.
     */
    calloutKey : Guid

    /**
     * A [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure that contains human-readable annotations associated with the callout.  The <b>name</b> member of the <b>FWPM_DISPLAY_DATA0</b> structure is required.
     */
    displayData : FWPM_DISPLAY_DATA0

    /**
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CALLOUT_FLAG_PERSISTENT"></a><a id="fwpm_callout_flag_persistent"></a><dl>
     * <dt><b>FWPM_CALLOUT_FLAG_PERSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout is persistent across reboots. As a result, it can be referenced by boot-time and other persistent filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CALLOUT_FLAG_USES_PROVIDER_CONTEXT"></a><a id="fwpm_callout_flag_uses_provider_context"></a><dl>
     * <dt><b>FWPM_CALLOUT_FLAG_USES_PROVIDER_CONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout needs access to the provider context stored in the filter invoking the callout.  If this flag is set, the provider context will be copied from the [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0) structure to the <b>FWPS_FILTER0</b> 
     * structure. The <b>FWPS_FILTER0</b> structure is documented in the WDK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CALLOUT_FLAG_REGISTERED"></a><a id="fwpm_callout_flag_registered"></a><dl>
     * <dt><b>FWPM_CALLOUT_FLAG_REGISTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callout is currently registered in the kernel.  This flag must not be set when adding new callouts.  It is used only in querying the state of existing callouts.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

    /**
     * Uniquely identifies the provider associated with the callout. If the member is non-NULL, only objects associated with the specified provider will be returned.
     */
    providerKey : Guid.Ptr

    /**
     * A [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that contains optional provider-specific data that allows providers to store additional context information with the object.
     */
    providerData : FWP_BYTE_BLOB

    /**
     * Specifies the layer in which the callout can be used. Only filters in this layer can invoke the callout. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a>.
     */
    applicableLayer : Guid

    /**
     * LUID identifying the callout. This is the <b>calloutId</b> stored in the
     *    <b>FWPS_ACTION0</b> structure for filters that invoke a callout. The <b>FWPS_ACTION0</b> structure is documented in the WDK.
     */
    calloutId : UInt32

}
