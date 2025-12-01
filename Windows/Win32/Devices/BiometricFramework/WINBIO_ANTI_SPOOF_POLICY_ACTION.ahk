#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of actions you take for the antispoofing policy of a user.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-anti-spoof-policy-action
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_ANTI_SPOOF_POLICY_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_ANTI_SPOOF_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_ANTI_SPOOF_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINBIO_ANTI_SPOOF_REMOVE => 2
}
