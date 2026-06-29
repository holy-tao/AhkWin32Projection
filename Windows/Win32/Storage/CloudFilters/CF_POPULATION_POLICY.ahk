#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_POPULATION_POLICY_MODIFIER.ahk" { CF_POPULATION_POLICY_MODIFIER }
#Import ".\CF_POPULATION_POLICY_PRIMARY.ahk" { CF_POPULATION_POLICY_PRIMARY }

/**
 * Specifies the primary population policy and its modifier.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_population_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_POPULATION_POLICY {
    #StructPack 2

    /**
     * The primary population policy. See [CF_POPULATION_POLICY_PRIMARY](ne-cfapi-cf_population_policy_primary.md) for more information.
     */
    Primary : CF_POPULATION_POLICY_PRIMARY

    /**
     * The population policy modifier. See [CF_POPULATION_POLICY_MODIFIER](ne-cfapi-cf_population_policy_modifier.md) for more information.
     */
    Modifier : CF_POPULATION_POLICY_MODIFIER

}
