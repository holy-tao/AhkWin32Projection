#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BitmapSource.ahk
#Include .\IWriteableBitmap.ahk
#Include .\IWriteableBitmapFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a [BitmapSource](bitmapsource.md) that can be written to and updated.
 * @remarks
 * The image source data of a WriteableBitmap is an underlying pixel buffer.
 * 
 * The [IBuffer](/uwp/api/windows.storage.streams.ibuffer) returned by [WriteableBitmap.PixelBuffer](writeablebitmap_pixelbuffer.md) can't be written to directly. But you can use language-specific techniques to write to the underlying pixel content in the buffer. For details, see the **Remarks** section of [WriteableBitmap.PixelBuffer](writeablebitmap_pixelbuffer.md).
 * 
 * Some of the scenarios where you might have used a **WriteableBitmap** class in previous XAML frameworks can be accomplished in the Windows Runtime by using the [RenderTargetBitmap](rendertargetbitmap.md) class instead. For more info see [RenderTargetBitmap](rendertargetbitmap.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.writeablebitmap
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class WriteableBitmap extends BitmapSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWriteableBitmap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWriteableBitmap.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [WriteableBitmap](writeablebitmap.md) class.
     * @param {Integer} pixelWidth The width of the bitmap in pixels.
     * @param {Integer} pixelHeight The height of the bitmap in pixels.
     * @returns {WriteableBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.writeablebitmap.#ctor
     */
    static CreateInstanceWithDimensions(pixelWidth, pixelHeight) {
        if (!WriteableBitmap.HasProp("__IWriteableBitmapFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Imaging.WriteableBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWriteableBitmapFactory.IID)
            WriteableBitmap.__IWriteableBitmapFactory := IWriteableBitmapFactory(factoryPtr)
        }

        return WriteableBitmap.__IWriteableBitmapFactory.CreateInstanceWithDimensions(pixelWidth, pixelHeight)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an access for the direct buffer where each pixel of the [WriteableBitmap](writeablebitmap.md) is written to.
     * @remarks
     * > [!NOTE]
     * > Use the **Language** picker (near the title) to choose a programming language for the code example.
     * 
     * The [IBuffer](/uwp/api/windows.storage.streams.ibuffer) returned by **PixelBuffer** can't be written to directly. But you can use language-specific techniques to write to the underlying pixel content in the buffer.
     * 
     * - To access the pixel content from C# or Microsoft Visual Basic, you can use the [WindowsRuntimeBufferExtensions.AsStream method](/dotnet/api/system.runtime.interopservices.windowsruntime.windowsruntimebufferextensions.asstream?view=dotnet-uwp-10.0&preserve-view=true) to access the underlying buffer as a stream. This is shown in the C# code example.
     * - To access the pixel content from C++/WinRT, you have three alternatives. As long as you're not `using namespace winrt;`, then you can include the SDK header file `robuffer.h` to bring in the definition of the [IBufferByteAccess](/previous-versions/hh846267(v%3Dvs.85)) COM interface. However, since `using namespace winrt;` is very common, you can alternatively define the **IBufferByteAccess** interface in one place in your project (see the C++/WinRT code example to see how). Once **IBufferByteAccess** is defined, using either of those two techniques, you can query **PixelBuffer** for an instance of **IBufferByteAccess**. You then call the [IBufferByteAccess::Buffer method](/previous-versions/hh846268%28v%3dvs.85%29) to retrieve a pointer to the buffer of bytes that represents the pixel content. This is shown in the C++/WinRT code example. The third alternative (also shown in the C++/WinRT code example) is to avoid using **IBufferByteAccess** altogether by retrieving the `uint8_t*` that's returned from a helper function that you can call with `WriteableBitmap.PixelBuffer().data()`.
     * - To access the pixel content from C++/CX, you can query **PixelBuffer** for the [IBufferByteAccess interface](/previous-versions/hh846267(v%3Dvs.85)), which is a COM interface. Include `robuffer.h`. You can then call the the [IBufferByteAccess::Buffer method](/previous-versions/hh846268%28v%3dvs.85%29) to retrieve a pointer to the buffer of bytes that represents the pixel content. This is shown in the C++/CX code example.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.writeablebitmap.pixelbuffer
     * @type {IBuffer} 
     */
    PixelBuffer {
        get => this.get_PixelBuffer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PixelBuffer() {
        if (!this.HasProp("__IWriteableBitmap")) {
            if ((queryResult := this.QueryInterface(IWriteableBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWriteableBitmap := IWriteableBitmap(outPtr)
        }

        return this.__IWriteableBitmap.get_PixelBuffer()
    }

    /**
     * Requests a draw or redraw of the entire bitmap.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.writeablebitmap.invalidate
     */
    Invalidate() {
        if (!this.HasProp("__IWriteableBitmap")) {
            if ((queryResult := this.QueryInterface(IWriteableBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWriteableBitmap := IWriteableBitmap(outPtr)
        }

        return this.__IWriteableBitmap.Invalidate()
    }

;@endregion Instance Methods
}
