#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ImageSource.ahk
#Include .\ISoftwareBitmapSource.ahk
#Include ..\..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a source object, backed by a [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md), for properties that use a bitmap-format image source.
 * @remarks
 * SoftwareBitmapSource lets you to use a [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) as an image source to be displayed using an [ImageBrush](../windows.ui.xaml.media/imagebrush.md) or directly in an [Image](../windows.ui.xaml.controls/image.md) control. For example, you can use a SoftwareBitmapSource to display a photo just taken by a device's camera using the [LowLagPhotoCapture](../windows.media.capture/lowlagphotocapture.md) class, to display an image you have manually decoded using the [BitmapDecoder.GetSoftwareBitmapAsync](../windows.graphics.imaging/bitmapdecoder_getsoftwarebitmapasync_1163471917.md) method, or to display a custom [IWICBitmap](/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap) in advanced C++ scenarios where you want to manually manage image memory.
 * 
 * A [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) displayed in a XAML app must be in BGRA pixel format with pre-multiplied alpha values.
 * 
 * A [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) typically stores uncompressed image data. This means it can require a large amount of system memory compared to a compressed format like a Portable Network Graphics (PNG) or JPEG file. Therefore, using a [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) can increase the amount of system memory your app is using, which could impact your app’s performance. Because storing uncompressed image data can use a lot of memory, you can call the [Dispose](/uwp/api/windows.ui.xaml.media.imaging.softwarebitmapsource.dispose) (C#/VB) or [Close](softwarebitmapsource_close_811482585.md) (C++) method to reduce memory usage when the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) is no longer needed. This causes the associated system resources to be freed immediately rather than waiting for garbage collection.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.softwarebitmapsource
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class SoftwareBitmapSource extends ImageSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISoftwareBitmapSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISoftwareBitmapSource.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SoftwareBitmapSource](softwarebitmapsource.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.SoftwareBitmapSource")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Sets the source [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) to be used as an image source.
     * @remarks
     * The [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) must be in BGRA pixel format with pre-multiplied alpha values.
     * @param {SoftwareBitmap} softwareBitmap_ The [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) to be used as an image source.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.softwarebitmapsource.setbitmapasync
     */
    SetBitmapAsync(softwareBitmap_) {
        if (!this.HasProp("__ISoftwareBitmapSource")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmapSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmapSource := ISoftwareBitmapSource(outPtr)
        }

        return this.__ISoftwareBitmapSource.SetBitmapAsync(softwareBitmap_)
    }

    /**
     * Disposes of the object and associated resources.
     * @remarks
     * For Microsoft Visual Basic and C#, use the [Dispose](/uwp/api/windows.ui.xaml.media.imaging.softwarebitmapsource.dispose) method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.softwarebitmapsource.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
