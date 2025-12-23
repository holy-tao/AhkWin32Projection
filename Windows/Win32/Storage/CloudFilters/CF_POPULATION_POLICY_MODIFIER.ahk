#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the population policy modifiers. This is a modifier that can be used with the primary policy:\_CF_POPULATION_POLICY_PRIMARY.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_population_policy_modifier
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_POPULATION_POLICY_MODIFIER extends Win32BitflagEnum{

    /**
     * No policy modifier.
     * @type {Integer (UInt16)}
     */
    static CF_POPULATION_POLICY_MODIFIER_NONE => 0
}
