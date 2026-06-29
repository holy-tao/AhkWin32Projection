#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_POLICY_SOURCE.ahk" { WINBIO_POLICY_SOURCE }
#Import ".\WINBIO_ANTI_SPOOF_POLICY_ACTION.ahk" { WINBIO_ANTI_SPOOF_POLICY_ACTION }

/**
 * Represents the antispoofing policy for a user.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-anti-spoof-policy
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_ANTI_SPOOF_POLICY {
    #StructPack 4

    /**
     * The type of action to take for the antispoofing policy.
     */
    Action : WINBIO_ANTI_SPOOF_POLICY_ACTION

    /**
     * The source for the antispoofing policy.
     */
    Source : WINBIO_POLICY_SOURCE

}
