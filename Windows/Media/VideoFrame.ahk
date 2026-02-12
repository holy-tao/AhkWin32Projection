#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoFrame.ahk
#Include .\IMediaFrame.ahk
#Include ..\Foundation\IClosable.ahk
#Include .\IVideoFrame2.ahk
#Include .\IVideoFrameFactory.ahk
#Include .\IVideoFrameStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a single frame of video data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class VideoFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoFrame.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [VideoFrame](videoframe.md) class.
     * @param {Integer} format The pixel format of the video frame.
     * @param {Integer} width The width of the video frame, in pixels.
     * @param {Integer} height The height of the video frame, in pixels.
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.#ctor
     */
    static Create(format, width, height) {
        if (!VideoFrame.HasProp("__IVideoFrameFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.VideoFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoFrameFactory.IID)
            VideoFrame.__IVideoFrameFactory := IVideoFrameFactory(factoryPtr)
        }

        return VideoFrame.__IVideoFrameFactory.Create(format, width, height)
    }

    /**
     * Initializes a new instance of the [VideoFrame](videoframe.md) class.
     * @param {Integer} format The pixel format of the video frame.
     * @param {Integer} width The width of the video frame, in pixels.
     * @param {Integer} height The height of the video frame, in pixels.
     * @param {Integer} alpha The alpha mode of the video frame.
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.#ctor
     */
    static CreateWithAlpha(format, width, height, alpha) {
        if (!VideoFrame.HasProp("__IVideoFrameFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.VideoFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoFrameFactory.IID)
            VideoFrame.__IVideoFrameFactory := IVideoFrameFactory(factoryPtr)
        }

        return VideoFrame.__IVideoFrameFactory.CreateWithAlpha(format, width, height, alpha)
    }

    /**
     * Creates a new instance of the [VideoFrame](videoframe.md) class for which the image data is stored in an [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface) allocated by the supplied Direct3D device.
     * @remarks
     * The following pixel formats, defined in the [DirectXPixelFormat](../windows.graphics.directx/directxpixelformat.md) enumeration, are supported by **VideoFrame**. 
     * 
     * * **DirectXPixelFormat_R16G16B16A16UIntNormalized** 
     * * **DirectXPixelFormat_R8G8B8A8UIntNormalized**
     * * **DirectXPixelFormat_B8G8R8X8UIntNormalized** 
     * * **DirectXPixelFormat_B8G8R8A8UIntNormalized** 
     * * **DirectXPixelFormat_NV12**
     * * **DirectXPixelFormat_P010** 
     * * **DirectXPixelFormat_Yuy2** 
     * * **DirectXPixelFormat_R16UIntNormalized** 
     * * **DirectXPixelFormat_R8UIntNormalized** 
     * 
     * All other formats are unsupported. Attempting to create a **VideoFrame** with an unsupported format will cause the method to fail with a COM exception. 
     * 
     * If the *device* parameter is null, the **IDXGISurface** is allocated using the default Direct3D device.
     * @param {Integer} format A value from the [DirectXPixelFormat](../windows.graphics.directx/directxpixelformat.md) enumeration, specifying the pixel format of the created **VideoFrame**. Not all pixel formats are supported. See the Remarks section for more information.
     * @param {Integer} width The width, in pixels, of the created **VideoFrame**.
     * @param {Integer} height The height, in pixels, of the created **VideoFrame**.
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.createasdirect3d11surfacebacked
     */
    static CreateAsDirect3D11SurfaceBacked(format, width, height) {
        if (!VideoFrame.HasProp("__IVideoFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.VideoFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoFrameStatics.IID)
            VideoFrame.__IVideoFrameStatics := IVideoFrameStatics(factoryPtr)
        }

        return VideoFrame.__IVideoFrameStatics.CreateAsDirect3D11SurfaceBacked(format, width, height)
    }

    /**
     * Creates a new instance of the [VideoFrame](videoframe.md) class for which the image data is stored in an [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface) allocated by the default Direct3D device.
     * @remarks
     * The following pixel formats, defined in the [DirectXPixelFormat](../windows.graphics.directx/directxpixelformat.md) enumeration, are supported by **VideoFrame**. 
     * 
     * * **DirectXPixelFormat_R16G16B16A16UIntNormalized** 
     * * **DirectXPixelFormat_R8G8B8A8UIntNormalized**
     * * **DirectXPixelFormat_B8G8R8X8UIntNormalized** 
     * * **DirectXPixelFormat_B8G8R8A8UIntNormalized** 
     * * **DirectXPixelFormat_NV12**
     * * **DirectXPixelFormat_P010** 
     * * **DirectXPixelFormat_Yuy2** 
     * * **DirectXPixelFormat_R16UIntNormalized** 
     * * **DirectXPixelFormat_R8UIntNormalized** 
     * 
     * All other formats are unsupported. Attempting to create a **VideoFrame** with an unsupported format will cause the method to fail with a COM exception. 
     * 
     * The overload of this method, [CreateAsDirect3D11SurfaceBacked](videoframe_createasdirect3d11surfacebacked_857687066.md), allows you to supply the [IDirect3DDevice](../windows.graphics.directx.direct3d11/idirect3ddevice.md) that is used to allocate the backing surface of the video frame.
     * @param {Integer} format A value from the [DirectXPixelFormat](../windows.graphics.directx/directxpixelformat.md) enumeration, specifying the pixel format of the created **VideoFrame**. Not all pixel formats are supported. See the Remarks section for more information.
     * @param {Integer} width The width, in pixels, of the created **VideoFrame**.
     * @param {Integer} height The height, in pixels, of the created **VideoFrame**.
     * @param {IDirect3DDevice} device 
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.createasdirect3d11surfacebacked
     */
    static CreateAsDirect3D11SurfaceBackedWithDevice(format, width, height, device) {
        if (!VideoFrame.HasProp("__IVideoFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.VideoFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoFrameStatics.IID)
            VideoFrame.__IVideoFrameStatics := IVideoFrameStatics(factoryPtr)
        }

        return VideoFrame.__IVideoFrameStatics.CreateAsDirect3D11SurfaceBackedWithDevice(format, width, height, device)
    }

    /**
     * Creates a new instance of the [VideoFrame](videoframe.md) class from the provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md).
     * @remarks
     * If the *bitmap* parameter is null, an argument exception will be thrown.
     * @param {SoftwareBitmap} bitmap_ The [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) from which the **VideoFrame** is created.
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.createwithsoftwarebitmap
     */
    static CreateWithSoftwareBitmap(bitmap_) {
        if (!VideoFrame.HasProp("__IVideoFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.VideoFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoFrameStatics.IID)
            VideoFrame.__IVideoFrameStatics := IVideoFrameStatics(factoryPtr)
        }

        return VideoFrame.__IVideoFrameStatics.CreateWithSoftwareBitmap(bitmap_)
    }

    /**
     * Creates a new instance of the [VideoFrame](videoframe.md) class for which the image data is stored in the provided [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface).
     * @remarks
     * If the *surface* parameter is null, an argument exception will occur. The supplied [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface) must use one of the supported pixel formats. **VideoFrame** supports the formats corresponding to the following [DirectXPixelFormat](../windows.graphics.directx/directxpixelformat.md) values:
     * 
     * * **DirectXPixelFormat_R16G16B16A16UIntNormalized** 
     * * **DirectXPixelFormat_R8G8B8A8UIntNormalized**
     * * **DirectXPixelFormat_B8G8R8X8UIntNormalized** 
     * * **DirectXPixelFormat_B8G8R8A8UIntNormalized** 
     * * **DirectXPixelFormat_NV12**
     * * **DirectXPixelFormat_P010** 
     * * **DirectXPixelFormat_Yuy2** 
     * * **DirectXPixelFormat_R16UIntNormalized** 
     * * **DirectXPixelFormat_R8UIntNormalized** 
     * 
     * All other formats are unsupported. If a surface with an unsupported format is specified, a COM exception will be thrown.
     * @param {IDirect3DSurface} surface The [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface) in which the image data is stored.
     * @returns {VideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.createwithdirect3d11surface
     */
    static CreateWithDirect3D11Surface(surface) {
        if (!VideoFrame.HasProp("__IVideoFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.VideoFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoFrameStatics.IID)
            VideoFrame.__IVideoFrameStatics := IVideoFrameStatics(factoryPtr)
        }

        return VideoFrame.__IVideoFrameStatics.CreateWithDirect3D11Surface(surface)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the SoftwareBitmap object containing the pixel data of the video frame, when one is present.
     * @remarks
     * The pixel data of a [VideoFrame](videoframe.md) can be stored either in a [Direct3DSurface](videoframe_direct3dsurface.md) or a SoftwareBitmap. This property will be null if the data for the frame is not stored in a SoftwareBitmap. If the data is stored in a Direct3D surface, you can access it using the [Direct3DSurface](videoframe_direct3dsurface.md) property of the [VideoFrame](videoframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.softwarebitmap
     * @type {SoftwareBitmap} 
     */
    SoftwareBitmap {
        get => this.get_SoftwareBitmap()
    }

    /**
     * Gets the [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) object containing the pixel data of the video frame, when one is present.
     * @remarks
     * The pixel data of a [VideoFrame](videoframe.md) can be stored either in a [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) or a [SoftwareBitmap](videoframe_softwarebitmap.md). This property will be null if the data for the frame is not stored in a [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md). If the data is stored in a software bitmap, you can access it using the [SoftwareBitmap](videoframe_softwarebitmap.md) property of the [VideoFrame](videoframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.direct3dsurface
     * @type {IDirect3DSurface} 
     */
    Direct3DSurface {
        get => this.get_Direct3DSurface()
    }

    /**
     * Gets a string indicating the type of video data the video frame contains.
     * @remarks
     * This value is non-standardized and can be set to an aribtrary value. For example, a camera device driver may set this to an OEM-specific string.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a value indicating whether the video frame is read-only.
     * @remarks
     * When this value is true, both the video data and the mutable properties of the video frame are read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets or sets the relative time of the frame within the video stream.
     * @remarks
     * Use [SystemRelativeTime](imediaframe_systemrelativetime.md) to get a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.relativetime
     * @type {IReference<TimeSpan>} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
        set => this.put_RelativeTime(value)
    }

    /**
     * Gets or sets a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @remarks
     * Use [RelativeTime](audioframe_relativetime.md) to get a timestamp that is relative to the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.systemrelativetime
     * @type {IReference<TimeSpan>} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
        set => this.put_SystemRelativeTime(value)
    }

    /**
     * Gets or sets the duration of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value that indicates whether an video frame is the first frame after a gap in the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.isdiscontinuous
     * @type {Boolean} 
     */
    IsDiscontinuous {
        get => this.get_IsDiscontinuous()
        set => this.put_IsDiscontinuous(value)
    }

    /**
     * Gets the extended property set which enables getting and setting properties on the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.extendedproperties
     * @type {IPropertySet} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
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
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        if (!this.HasProp("__IVideoFrame")) {
            if ((queryResult := this.QueryInterface(IVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoFrame := IVideoFrame(outPtr)
        }

        return this.__IVideoFrame.get_SoftwareBitmap()
    }

    /**
     * Copies the current [VideoFrame](videoframe.md) into a provided [VideoFrame](videoframe.md) object.
     * @remarks
     * The target frame must have the same pixel format, width, height, and alpha mode as the source frame.
     * @param {VideoFrame} frame_ The target video frame into which the current frame will be copied.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.copytoasync
     */
    CopyToAsync(frame_) {
        if (!this.HasProp("__IVideoFrame")) {
            if ((queryResult := this.QueryInterface(IVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoFrame := IVideoFrame(outPtr)
        }

        return this.__IVideoFrame.CopyToAsync(frame_)
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3DSurface() {
        if (!this.HasProp("__IVideoFrame")) {
            if ((queryResult := this.QueryInterface(IVideoFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoFrame := IVideoFrame(outPtr)
        }

        return this.__IVideoFrame.get_Direct3DSurface()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Type()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsReadOnly()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_RelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_RelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_RelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_RelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SystemRelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_SystemRelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SystemRelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_SystemRelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_Duration(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Duration()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDiscontinuous(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_IsDiscontinuous(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscontinuous() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsDiscontinuous()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_ExtendedProperties()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Copies the current [VideoFrame](videoframe.md) into a provided [VideoFrame](videoframe.md) object.
     * @remarks
     * The target frame must have the same pixel format, width, height, and alpha mode as the source frame.
     * @param {VideoFrame} frame_ The target video frame into which the current frame will be copied.
     * @param {IReference<BitmapBounds>} sourceBounds 
     * @param {IReference<BitmapBounds>} destinationBounds 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoframe.copytoasync
     */
    CopyToWithBoundsAsync(frame_, sourceBounds, destinationBounds) {
        if (!this.HasProp("__IVideoFrame2")) {
            if ((queryResult := this.QueryInterface(IVideoFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoFrame2 := IVideoFrame2(outPtr)
        }

        return this.__IVideoFrame2.CopyToWithBoundsAsync(frame_, sourceBounds, destinationBounds)
    }

;@endregion Instance Methods
}
