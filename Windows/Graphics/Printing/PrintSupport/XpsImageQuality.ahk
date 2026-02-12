#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the image quality of an XPS image.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.xpsimagequality
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class XpsImageQuality extends Win32Enum{

    /**
     * JPEG, high compression.
     * @type {Integer (Int32)}
     */
    static JpegHighCompression => 0

    /**
     * JPEG, medium compression.
     * @type {Integer (Int32)}
     */
    static JpegMediumCompression => 1

    /**
     * JPEG, low compression.
     * @type {Integer (Int32)}
     */
    static JpegLowCompression => 2

    /**
     * PNG, no compression.
     * @type {Integer (Int32)}
     */
    static Png => 3
}
