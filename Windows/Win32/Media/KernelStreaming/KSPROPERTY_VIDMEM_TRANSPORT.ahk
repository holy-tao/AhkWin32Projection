#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDMEM_TRANSPORT {
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
    static KSPROPERTY_DISPLAY_ADAPTER_GUID => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PREFERRED_CAPTURE_SURFACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CURRENT_CAPTURE_SURFACE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MAP_CAPTURE_HANDLE_TO_VRAM_ADDRESS => 4
}
