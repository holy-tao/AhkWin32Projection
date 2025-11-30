#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) background (bKGD) chunk metadata properties.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicpngbkgdproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngBkgdProperties extends Win32Enum{

    /**
     * Indicates the background color. There are three possible types, depending on the image's pixel format.
     * @type {Integer (Int32)}
     */
    static WICPngBkgdBackgroundColor => 1
}
