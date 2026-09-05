#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the conversion matrices between Y'PbPr (component video) and studio R'G'B'. (MFVideoTransferMatrix)
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-yuv-matrix-attribute">MF_MT_YUV_MATRIX</a> attribute.
 * 
 * For more information about these values, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_videotransfermatrix">DXVA2_VideoTransferMatrix</a> enumeration, which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideotransfermatrix
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoTransferMatrix extends Win32Enum {

    /**
     * Unknown transfer matrix. Treat as MFVideoTransferMatrix_BT709.
     * Native name: MFVideoTransferMatrix_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * ITU-R BT.709 transfer matrix.
     * Native name: MFVideoTransferMatrix_BT709
     * @type {Integer (Int32)}
     */
    static BT709 => 1

    /**
     * ITU-R BT.601 transfer matrix. Also used for SMPTE 170 and ITU-R BT.470-2 System B,G.
     * Native name: MFVideoTransferMatrix_BT601
     * @type {Integer (Int32)}
     */
    static BT601 => 2

    /**
     * SMPTE 240M transfer matrix.
     * Native name: MFVideoTransferMatrix_SMPTE240M
     * @type {Integer (Int32)}
     */
    static SMPTE240M => 3

    /**
     * Native name: MFVideoTransferMatrix_BT2020_10
     * @type {Integer (Int32)}
     */
    static BT2020_10 => 4

    /**
     * Native name: MFVideoTransferMatrix_BT2020_12
     * @type {Integer (Int32)}
     */
    static BT2020_12 => 5

    /**
     * Native name: MFVideoTransferMatrix_Identity
     * @type {Integer (Int32)}
     */
    static Identity => 6

    /**
     * Native name: MFVideoTransferMatrix_FCC47
     * @type {Integer (Int32)}
     */
    static FCC47 => 7

    /**
     * Native name: MFVideoTransferMatrix_YCgCo
     * @type {Integer (Int32)}
     */
    static YCgCo => 8

    /**
     * Native name: MFVideoTransferMatrix_SMPTE2085
     * @type {Integer (Int32)}
     */
    static SMPTE2085 => 9

    /**
     * Native name: MFVideoTransferMatrix_Chroma
     * @type {Integer (Int32)}
     */
    static Chroma => 10

    /**
     * Native name: MFVideoTransferMatrix_Chroma_const
     * @type {Integer (Int32)}
     */
    static Chroma_const => 11

    /**
     * Native name: MFVideoTransferMatrix_ICtCp
     * @type {Integer (Int32)}
     */
    static ICtCp => 12

    /**
     * Reserved.
     * Native name: MFVideoTransferMatrix_Last
     * @type {Integer (Int32)}
     */
    static Last => 13

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * Native name: MFVideoTransferMatrix_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
