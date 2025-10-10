#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the render intent of the next CopyPixels call.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicrawrendermode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICRawRenderMode{

    /**
     * Use speed priority mode.
     * @type {Integer (Int32)}
     */
    static WICRawRenderModeDraft => 1

    /**
     * Use normal priority mode. Balance of speed and quality.
     * @type {Integer (Int32)}
     */
    static WICRawRenderModeNormal => 2

    /**
     * Use best quality mode.
     * @type {Integer (Int32)}
     */
    static WICRawRenderModeBestQuality => 3
}
