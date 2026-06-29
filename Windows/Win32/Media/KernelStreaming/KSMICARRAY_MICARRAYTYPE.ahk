#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMICARRAY_MICARRAYTYPE {
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
    static KSMICARRAY_MICARRAYTYPE_LINEAR => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICARRAYTYPE_PLANAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICARRAYTYPE_3D => 2
}
