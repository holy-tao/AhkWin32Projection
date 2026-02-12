#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Provides values that can be used for decoding operations to optimize for logical versus physical pixels in the source image file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.decodepixeltype
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class DecodePixelType extends Win32Enum{

    /**
     * Use a physical pixel value.
     * @type {Integer (Int32)}
     */
    static Physical => 0

    /**
     * Use a logical pixel value.
     * @type {Integer (Int32)}
     */
    static Logical => 1
}
