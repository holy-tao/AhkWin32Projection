#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the conversion matrix from the Y'Cb'Cr' color space to the R'G'B' color space. This enumeration is used with the AVEncVideoInputColorTransferMatrix and AVEncVideoOutputColorTransferMatrix properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocolortransfermatrix
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncVideoColorTransferMatrix {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the same transfer matrix as the input video. This flag applies to the <b>AVEncVideoOutputColorTransferMatrix</b> property only.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferMatrix_SameAsSource => 0

    /**
     * ITU-R BT.709 transfer matrix.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferMatrix_BT709 => 1

    /**
     * ITU-R BT.601 transfer matrix.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferMatrix_BT601 => 2

    /**
     * SMPTE 240M transfer matrix.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferMatrix_SMPTE240M => 3
}
