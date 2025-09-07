#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies conversion matrix from Y'Cb'Cr' to R'G'B'.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegtransfermatrix
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICJpegTransferMatrix{

    /**
     * Specifies the identity transfer matrix.
     * @type {Integer (Int32)}
     */
    static WICJpegTransferMatrixIdentity => 0

    /**
     * Specifies the BT601 transfer matrix.
     * @type {Integer (Int32)}
     */
    static WICJpegTransferMatrixBT601 => 1
}
