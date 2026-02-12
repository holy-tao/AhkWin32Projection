#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicViewConfiguration.ahk
#Include .\IHolographicViewConfiguration2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a view configuration for a [HolographicDisplay](holographicdisplay.md). This object provides apps with fine-grained control of the rendering configuration for a [HolographicCamera](holographiccamera.md).
 * @remarks
 * This class facilitates render target size and pixel format configuration for a **HolographicCamera**. This class also facilitates holographic rendering from alternate points of view, such as the built-in photo/video camera for mixed reality capture. See [TryGetViewConfiguration](holographicdisplay_trygetviewconfiguration_2033828652.md) for more info.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicViewConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicViewConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicViewConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the native render target size for this HolographicViewConfiguration.
     * @remarks
     * For [HolographicViewConfiguration](holographicviewconfiguration.md) objects which are of kind [Display](holographicviewconfigurationkind.md), this represents the width and height of the display mode.
     * 
     * For [HolographicViewConfiguration](holographicviewconfiguration.md) objects which are of kind [PhotoVideoCamera](holographicviewconfigurationkind.md), this represents the native capture resolution for the rendered portion of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.nativerendertargetsize
     * @type {SIZE} 
     */
    NativeRenderTargetSize {
        get => this.get_NativeRenderTargetSize()
    }

    /**
     * Gets the render target size for this HolographicViewConfiguration.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.rendertargetsize
     * @type {SIZE} 
     */
    RenderTargetSize {
        get => this.get_RenderTargetSize()
    }

    /**
     * Gets a list of the supported pixel formats for this HolographicViewConfiguration.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.supportedpixelformats
     * @type {IVectorView<Integer>} 
     */
    SupportedPixelFormats {
        get => this.get_SupportedPixelFormats()
    }

    /**
     * Gets or sets the pixel format of this HolographicViewConfiguration.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.pixelformat
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
        set => this.put_PixelFormat(value)
    }

    /**
     * Gets whether this HolographicViewConfiguration is stereoscopic.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.isstereo
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * Gets the refresh rate for this HolographicViewConfiguration.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.refreshrate
     * @type {Float} 
     */
    RefreshRate {
        get => this.get_RefreshRate()
    }

    /**
     * Gets the kind of rendering this HolographicViewConfiguration is for.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the [HolographicDisplay](holographicdisplay.md) which this HolographicViewConfiguration is for.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.display
     * @type {HolographicDisplay} 
     */
    Display {
        get => this.get_Display()
    }

    /**
     * Gets or sets whether this HolographicViewConfiguration is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets the list of depth reprojection modes which are supported for this [HolographicViewConfiguration](holographicviewconfiguration.md).
     * @remarks
     * Set the reprojection mode of a Holographic camera by setting the [DepthReprojectionMethod](holographiccamerarenderingparameters_depthreprojectionmethod.md) property on the [HolographicCameraRenderingParameters](holographiccamerarenderingparameters.md) associated with the camera for a given [HolographicFrame](holographicframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.supporteddepthreprojectionmethods
     * @type {IVectorView<Integer>} 
     */
    SupportedDepthReprojectionMethods {
        get => this.get_SupportedDepthReprojectionMethods()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_NativeRenderTargetSize() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_NativeRenderTargetSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_RenderTargetSize() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_RenderTargetSize()
    }

    /**
     * Requests a new minimum render target size for this HolographicViewConfiguration.
     * @param {SIZE} size_ A [Size](../windows.foundation/size.md) representing the desired render target size. Must be at least [1, 1].
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration.requestrendertargetsize
     */
    RequestRenderTargetSize(size_) {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.RequestRenderTargetSize(size_)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPixelFormats() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_SupportedPixelFormats()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelFormat() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_PixelFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PixelFormat(value) {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.put_PixelFormat(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_IsStereo()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RefreshRate() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_RefreshRate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_Kind()
    }

    /**
     * 
     * @returns {HolographicDisplay} 
     */
    get_Display() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_Display()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IHolographicViewConfiguration")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration := IHolographicViewConfiguration(outPtr)
        }

        return this.__IHolographicViewConfiguration.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedDepthReprojectionMethods() {
        if (!this.HasProp("__IHolographicViewConfiguration2")) {
            if ((queryResult := this.QueryInterface(IHolographicViewConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicViewConfiguration2 := IHolographicViewConfiguration2(outPtr)
        }

        return this.__IHolographicViewConfiguration2.get_SupportedDepthReprojectionMethods()
    }

;@endregion Instance Methods
}
