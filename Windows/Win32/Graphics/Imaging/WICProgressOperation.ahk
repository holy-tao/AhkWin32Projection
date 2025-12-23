#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the progress operations to receive notifications for.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicprogressoperation
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICProgressOperation extends Win32Enum{

    /**
     * Receive copy pixel operation.
     * @type {Integer (Int32)}
     */
    static WICProgressOperationCopyPixels => 1

    /**
     * Receive write pixel operation.
     * @type {Integer (Int32)}
     */
    static WICProgressOperationWritePixels => 2

    /**
     * Receive all progress operations available.
     * @type {Integer (Int32)}
     */
    static WICProgressOperationAll => 65535
}
