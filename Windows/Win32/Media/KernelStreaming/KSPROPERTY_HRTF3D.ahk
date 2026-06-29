#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_HRTF3D {
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
    static KSPROPERTY_HRTF3D_PARAMS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_HRTF3D_INITIALIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_HRTF3D_FILTER_FORMAT => 2
}
