#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDCAP_VIDEOENCODER {
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
    static KSPROPERTY_VIDEOENCODER_CAPS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOENCODER_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOENCODER_COPYPROTECTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOENCODER_CC_ENABLE => 3
}
