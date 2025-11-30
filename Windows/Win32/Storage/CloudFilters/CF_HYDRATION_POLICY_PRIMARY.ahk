#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Allows a sync provider to control how placeholder files should be hydrated by the platform. This is the primary policy.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_hydration_policy_primary
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_HYDRATION_POLICY_PRIMARY extends Win32Enum{

    /**
     * The same behavior as <b>CF_HYDRATION_POLICY_PROGRESSIVE</b>, except that <b>CF_HYDRATION_POLICY_PARTIAL</b> does not have continuous hydration in the background.
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_PARTIAL => 0

    /**
     * When <b>CF_HYDRATION_POLICY_PROGRESSIVE</b> is selected, the platform will allow a placeholder to be dehydrated. When the platform detects access to a dehydrated placeholder, it will complete the user IO request as soon as it determines that sufficient data is received from the sync provider. However, the platform will continue requesting the remaining content in the placeholder from the sync provider in the background until either the full content of the placeholder is available locally, or the last user handle on the placeholder is closed.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">Sync providers who opt in for <b>CF_HYDRATION_POLICY_PROGRESSIVE</b> may not assume that hydration callbacks arrive sequentially from offset 0. In other words, sync providers with <b>CF_HYDRATION_POLICY_PROGRESSIVE</b> policy are expected to handle random seeks on the placeholder.
     * 
     * </div>
     * <div> </div>
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_PROGRESSIVE => 1

    /**
     * When <b>CF_HYDRATION_POLICY_FULL</b> is selected, the platform will allow a placeholder to be dehydrated. When the platform detects access to a dehydrated placeholder, it will ensure that the full content of the placeholder is available locally before completing the user IO request, even if the request is only asking for 1 byte.
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_FULL => 2

    /**
     * When <b>CF_HYDRATION_POLICY_ALWAYS_FULL</b> is selected, the platform will block any placeholder operation that could result in a not fully hydrated placeholder, which includes <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfcreateplaceholders">CfCreatePlaceholders</a>, <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfupdateplaceholder">CfUpdatePlaceholder</a> with the dehydrate option, and <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfconverttoplaceholder">CfConvertToPlaceholder</a> with the dehydrate option.
     * @type {Integer (UInt16)}
     */
    static CF_HYDRATION_POLICY_ALWAYS_FULL => 3
}
