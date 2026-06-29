#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specify the type of biometric unit pool to be used in the session.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-pool-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_POOL {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_POOL_SYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_POOL_PRIVATE => 2
}
