#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_DestData {
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
    static DXVA2_DestData_RFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestData_TFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestData_RFF_TFF_Present => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestData_Mask => 65535
}
