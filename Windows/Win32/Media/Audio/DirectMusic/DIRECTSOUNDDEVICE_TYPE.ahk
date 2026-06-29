#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DIRECTSOUNDDEVICE_TYPE {
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
    static DIRECTSOUNDDEVICE_TYPE_EMULATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTSOUNDDEVICE_TYPE_VXD => 1

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTSOUNDDEVICE_TYPE_WDM => 2
}
