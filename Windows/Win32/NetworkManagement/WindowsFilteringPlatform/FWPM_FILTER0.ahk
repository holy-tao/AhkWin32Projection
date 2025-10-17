#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\FWP_VALUE0.ahk
#Include .\FWPM_ACTION0.ahk

/**
 * Stores the state associated with a filter.
 * @remarks
 * 
  * The first ten members of this structure contain information supplied when adding objects.
  * 
  * The last members, <b>filterId</b> and <b>effectiveWeight</b>, provides additional information when getting/enumerating objects.
  * 
  * <b>FWPM_FILTER0</b> is a specific implementation of FWPM_FILTER. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_filter0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_FILTER0 extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Uniquely identifies the session. 
     * 
     * If the GUID is initialized to zero in the
     *    call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a>, the Base Filtering Engine (BFE) will generate one.
     * @type {Pointer<Guid>}
     */
    filterKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0) structure that contains human-readable annotations associated with the filter.  The <b>name</b> member of the <b>FWPM_DISPLAY_DATA0</b> structure is required.
     * @type {FWPM_DISPLAY_DATA0}
     */
    displayData{
        get {
            if(!this.HasProp("__displayData"))
                this.__displayData := FWPM_DISPLAY_DATA0(8, this)
            return this.__displayData
        }
    }

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Optional GUID of the policy provider that manages this filter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/built-in-provider-identifiers">Built-in Provider Identifiers</a> for a list of predefined policy providers.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that contains optional provider-specific data used by providers to store additional context information with the object.
     * @type {FWP_BYTE_BLOB}
     */
    providerData{
        get {
            if(!this.HasProp("__providerData"))
                this.__providerData := FWP_BYTE_BLOB(40, this)
            return this.__providerData
        }
    }

    /**
     * GUID of the layer where the filter resides. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible values.
     * @type {Pointer<Guid>}
     */
    layerKey {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * GUID of the sub-layer where the filter resides. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-sublayer-identifiers">Filtering Sub-Layer Identifiers</a> for a list of built-in sub-layers.
     * 
     * If this is set to IID_NULL, the filter is added to the default sublayer.
     * @type {Pointer<Guid>}
     */
    subLayerKey {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0) structure that specifies the weight of the filter. Possible type values for <b>weight</b> are as follows.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th><b>weight</b> type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_UINT64"></a><a id="fwp_uint64"></a><dl>
     * <dt><b>FWP_UINT64</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BFE will use the supplied value as the filter's weight.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_UINT8"></a><a id="fwp_uint8"></a><dl>
     * <dt><b>FWP_UINT8</b></dt>
     * <dt>0–15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BFE will use the supplied value as a weight range index and will compute the filter's weight in that range. See <a href="https://docs.microsoft.com/windows/desktop/FWP/filter-weight-assignment">Filter Weight Assignment</a> for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_EMPTY"></a><a id="fwp_empty"></a><dl>
     * <dt><b>FWP_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BFE will automatically assign a weight based on the
     *    filter conditions.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/FWP/filter-weight-identifiers">Filter Weight Identifiers</a> for built-in constants that may be used to compute the filter weight.
     * @type {FWP_VALUE0}
     */
    weight{
        get {
            if(!this.HasProp("__weight"))
                this.__weight := FWP_VALUE0(72, this)
            return this.__weight
        }
    }

    /**
     * Number of filter conditions.
     * @type {Integer}
     */
    numFilterConditions {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Array of  [FWPM_FILTER_CONDITION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0) structures that contain all the filtering conditions. All must be true for the action to be
     *    performed. In other words, the conditions are evaluated using the AND operator. If no
     *    conditions are specified, the action is always performed. 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7 and Windows Server 2008 R2, consecutive conditions with the same fieldKey will be evaluated using the OR operator. </div>
     * <div> </div>
     * @type {Pointer<FWPM_FILTER_CONDITION0>}
     */
    filterCondition {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A [FWPM_ACTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_action0) structure that specifies the action to be performed if all the filter conditions are true.
     * @type {FWPM_ACTION0}
     */
    action{
        get {
            if(!this.HasProp("__action"))
                this.__action := FWPM_ACTION0(104, this)
            return this.__action
        }
    }

    /**
     * @type {Integer}
     */
    rawContext {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Pointer<Guid>}
     */
    providerContextKey {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Reserved for system use.
     * @type {Pointer<Guid>}
     */
    reserved {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * LUID identifying the filter. This is also the LUID of the corresponding
     *    <b>FWPS_FILTER0</b> structure, which is documented in the WDK.
     * @type {Integer}
     */
    filterId {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * An [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0) structure that contains the weight assigned to <b>FWPS_FILTER0</b>, which is documented in the WDK.
     * @type {FWP_VALUE0}
     */
    effectiveWeight{
        get {
            if(!this.HasProp("__effectiveWeight"))
                this.__effectiveWeight := FWP_VALUE0(144, this)
            return this.__effectiveWeight
        }
    }
}
