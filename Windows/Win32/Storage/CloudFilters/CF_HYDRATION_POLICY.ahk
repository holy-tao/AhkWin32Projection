#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_HYDRATION_POLICY_PRIMARY.ahk" { CF_HYDRATION_POLICY_PRIMARY }
#Import ".\CF_HYDRATION_POLICY_MODIFIER.ahk" { CF_HYDRATION_POLICY_MODIFIER }

/**
 * Specifies the primary hydration policy and its modifier.
 * @remarks
 * The hydration policy allows a sync provider to control how placeholder files should be hydrated by the platform. It consists of a primary policy and a set of policy modifiers.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_hydration_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_HYDRATION_POLICY {
    #StructPack 2

    /**
     * The primary hydration policy.
     */
    Primary : CF_HYDRATION_POLICY_PRIMARY

    /**
     * The hydration policy modifier.
     */
    Modifier : CF_HYDRATION_POLICY_MODIFIER

}
