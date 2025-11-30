#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the animation properties of a WebP image.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicwebpanimproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICWebpAnimProperties extends Win32Enum{

    /**
     * The number of times the animation loops. A value of 0 indicates that the animation will loop infinitely.
     * @type {Integer (Int32)}
     */
    static WICWebpAnimLoopCount => 1
}
