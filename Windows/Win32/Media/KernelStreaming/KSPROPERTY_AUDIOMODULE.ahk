#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_AUDIOMODULE {
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
    static KSPROPERTY_AUDIOMODULE_DESCRIPTORS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOMODULE_COMMAND => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOMODULE_NOTIFICATION_DEVICE_ID => 3
}
