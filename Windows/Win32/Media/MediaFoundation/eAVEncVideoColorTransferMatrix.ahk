#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the conversion matrix from the Y'Cb'Cr' color space to the R'G'B' color space. This enumeration is used with the AVEncVideoInputColorTransferMatrix and AVEncVideoOutputColorTransferMatrix properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocolortransfermatrix
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoColorTransferMatrix extends Win32Enum {

    /**
     * Use the same transfer matrix as the input video. This flag applies to the <b>AVEncVideoOutputColorTransferMatrix</b> property only.
     * Native name: eAVEncVideoColorTransferMatrix_SameAsSource
     * @type {Integer (Int32)}
     */
    static SameAsSource => 0

    /**
     * ITU-R BT.709 transfer matrix.
     * Native name: eAVEncVideoColorTransferMatrix_BT709
     * @type {Integer (Int32)}
     */
    static BT709 => 1

    /**
     * ITU-R BT.601 transfer matrix.
     * Native name: eAVEncVideoColorTransferMatrix_BT601
     * @type {Integer (Int32)}
     */
    static BT601 => 2

    /**
     * SMPTE 240M transfer matrix.
     * Native name: eAVEncVideoColorTransferMatrix_SMPTE240M
     * @type {Integer (Int32)}
     */
    static SMPTE240M => 3
}
