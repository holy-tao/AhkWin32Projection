#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the types of actions you take for the antispoofing policy of a user.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-anti-spoof-policy-action
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_ANTI_SPOOF_POLICY_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
