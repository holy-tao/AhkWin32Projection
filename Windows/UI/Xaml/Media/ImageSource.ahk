#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IImageSource.ahk
#Include .\IImageSourceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides an object source type for the [Image.Source](../windows.ui.xaml.controls/image_source.md) and [ImageBrush.ImageSource](imagebrush_imagesource.md) properties.
 * @remarks
 * > [!IMPORTANT]
 * > You don't typically use or create an [ImageSource](imagebrush_imagesource.md) type directly, that's why you don't see code examples on this page. It's more common to create a [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) and use that as a value. For code examples and more info, see the reference page for [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md).
 * 
 * ImageSource and [BitmapSource](../windows.ui.xaml.media.imaging/bitmapsource.md) are intermediate base classes for [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md). For more info on how to create an image source to use for [Image.Source](../windows.ui.xaml.controls/image_source.md) and [ImageBrush.ImageSource](imagebrush_imagesource.md), see [Image and ImageBrush](/windows/uwp/controls-and-patterns/images-imagebrushes) and [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md).
 * 
 * The [ImageSource](imagebrush_imagesource.md) type is also the value to use for the [MediaElement.PosterSource](../windows.ui.xaml.controls/mediaelement_postersource.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imagesource
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ImageSource extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageSource.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
