#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_POLICY_SOURCE.ahk
#Include .\WINBIO_ANTI_SPOOF_POLICY_ACTION.ahk

/**
 * Represents the antispoofing policy for a user.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-anti-spoof-policy
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_ANTI_SPOOF_POLICY extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of action to take for the antispoofing policy.
     * @type {WINBIO_ANTI_SPOOF_POLICY_ACTION}
     */
    Action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The source for the antispoofing policy.
     * @type {WINBIO_POLICY_SOURCE}
     */
    Source {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
