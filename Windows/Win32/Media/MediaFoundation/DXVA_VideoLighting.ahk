#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoLighting {
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
    static DXVA_VideoLightingShift => 18

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLightingMask => 3932160

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_bright => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_office => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_dim => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoLighting_dark => 4
}
