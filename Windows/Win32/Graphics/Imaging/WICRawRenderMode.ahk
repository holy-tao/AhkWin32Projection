#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the render intent of the next CopyPixels call.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawrendermode
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICRawRenderMode extends Win32Enum {

    /**
     * Use speed priority mode.
     * Native name: WICRawRenderModeDraft
     * @type {Integer (Int32)}
     */
    static Draft => 1

    /**
     * Use normal priority mode. Balance of speed and quality.
     * Native name: WICRawRenderModeNormal
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * Use best quality mode.
     * Native name: WICRawRenderModeBestQuality
     * @type {Integer (Int32)}
     */
    static BestQuality => 3
}
