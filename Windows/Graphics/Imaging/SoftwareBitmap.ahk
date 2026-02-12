#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISoftwareBitmap.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ISoftwareBitmapStatics.ahk
#Include .\ISoftwareBitmapFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an uncompressed bitmap.
 * @remarks
 * This class provides a representation of a bitmap that makes it easy to use with different imaging APIs. Use [GetSoftwareBitmapAsync](bitmapdecoder_getsoftwarebitmapasync_1163471917.md) to create a SoftwareBitmap from a stream resource such as an image file.
 * 
 * Use [CopyToBuffer](softwarebitmap_copytobuffer_1167750415.md) and [CopyFromBuffer](softwarebitmap_copyfrombuffer_50356126.md) to copy pixel data back and forth between a **SoftwareBitmap** and the [PixelBuffer](../windows.ui.xaml.media.imaging/writeablebitmap_pixelbuffer.md) of a [WriteableBitmap](../windows.ui.xaml.media.imaging/writeablebitmap.md).
 * Use [CreateCopyFromSurfaceAsync](softwarebitmap_createcopyfromsurfaceasync_1666076722.md) to create a **SoftwareBitmap** from an [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md).
 * Use [ISoftwareBitmapNativeFactory::CreateFromMF2DBuffer2](/windows/win32/api/windows.graphics.imaging.interop/nf-windows-graphics-imaging-interop-isoftwarebitmapnativefactory-createfrommf2dbuffer2) to create a **SoftwareBitmap** from an [IMF2DBuffer2](/windows/win32/api/mfobjects/nn-mfobjects-imf2dbuffer2).
 * Use [ISoftwareBitmapNativeFactory::CreateFromIWICBitmap](/windows/win32/api/windows.graphics.imaging.interop/nf-windows-graphics-imaging-interop-isoftwarebitmapnativefactory-createfromwicbitmap) to create a **SoftwareBitmap** from an [IWICBitmap](/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class SoftwareBitmap extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISoftwareBitmap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISoftwareBitmap.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a copy of the provided [SoftwareBitmap](softwarebitmap.md) object.
     * @param {SoftwareBitmap} source The software bitmap to copy.
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.copy
     */
    static Copy(source) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapStatics.IID)
            SoftwareBitmap.__ISoftwareBitmapStatics := ISoftwareBitmapStatics(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapStatics.Copy(source)
    }

    /**
     * Converts an existing [SoftwareBitmap](bitmapdecoder_getsoftwarebitmapasync_1163471917.md) to a [SoftwareBitmap](bitmapdecoder_getsoftwarebitmapasync_1163471917.md) with a different pixel format or alpha mode.
     * @param {SoftwareBitmap} source The software bitmap to convert.
     * @param {Integer} format The pixel format of the new software bitmap.
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.convert
     */
    static Convert(source, format) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapStatics.IID)
            SoftwareBitmap.__ISoftwareBitmapStatics := ISoftwareBitmapStatics(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapStatics.Convert(source, format)
    }

    /**
     * Converts an existing [SoftwareBitmap](bitmapdecoder_getsoftwarebitmapasync_1163471917.md) to a [SoftwareBitmap](bitmapdecoder_getsoftwarebitmapasync_1163471917.md) with a different pixel format.
     * @param {SoftwareBitmap} source The software bitmap to convert.
     * @param {Integer} format The pixel format of the new software bitmap.
     * @param {Integer} alpha 
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.convert
     */
    static ConvertWithAlpha(source, format, alpha) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapStatics.IID)
            SoftwareBitmap.__ISoftwareBitmapStatics := ISoftwareBitmapStatics(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapStatics.ConvertWithAlpha(source, format, alpha)
    }

    /**
     * Creates a new [SoftwareBitmap](softwarebitmap.md) by performing a deep copy of the provided buffer. Modifications to the data in the new [SoftwareBitmap](softwarebitmap.md) will not effect the buffer from which it was created.
     * @param {IBuffer} source The source buffer from which the copy will be created.
     * @param {Integer} format The pixel format of the software bitmap.
     * @param {Integer} width The width of the software bitmap, in pixels.
     * @param {Integer} height The height of the software bitmap, in pixels.
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.createcopyfrombuffer
     */
    static CreateCopyFromBuffer(source, format, width, height) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapStatics.IID)
            SoftwareBitmap.__ISoftwareBitmapStatics := ISoftwareBitmapStatics(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapStatics.CreateCopyFromBuffer(source, format, width, height)
    }

    /**
     * Creates a new [SoftwareBitmap](softwarebitmap.md) by performing a deep copy of the provided buffer. Modifications to the data in the new [SoftwareBitmap](softwarebitmap.md) will not effect the buffer from which it was created.
     * @remarks
     * Use this method and its overloads to copy data from the [PixelBuffer](../windows.ui.xaml.media.imaging/writeablebitmap_pixelbuffer.md) of a [WriteableBitmap](../windows.ui.xaml.media.imaging/writeablebitmap.md) into an existing [SoftwareBitmap](softwarebitmap.md).
     * @param {IBuffer} source The source buffer from which the copy will be created.
     * @param {Integer} format The pixel format of the software bitmap.
     * @param {Integer} width The width of the software bitmap, in pixels.
     * @param {Integer} height The height of the software bitmap, in pixels.
     * @param {Integer} alpha 
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.createcopyfrombuffer
     */
    static CreateCopyWithAlphaFromBuffer(source, format, width, height, alpha) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapStatics.IID)
            SoftwareBitmap.__ISoftwareBitmapStatics := ISoftwareBitmapStatics(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapStatics.CreateCopyWithAlphaFromBuffer(source, format, width, height, alpha)
    }

    /**
     * Asynchronously creates a new [SoftwareBitmap](softwarebitmap.md) by performing a deep copy of the provided [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md). Modifications to the data in the new [SoftwareBitmap](softwarebitmap.md) will not effect the surface from which it was created.
     * @param {IDirect3DSurface} surface The source surface from which the copy will be created.
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.createcopyfromsurfaceasync
     */
    static CreateCopyFromSurfaceAsync(surface) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapStatics.IID)
            SoftwareBitmap.__ISoftwareBitmapStatics := ISoftwareBitmapStatics(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapStatics.CreateCopyFromSurfaceAsync(surface)
    }

    /**
     * Asynchronously creates a new [SoftwareBitmap](softwarebitmap.md) by performing a deep copy of the provided [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md). Modifications to the data in the new [SoftwareBitmap](softwarebitmap.md) will not effect the surface from which it was created.
     * @param {IDirect3DSurface} surface The source surface from which the copy will be created.
     * @param {Integer} alpha 
     * @returns {IAsyncOperation<SoftwareBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.createcopyfromsurfaceasync
     */
    static CreateCopyWithAlphaFromSurfaceAsync(surface, alpha) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapStatics.IID)
            SoftwareBitmap.__ISoftwareBitmapStatics := ISoftwareBitmapStatics(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapStatics.CreateCopyWithAlphaFromSurfaceAsync(surface, alpha)
    }

    /**
     * Initializes a new instance of the [SoftwareBitmap](softwarebitmap.md) class.
     * @param {Integer} format The pixel format of the new software bitmap.
     * @param {Integer} width The width of the new software bitmap, in pixels.
     * @param {Integer} height The height of the new software bitmap, in pixels.
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.#ctor
     */
    static Create(format, width, height) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapFactory.IID)
            SoftwareBitmap.__ISoftwareBitmapFactory := ISoftwareBitmapFactory(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapFactory.Create(format, width, height)
    }

    /**
     * Initializes a new instance of the [SoftwareBitmap](softwarebitmap.md) class.
     * @param {Integer} format The pixel format of the new software bitmap.
     * @param {Integer} width The width of the new software bitmap, in pixels.
     * @param {Integer} height The height of the new software bitmap, in pixels.
     * @param {Integer} alpha The alpha mode of the new software bitmap.
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.#ctor
     */
    static CreateWithAlpha(format, width, height, alpha) {
        if (!SoftwareBitmap.HasProp("__ISoftwareBitmapFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.SoftwareBitmap")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoftwareBitmapFactory.IID)
            SoftwareBitmap.__ISoftwareBitmapFactory := ISoftwareBitmapFactory(factoryPtr)
        }

        return SoftwareBitmap.__ISoftwareBitmapFactory.CreateWithAlpha(format, width, height, alpha)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the pixel format of the software bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.bitmappixelformat
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * Gets the alpha mode of the software bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.bitmapalphamode
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * Gets the width of the software bitmap, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.pixelwidth
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * Gets the height of the software bitmap, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.pixelheight
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

    /**
     * Gets a value indicating whether the software bitmap can be modified.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets or sets the dots per inch of the software bitmap in the X direction.
     * @remarks
     * DpiX and [DpiY](softwarebitmap_dpiy.md) are metadata about the bitmap. Modifying these values does not scale the image.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.dpix
     * @type {Float} 
     */
    DpiX {
        get => this.get_DpiX()
        set => this.put_DpiX(value)
    }

    /**
     * Gets or sets the dots per inch of the software bitmap in the Y direction.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.dpiy
     * @type {Float} 
     */
    DpiY {
        get => this.get_DpiY()
        set => this.put_DpiY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapPixelFormat() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.get_BitmapPixelFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapAlphaMode() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.get_BitmapAlphaMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelWidth() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.get_PixelWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelHeight() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.get_PixelHeight()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.get_IsReadOnly()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DpiX(value) {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.put_DpiX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiX() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.get_DpiX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DpiY(value) {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.put_DpiY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiY() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.get_DpiY()
    }

    /**
     * Gets a [BitmapBuffer](bitmapbuffer.md) object that allows you to operate directly on the software bitmap's pixel data.
     * @remarks
     * Because the returned **BitmapBuffer** represents an exclusive lock on the associated bitmap, apps should not keep the reference to it indefinitely.
     * @param {Integer} mode_ A value indicating the access mode of the returned buffer.
     * @returns {BitmapBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.lockbuffer
     */
    LockBuffer(mode_) {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.LockBuffer(mode_)
    }

    /**
     * Copies the current [SoftwareBitmap](softwarebitmap.md) into the provided [SoftwareBitmap](softwarebitmap.md) object.
     * @param {SoftwareBitmap} bitmap_ The target software bitmap into which the data will be copied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.copyto
     */
    CopyTo(bitmap_) {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.CopyTo(bitmap_)
    }

    /**
     * Copies the pixel data from an IBuffer into the [SoftwareBitmap](softwarebitmap.md).
     * @remarks
     * Use this method to copy data from the [PixelBuffer](../windows.ui.xaml.media.imaging/writeablebitmap_pixelbuffer.md) of a [WriteableBitmap](../windows.ui.xaml.media.imaging/writeablebitmap.md) into an existing [SoftwareBitmap](softwarebitmap.md).
     * 
     * This method assumes that the input buffer has the same pixel format, width, height, color space, alpha mode, and DPI. It also assumes that the data in the buffer is contiguous. In other words, it expects that the stride of the image is equal to the width, with no additional padding.
     * @param {IBuffer} buffer_ The buffer containing the pixel data to be copied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.copyfrombuffer
     */
    CopyFromBuffer(buffer_) {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.CopyFromBuffer(buffer_)
    }

    /**
     * Copies the software bitmap pixel data into the specified [IBuffer](../windows.storage.streams/ibuffer.md).
     * @remarks
     * Use this method to copy pixel data from a [SoftwareBitmap](softwarebitmap.md) into the [PixelBuffer](../windows.ui.xaml.media.imaging/writeablebitmap_pixelbuffer.md) of a [WriteableBitmap](../windows.ui.xaml.media.imaging/writeablebitmap.md).
     * @param {IBuffer} buffer_ The target buffer to which the pixel data will be copied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.copytobuffer
     */
    CopyToBuffer(buffer_) {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.CopyToBuffer(buffer_)
    }

    /**
     * Gets a read-only representation of the [SoftwareBitmap](softwarebitmap.md) object.
     * @remarks
     * Determine if a software bitmap can be modified by checking the [IsReadOnly](softwarebitmap_isreadonly.md) property.
     * @returns {SoftwareBitmap} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.getreadonlyview
     */
    GetReadOnlyView() {
        if (!this.HasProp("__ISoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ISoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISoftwareBitmap := ISoftwareBitmap(outPtr)
        }

        return this.__ISoftwareBitmap.GetReadOnlyView()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap.close
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
