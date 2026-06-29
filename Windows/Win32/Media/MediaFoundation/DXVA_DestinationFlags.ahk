#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_DestinationFlags {
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
    static DXVA_DestinationFlagMask => 15

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_Background_Changed => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_TargetRect_Changed => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_ColorData_Changed => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DestinationFlag_Alpha_Changed => 8
}
