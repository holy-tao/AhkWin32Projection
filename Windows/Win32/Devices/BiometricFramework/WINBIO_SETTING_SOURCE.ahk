#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determine whether the Windows Biometric Framework is currently enabled.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-setting-source-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SETTING_SOURCE {
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
    static WINBIO_SETTING_SOURCE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SETTING_SOURCE_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SETTING_SOURCE_LOCAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_SETTING_SOURCE_POLICY => 2
}
