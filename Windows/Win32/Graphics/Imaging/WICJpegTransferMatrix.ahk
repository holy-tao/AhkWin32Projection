#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies conversion matrix from Y'Cb'Cr' to R'G'B'.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegtransfermatrix
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICJpegTransferMatrix extends Win32Enum {

    /**
     * Specifies the identity transfer matrix.
     * Native name: WICJpegTransferMatrixIdentity
     * @type {Integer (Int32)}
     */
    static Identity => 0

    /**
     * Specifies the BT601 transfer matrix.
     * Native name: WICJpegTransferMatrixBT601
     * @type {Integer (Int32)}
     */
    static MatrixBT601 => 1
}
