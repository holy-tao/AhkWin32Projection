#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-anti-spoof-policy-action
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_ANTI_SPOOF_POLICY_ACTION{

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
