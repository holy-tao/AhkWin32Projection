#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used for enumerating filters.
 * @remarks
 * 
 * <b>FWPM_FILTER_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_FILTER_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_filter_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_FILTER_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Uniquely identifies the provider associated with this filter.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Layer whose fields are to be enumerated.
     * @type {Pointer<Guid>}
     */
    layerKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A [FWP_FILTER_ENUM_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_filter_enum_type) value that determines how the filter conditions are interpreted.
     * @type {Integer}
     */
    enumType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_BEST_TERMINATING_MATCH_"></a><a id="fwp_filter_enum_flag_best_terminating_match_"></a><dl>
     * <dt><b>FWP_FILTER_ENUM_FLAG_BEST_TERMINATING_MATCH </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only return the terminating filter with the highest weight.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_SORTED"></a><a id="fwp_filter_enum_flag_sorted"></a><dl>
     * <dt><b>FWP_FILTER_ENUM_FLAG_SORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return all matching filters sorted by weight (highest to lowest).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY"></a><a id="fwp_filter_enum_flag_boottime_only"></a><dl>
     * <dt><b>FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return only boot-time filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_INCLUDE_BOOTTIME"></a><a id="fwp_filter_enum_flag_include_boottime"></a><dl>
     * <dt><b>FWP_FILTER_ENUM_FLAG_INCLUDE_BOOTTIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include boot-time filters; ignored if the <b>FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY</b> flag is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_FILTER_ENUM_FLAG_INCLUDE_DISABLED"></a><a id="fwp_filter_enum_flag_include_disabled"></a><dl>
     * <dt><b>FWP_FILTER_ENUM_FLAG_INCLUDE_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include disabled filters; ignored if the <b>FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY</b> flag is set.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0">FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</a> structure that is used to limit the number of filters enumerated. If non-<b>NULL</b>, only enumerate filters whose provider context matches the
     *    template.
     * @type {Pointer<FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0>}
     */
    providerContextTemplate {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Number of filter conditions. If zero, then all filters match.
     * @type {Integer}
     */
    numFilterConditions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of [FWPM_FILTER_CONDITION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0) structures that contain distinct filter conditions (duplicated filter conditions will generate an error).
     * @type {Pointer<FWPM_FILTER_CONDITION0>}
     */
    filterCondition {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Only filters whose action type contains at least one of the bits in
     *    <b>actionMask</b> will be returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore the filter's action type when
     *    enumerating.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_ACTION_FLAG_CALLOUT"></a><a id="fwp_action_flag_callout"></a><dl>
     * <dt><b>FWP_ACTION_FLAG_CALLOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate callouts only.
     * 
     * <div class="alert"><b>Note</b>  <b>calloutKey</b> must not be <b>NULL</b>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    actionMask {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Uniquely identifies the callout.
     * @type {Pointer<Guid>}
     */
    calloutKey {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
