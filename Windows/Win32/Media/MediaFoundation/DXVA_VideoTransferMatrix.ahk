#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoTransferMatrix {
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
    static DXVA_VideoTransferMatrixShift => 15

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransferMatrixMask => 229376

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransferMatrix_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransferMatrix_BT709 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransferMatrix_BT601 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransferMatrix_SMPTE240M => 3
}
