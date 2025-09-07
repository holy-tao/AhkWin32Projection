#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the conversion matrices between Y'PbPr (component video) and studio R'G'B'. (DXVA2_VideoTransferMatrix)
 * @remarks
 * The transfer matrices are defined as follows.
  * 
  * BT.709 transfer matrices:
  * 
  * 
  * ``` syntax
  * Y'        0.212600    0.715200    0.072200       R' 
  * Pb   =   -0.114572   -0.385428    0.500000   x   G' 
  * Pr        0.500000   -0.454153   -0.045847       B' 
  * 
  * R'        1.000000    0.000000    1.574800       Y' 
  * G'   =    1.000000   -0.187324   -0.468124   x   Pb 
  * B'        1.000000    1.855600    0.000000       Pr 
  * 
  * ```
  * 
  * BT.601 transfer matrices:
  * 
  * 
  * ``` syntax
  * Y'        0.299000    0.587000    0.114000       R' 
  * Pb   =   -0.168736   -0.331264    0.500000   x   G' 
  * Pr        0.500000   -0.418688   -0.081312       B' 
  * 
  * R'        1.000000    0.000000    1.402000       Y' 
  * G'   =    1.000000   -0.344136   -0.714136   x   Pb 
  * B'        1.000000    1.772000    0.000000       Pr 
  * 
  * ```
  * 
  * SMPTE 240M (SMPTE RP 145) transfer matrices:
  * 
  * 
  * ``` syntax
  * Y'        0.212000    0.701000    0.087000       R' 
  * Pb   =   -0.116000   -0.384000    0.500000   x   G' 
  * Pr        0.500000   -0.445000   -0.055000       B' 
  * 
  * R'        1.000000   -0.000000    1.576000       Y' 
  * G'   =    1.000000   -0.227000   -0.477000   x   Pb 
  * B'        1.000000    1.826000    0.000000       Pr 
  * 
  * ```
  * 
  * This enumeration is equivalent to the <b>DXVA_VideoTransferMatrix</b> enumeration used in DXVA 1.0.
  * 
  * If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface to describe the video format, the video transfer matrix is specified in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-yuv-matrix-attribute">MF_MT_YUV_MATRIX</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_videotransfermatrix
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoTransferMatrix{

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransferMatrixMask => 7

    /**
     * Unknown. For standard-definition content, treat as DXVA2_VideoTransferMatrix_BT601. For high-definition content, treat as DXVA2_VideoTransferMatrix_BT709. (High-definition content is defined for this purpose as anything with a source height greater than 576 lines.)
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransferMatrix_Unknown => 0

    /**
     * ITU-R BT.709 transfer matrix.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransferMatrix_BT709 => 1

    /**
     * ITU-R BT.601 transfer matrix. Also used for SMPTE 170 and ITU-R BT.470-2 System B,G.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransferMatrix_BT601 => 2

    /**
     * SMPTE 240M transfer matrix.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoTransferMatrix_SMPTE240M => 3
}
