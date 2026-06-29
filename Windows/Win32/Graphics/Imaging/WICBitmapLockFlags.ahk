#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies access to an IWICBitmap.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmaplockflags
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapLockFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
