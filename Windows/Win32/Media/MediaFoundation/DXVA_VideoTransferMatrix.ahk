#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_VideoTransferMatrix{

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
