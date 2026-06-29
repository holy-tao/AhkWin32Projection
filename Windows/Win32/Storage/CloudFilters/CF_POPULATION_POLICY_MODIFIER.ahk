#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the population policy modifiers. This is a modifier that can be used with the primary policy:\_CF_POPULATION_POLICY_PRIMARY.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_population_policy_modifier
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_POPULATION_POLICY_MODIFIER {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No policy modifier.
     * @type {Integer (UInt16)}
     */
    static CF_POPULATION_POLICY_MODIFIER_NONE => 0
}
