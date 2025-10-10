#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the animation frame properties of a WebP image.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicwebpanmfproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICWebpAnmfProperties{

    /**
     * The time to wait before displaying the next frame, in milliseconds.
     * @type {Integer (Int32)}
     */
    static WICWebpAnmfFrameDuration => 1
}
