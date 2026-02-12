#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the types of pixel encoding format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaypixelencoding
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class HdmiDisplayPixelEncoding extends Win32Enum{

    /**
     * Video signal is separated into the red, green, blue (RGB) components, with no color sub-sampling.
     * @type {Integer (Int32)}
     */
    static Rgb444 => 0

    /**
     * Video signal is separated into the chroma (Cb and Cr) and luma (Y) components, with no chroma sub-sampling.
     * @type {Integer (Int32)}
     */
    static Ycc444 => 1

    /**
     * Chroma sub-sampling is done at 4:2:2. The two chroma components are sampled at half the sample rate of the luma component.
     * @type {Integer (Int32)}
     */
    static Ycc422 => 2

    /**
     * Chroma sub-sampling is done at 4:2:0. Only one chroma component is sampled on per line. This means that the two chroma components take turns to be sampled, so they are sampled on alternate lines at half the sample rate of the luma component.
     * @type {Integer (Int32)}
     */
    static Ycc420 => 3
}
