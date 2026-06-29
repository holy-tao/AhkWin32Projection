#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_VALUE0.ahk" { FWP_VALUE0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWPM_FILTER_FLAGS.ahk" { FWPM_FILTER_FLAGS }
#Import ".\FWP_ACTION_TYPE.ahk" { FWP_ACTION_TYPE }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWPM_FILTER_CONDITION0.ahk" { FWPM_FILTER_CONDITION0 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWPM_ACTION0.ahk" { FWPM_ACTION0 }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }

/**
 * Stores the state associated with a filter.
 * @remarks
 * The first ten members of this structure contain information supplied when adding objects.
 * 
 * The last members, **filterId** and **effectiveWeight**, provides additional information when getting/enumerating objects.
 * 
 * **FWPM_FILTER0** is a specific implementation of FWPM_FILTER. See <a href="https://docs.microsoft.com/windows/win32/fwp/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_FILTER0 {
    #StructPack 8

    /**
     * Uniquely identifies the session. 
     * 
     * If the GUID is initialized to zero in the call to <a href="https://docs.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a>, the Base Filtering Engine (BFE) will generate one.
     */
    filterKey : Guid

    /**
     * A [FWPM_DISPLAY_DATA0](/windows/win32/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure that contains human-readable annotations associated with the filter. The **name** member of the **FWPM_DISPLAY_DATA0** structure is required.
     */
    displayData : FWPM_DISPLAY_DATA0

    flags : FWPM_FILTER_FLAGS

    /**
     * Optional GUID of the policy provider that manages this filter. See <a href="https://docs.microsoft.com/windows/win32/fwp/built-in-provider-identifiers">Built-in Provider Identifiers</a> for a list of predefined policy providers.
     */
    providerKey : Guid.Ptr

    /**
     * A [FWP_BYTE_BLOB](/windows/win32/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that contains optional provider-specific data used by providers to store additional context information with the object.
     */
    providerData : FWP_BYTE_BLOB

    /**
     * GUID of the layer where the filter resides. See <a href="https://docs.microsoft.com/windows/win32/fwp/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible values.
     */
    layerKey : Guid

    /**
     * GUID of the sub-layer where the filter resides. See <a href="https://docs.microsoft.com/windows/win32/fwp/management-filtering-sublayer-identifiers">Filtering Sub-Layer Identifiers</a> for a list of built-in sub-layers.
     * 
     * If this is set to IID_NULL, the filter is added to the default sublayer.
     */
    subLayerKey : Guid

    /**
     * A [FWP_VALUE0](/windows/win32/api/fwptypes/ns-fwptypes-fwp_value0) structure that specifies the weight of the filter. The weight indicates the priority of the filter, where higher-numbered weights have higher priorities (and will be evaluated before lower-weighted filters).
     * 
     * Possible type values for **weight** are as follows.
     * 
     * <table>
     * <tr>
     * <th>**weight** type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_UINT64"></a><a id="fwp_uint64"></a><dl>
     * <dt>**FWP_UINT64**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BFE will use the supplied value as the filter's weight.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_UINT8"></a><a id="fwp_uint8"></a><dl>
     * <dt>**FWP_UINT8**</dt>
     * <dt>0–15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BFE will use the supplied value as a weight range index and will compute the filter's weight in that range. See <a href="https://docs.microsoft.com/windows/win32/fwp/filter-weight-assignment">Filter Weight Assignment</a> for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_EMPTY"></a><a id="fwp_empty"></a><dl>
     * <dt>**FWP_EMPTY**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BFE will automatically assign a weight based on the
     *  filter conditions.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/fwp/filter-weight-identifiers">Filter Weight Identifiers</a> for built-in constants that may be used to compute the filter weight.
     */
    weight : FWP_VALUE0

    /**
     * Number of filter conditions.
     */
    numFilterConditions : UInt32

    /**
     * Array of [FWPM_FILTER_CONDITION0](/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0) structures that contain all the filtering conditions. All must be true for the action to be performed. In other words, the conditions are evaluated using the AND operator. If no conditions are specified, the action is always performed.
     * 
     * <div class="alert">**Note**  In Windows 7 and Windows Server 2008 R2, consecutive conditions with the same fieldKey will be evaluated using the OR operator. </div>
     * <div> </div>
     */
    filterCondition : FWPM_FILTER_CONDITION0.Ptr

    /**
     * A [FWPM_ACTION0](/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_action0) structure that specifies the action to be performed if all the filter conditions are true.
     */
    action : FWPM_ACTION0

    rawContext : Int64

    /**
     * Reserved for system use.
     */
    reserved : Guid.Ptr

    /**
     * LUID identifying the filter. This is also the LUID of the corresponding
     *  **FWPS_FILTER0** structure, which is documented in the WDK.
     */
    filterId : Int64

    /**
     * An [FWP_VALUE0](/windows/win32/api/fwptypes/ns-fwptypes-fwp_value0) structure that contains the weight assigned to **FWPS_FILTER0**, which is documented in the WDK.
     */
    effectiveWeight : FWP_VALUE0

    static __New() {
        DefineProp(this.Prototype, 'providerContextKey', { type: Guid, offset: 152 })
        this.DeleteProp("__New")
    }
}
