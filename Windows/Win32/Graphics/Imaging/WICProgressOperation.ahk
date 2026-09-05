#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the progress operations to receive notifications for.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicprogressoperation
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICProgressOperation extends Win32Enum {

    /**
     * Receive copy pixel operation.
     * Native name: WICProgressOperationCopyPixels
     * @type {Integer (Int32)}
     */
    static CopyPixels => 1

    /**
     * Receive write pixel operation.
     * Native name: WICProgressOperationWritePixels
     * @type {Integer (Int32)}
     */
    static WritePixels => 2

    /**
     * Receive all progress operations available.
     * Native name: WICProgressOperationAll
     * @type {Integer (Int32)}
     */
    static All => 65535
}
