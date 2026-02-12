#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPixelDataProvider.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the pixel data from a bitmap frame.
 * @remarks
 * An application asynchronously receives a PixelDataProvider from the [GetPixelDataAsync](bitmapframe_getpixeldataasync_1391309547.md) methods of [BitmapFrame](bitmapframe.md) or [BitmapDecoder](bitmapdecoder.md). The application can then synchronously request the pixel data using [DetachPixelData](pixeldataprovider_detachpixeldata_1386564001.md) to get access to the raw pixels of the bitmap.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.pixeldataprovider
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class PixelDataProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPixelDataProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPixelDataProvider.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the internally-stored pixel data.
     * @remarks
     * [PixelDataProvider](pixeldataprovider.md) doesn't retain a copy of the pixel data after a successful call to this method. This means that subsequent calls to the method will fail.
     * 
     * If you are using the [Windows Runtime C++ Template Library (WRL)](/cpp/windows/windows-runtime-cpp-template-library-wrl), you are responsible for releasing the underlying memory for the pixel data. Call [CoTaskMemFree](/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree) after you are done with the data. If you are using a language projection such as C# or C++/WinRT, memory management is handled automatically.
     * 
     * The return value is an array of 8 bit unsigned values. However, depending on the requested pixel format, the pixel data may represent another type. For example, if the pixel format is Rgba16, then each color value is a 16 bit unsigned integer that takes up two 8 bit elements of the array. You must convert the array to the correct type before you use it.
     * @param {Pointer<Pointer>} pixelData 
     * @returns {HRESULT} The pixel data.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.pixeldataprovider.detachpixeldata
     */
    DetachPixelData(pixelData) {
        if (!this.HasProp("__IPixelDataProvider")) {
            if ((queryResult := this.QueryInterface(IPixelDataProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPixelDataProvider := IPixelDataProvider(outPtr)
        }

        return this.__IPixelDataProvider.DetachPixelData(pixelData)
    }

;@endregion Instance Methods
}
