#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies access to an IWICBitmap.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmaplockflags
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapLockFlags extends Win32Enum {

    /**
     * A read access lock.
     * Native name: WICBitmapLockRead
     * @type {Integer (Int32)}
     */
    static Read => 1

    /**
     * A write access lock.
     * Native name: WICBitmapLockWrite
     * @type {Integer (Int32)}
     */
    static Write => 2
}
