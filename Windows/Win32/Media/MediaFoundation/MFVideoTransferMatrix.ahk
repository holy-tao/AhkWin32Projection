#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the conversion matrices between Y'PbPr (component video) and studio R'G'B'. (MFVideoTransferMatrix)
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-yuv-matrix-attribute">MF_MT_YUV_MATRIX</a> attribute.
  * 
  * For more information about these values, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_videotransfermatrix">DXVA2_VideoTransferMatrix</a> enumeration, which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideotransfermatrix
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoTransferMatrix{

    /**
     * Unknown transfer matrix. Treat as MFVideoTransferMatrix_BT709.
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_Unknown => 0

    /**
     * ITU-R BT.709 transfer matrix.
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_BT709 => 1

    /**
     * ITU-R BT.601 transfer matrix. Also used for SMPTE 170 and ITU-R BT.470-2 System B,G.
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_BT601 => 2

    /**
     * SMPTE 240M transfer matrix.
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_SMPTE240M => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_BT2020_10 => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_BT2020_12 => 5

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_Identity => 6

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_FCC47 => 7

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_YCgCo => 8

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_SMPTE2085 => 9

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_Chroma => 10

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_Chroma_const => 11

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_ICtCp => 12

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_Last => 13

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static MFVideoTransferMatrix_ForceDWORD => 2147483647
}
