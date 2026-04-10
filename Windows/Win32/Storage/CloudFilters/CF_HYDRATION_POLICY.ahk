#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CF_HYDRATION_POLICY_PRIMARY.ahk
#Include .\CF_HYDRATION_POLICY_MODIFIER.ahk

/**
 * Specifies the primary hydration policy and its modifier.
 * @remarks
 * The hydration policy allows a sync provider to control how placeholder files should be hydrated by the platform. It consists of a primary policy and a set of policy modifiers.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_hydration_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_HYDRATION_POLICY extends Win32Struct {
    static sizeof => 4

    static packingSize => 2

    /**
     * The primary hydration policy.
     * @type {CF_HYDRATION_POLICY_PRIMARY}
     */
    Primary {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The hydration policy modifier.
     * @type {CF_HYDRATION_POLICY_MODIFIER}
     */
    Modifier {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
