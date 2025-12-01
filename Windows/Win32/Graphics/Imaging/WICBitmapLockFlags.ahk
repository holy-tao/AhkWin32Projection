#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies access to an IWICBitmap.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmaplockflags
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapLockFlags extends Win32Enum{

    /**
     * A read access lock.
     * @type {Integer (Int32)}
     */
    static WICBitmapLockRead => 1

    /**
     * A write access lock.
     * @type {Integer (Int32)}
     */
    static WICBitmapLockWrite => 2
}
