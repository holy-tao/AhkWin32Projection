#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies initialization options for a bitmap image.
 * @remarks
 * This enumeration is used by the [BitmapImage.CreateOptions](bitmapimage_createoptions.md) property. For more info, see [CreateOptions](bitmapimage_createoptions.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.bitmapcreateoptions
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapCreateOptions extends Win32BitflagEnum{

    /**
     * No options are specified.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Loads images without using an existing image cache. This option should be selected only when images in a cache need to be refreshed.
     * @type {Integer (UInt32)}
     */
    static IgnoreImageCache => 8
}
