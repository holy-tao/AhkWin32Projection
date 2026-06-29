#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA2_DestinationFlags {
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
    static DXVA2_DestinationFlag_Background_Changed => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_TargetRect_Changed => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_ColorData_Changed => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_Alpha_Changed => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_RFF => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_TFF => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_RFF_TFF_Present => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlagMask => -65521
}
