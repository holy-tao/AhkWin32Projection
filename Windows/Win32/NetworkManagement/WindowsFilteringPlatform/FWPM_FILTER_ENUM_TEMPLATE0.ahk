#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_FILTER_ENUM_TYPE.ahk" { FWP_FILTER_ENUM_TYPE }
#Import ".\FWPM_FILTER_CONDITION0.ahk" { FWPM_FILTER_CONDITION0 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0.ahk" { FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0 }

/**
 * Is used for enumerating filters.
 * @remarks
 * **FWPM_FILTER_ENUM_TEMPLATE0** is a specific implementation of FWPM_FILTER_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/win32/fwp/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_FILTER_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * Uniquely identifies the provider associated with this filter.
     */
    providerKey : Guid.Ptr

    /**
     * Layer whose fields are to be enumerated.
     */
    layerKey : Guid

    /**
     * A [FWP_FILTER_ENUM_TYPE](/windows/win32/api/fwptypes/ne-fwptypes-fwp_filter_enum_type) value that determines how the filter conditions are interpreted.
     */
    enumType : FWP_FILTER_ENUM_TYPE

    /**
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_BEST_TERMINATING_MATCH_"></a><a id="fwp_filter_enum_flag_best_terminating_match_"></a><dl>
     * <dt>**FWP_FILTER_ENUM_FLAG_BEST_TERMINATING_MATCH **</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only return the terminating filter with the highest weight.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_SORTED"></a><a id="fwp_filter_enum_flag_sorted"></a><dl>
     * <dt>**FWP_FILTER_ENUM_FLAG_SORTED**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return all matching filters sorted by weight (highest to lowest).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY"></a><a id="fwp_filter_enum_flag_boottime_only"></a><dl>
     * <dt>**FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return only boot-time filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_INCLUDE_BOOTTIME"></a><a id="fwp_filter_enum_flag_include_boottime"></a><dl>
     * <dt>**FWP_FILTER_ENUM_FLAG_INCLUDE_BOOTTIME**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include boot-time filters; ignored if the **FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY** flag is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_INCLUDE_DISABLED"></a><a id="fwp_filter_enum_flag_include_disabled"></a><dl>
     * <dt>**FWP_FILTER_ENUM_FLAG_INCLUDE_DISABLED**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include disabled filters; ignored if the **FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY** flag is set.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0">FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</a> structure that is used to limit the number of filters enumerated. If non-**NULL**, only enumerate filters whose provider context matches the template.
     */
    providerContextTemplate : FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0.Ptr

    /**
     * Number of filter conditions. If zero, then all filters match.
     */
    numFilterConditions : UInt32

    /**
     * An array of [FWPM_FILTER_CONDITION0](/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0) structures that contain distinct filter conditions (duplicated filter conditions will generate an error).
     */
    filterCondition : FWPM_FILTER_CONDITION0.Ptr

    /**
     * Only filters whose action type contains at least one of the bits in **actionMask** will be returned. Using the **FWP_ACTION_** constants directly may not work as intended since they contain multiple bits. Some common examples are in the table below (**^** represents the logical XOR operator).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     *  
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>FWP_ACTION_BLOCK ^ FWP_ACTION_FLAG_TERMINATING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Enumerate filters that have an **FWP_ACTION_BLOCK** action.
     *  </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>FWP_ACTION_PERMIT ^ FWP_ACTION_FLAG_TERMINATING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Enumerate filters that have an **FWP_ACTION_PERMIT** action.
     *  </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%"><a id="FWP_ACTION_FLAG_CALLOUT"></a><a id="fwp_action_flag_callout"></a><dl>
     * <dt>**FWP_ACTION_FLAG_CALLOUT**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate filters that reference callout drivers.
     * <div class="alert">**Note**  **calloutKey** must not be **NULL**.</div>
     * <div> </div>
     * </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore the filter's action type when enumerating.
     * </td>
     * </tr>
     * 
     * </table>
     */
    actionMask : UInt32

    /**
     * Uniquely identifies the callout.
     */
    calloutKey : Guid.Ptr

}
