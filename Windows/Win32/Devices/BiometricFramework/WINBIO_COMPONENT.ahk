#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specify the type of adapter being used.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-component-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_COMPONENT {
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
    static WINBIO_COMPONENT_SENSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_COMPONENT_ENGINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINBIO_COMPONENT_STORAGE => 3
}
