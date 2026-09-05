#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_VideoTransferMatrix extends Win32Enum {

    /**
     * Native name: DXVA_VideoTransferMatrixShift
     * @type {Integer (Int32)}
     */
    static Shift => 15

    /**
     * Native name: DXVA_VideoTransferMatrixMask
     * @type {Integer (Int32)}
     */
    static Mask => 229376

    /**
     * Native name: DXVA_VideoTransferMatrix_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA_VideoTransferMatrix_BT709
     * @type {Integer (Int32)}
     */
    static BT709 => 1

    /**
     * Native name: DXVA_VideoTransferMatrix_BT601
     * @type {Integer (Int32)}
     */
    static BT601 => 2

    /**
     * Native name: DXVA_VideoTransferMatrix_SMPTE240M
     * @type {Integer (Int32)}
     */
    static SMPTE240M => 3
}
