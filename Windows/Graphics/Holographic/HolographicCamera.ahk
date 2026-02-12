#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicCamera.ahk
#Include .\IHolographicCamera2.ahk
#Include .\IHolographicCamera3.ahk
#Include .\IHolographicCamera4.ahk
#Include .\IHolographicCamera5.ahk
#Include .\IHolographicCamera6.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides per-frame rendering functionality for a [HolographicViewConfiguration](holographicviewconfiguration.md) on a [HolographicDisplay](holographicdisplay.md).
 * @remarks
 * An app renders to the back buffer for at least one HolographicCamera before presenting each HolographicFrame.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicCamera extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicCamera

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicCamera.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the dimensions in pixels of the back buffers allocated for this camera.
     * @remarks
     * Each frame, your application may set [ViewportScaleFactor](holographiccamera_viewportscalefactor.md) to decide how much of the back buffer to use for rendering.  The system will scale the rendered image to fill the display.
     * 
     * To change the render target size for a [HolographicCamera](holographiccamera.md), retrieve its [ViewConfiguration](holographiccamera_viewconfiguration.md) property and use it to call [RequestRenderTargetSize](holographicviewconfiguration_requestrendertargetsize_54701265.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.rendertargetsize
     * @type {SIZE} 
     */
    RenderTargetSize {
        get => this.get_RenderTargetSize()
    }

    /**
     * Gets or sets the scale factor to apply to the default viewport size.
     * @remarks
     * Each frame, the system decides the size of the viewport within the render target that the app must render that frame. Sometimes the system may lower this to free up system resources, for example when video capture is occurring. Regardless of the viewport size, the rendered image is always scaled up to the full size of the displays. An app looking to lower its rendering cost for other reasons can request a smaller viewport.
     * 
     * You can specify a scale factor between 0.0 and 1.0, which is multiplied by the default viewport size. In future frames, the system will specify that you render to the nearest valid viewport size to this requested size.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.viewportscalefactor
     * @type {Float} 
     */
    ViewportScaleFactor {
        get => this.get_ViewportScaleFactor()
        set => this.put_ViewportScaleFactor(value)
    }

    /**
     * Gets whether the current display is stereo rather than mono.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.isstereo
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * Gets the unique identifier for the HolographicCamera.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets rendering parameters related to display's left-eye viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.leftviewportparameters
     * @type {HolographicCameraViewportParameters} 
     */
    LeftViewportParameters {
        get => this.get_LeftViewportParameters()
    }

    /**
     * Gets rendering parameters related to display's right-eye viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.rightviewportparameters
     * @type {HolographicCameraViewportParameters} 
     */
    RightViewportParameters {
        get => this.get_RightViewportParameters()
    }

    /**
     * Gets metadata about the display represented by this HolographicCamera.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.display
     * @type {HolographicDisplay} 
     */
    Display {
        get => this.get_Display()
    }

    /**
     * Gets or sets whether this camera should display the primary back buffer filled by the app.
     * @remarks
     * The primary layer displays the pixels that an app renders into the back buffer returned by [HolographicCameraRenderingParameters](holographiccamerarenderingparameters.md).  The primary layer appears behind any quad layers.  If an app only intends to render quad layers, for example during a loading screen, it may disable the primary layer.  When the primary layer is disabled, any pixels not covered by quad layers will remain black.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.isprimarylayerenabled
     * @type {Boolean} 
     */
    IsPrimaryLayerEnabled {
        get => this.get_IsPrimaryLayerEnabled()
        set => this.put_IsPrimaryLayerEnabled(value)
    }

    /**
     * Gets the maximum number of quad layers supported by the current system.
     * @remarks
     * MaxQuadLayerCount will be 0 on HoloLens, which does not support quad layers.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.maxquadlayercount
     * @type {Integer} 
     */
    MaxQuadLayerCount {
        get => this.get_MaxQuadLayerCount()
    }

    /**
     * Gets the mutable list of quad layers to display on top of this camera's primary back buffer.
     * @remarks
     * Quad layers are rendered in the specified order using the painter’s algorithm, entirely on top of the primary layer.  No depth-testing is done while rendering.  An app that moves one quad in front of another may reorder the quads in this list without having to refill the texture buffers.  An app that only wishes to render quad layers, for example during loading scenes, can disable the primary layer entirely by setting [IsPrimaryLayerEnabled](holographiccamera_isprimarylayerenabled.md) to false.
     * 
     * If an app no longer needs a quad layer, it may disable that layer by removing it from the camera, which allows the system to reclaim the content buffers allocated for it.  If the app knows it is permanently done with a layer, it may close it entirely.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.quadlayers
     * @type {IVector<HolographicQuadLayer>} 
     */
    QuadLayers {
        get => this.get_QuadLayers()
    }

    /**
     * Gets whether the display supports overriding the viewport rectangles.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.canoverrideviewport
     * @type {Boolean} 
     */
    CanOverrideViewport {
        get => this.get_CanOverrideViewport()
    }

    /**
     * Gets whether hardware content protection is supported for this [HolographicCamera](holographiccamera.md).
     * @remarks
     * To enable hardware content protection for the primary layer's back buffer, set [IsHardwareContentProtectionEnabled](holographiccamera_ishardwarecontentprotectionenabled.md) to true.
     * 
     * To enable hardware content protection for a quad layer's buffer, call [AcquireBufferToUpdateContentWithHardwareProtection](holographicquadlayerupdateparameters_acquirebuffertoupdatecontentwithhardwareprotection_809854092.md) whenever you acquire new buffers for updates.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.ishardwarecontentprotectionsupported
     * @type {Boolean} 
     */
    IsHardwareContentProtectionSupported {
        get => this.get_IsHardwareContentProtectionSupported()
    }

    /**
     * Gets or sets whether this [HolographicCamera](holographiccamera.md) will produce hardware-protected back buffers for the primary layer.
     * @remarks
     * If this property is successfully set to true, the [Direct3D11BackBuffer](holographiccamerarenderingparameters_direct3d11backbuffer.md) property will return hardware-protected back buffers for the primary layer.  Setting this property to true will fail unless [IsHardwareContentProtectionSupported](holographiccamera_ishardwarecontentprotectionsupported.md) returns true.
     * 
     * While content protection is enabled, rendered content will be visible only in the headset, disabling the Mixed Reality Portal's preview.
     * 
     * Changes to this property will take effect on future frames, unless [GetRenderingParameters](holographicframe_getrenderingparameters_2127053540.md) has not yet been called for a given frame.  To ensure that a particular back buffer is hardware-protected, you can check that its [D3D11_RESOURCE_MISC_HW_PROTECTED](/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag) flag is set.
     * 
     * > [!NOTE]
     * > This property does not affect content protection for quad layers.  To enable hardware content protection for a quad layer's buffer, call [AcquireBufferToUpdateContentWithHardwareProtection](holographicquadlayerupdateparameters_acquirebuffertoupdatecontentwithhardwareprotection_809854092.md) whenever you acquire new buffers for updates.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.ishardwarecontentprotectionenabled
     * @type {Boolean} 
     */
    IsHardwareContentProtectionEnabled {
        get => this.get_IsHardwareContentProtectionEnabled()
        set => this.put_IsHardwareContentProtectionEnabled(value)
    }

    /**
     * Gets the [HolographicViewConfiguration](holographicviewconfiguration.md) that this [HolographicCamera](HolographicCamera.md) provides rendering for.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.viewconfiguration
     * @type {HolographicViewConfiguration} 
     */
    ViewConfiguration {
        get => this.get_ViewConfiguration()
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
    get_RenderTargetSize() {
        if (!this.HasProp("__IHolographicCamera")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera := IHolographicCamera(outPtr)
        }

        return this.__IHolographicCamera.get_RenderTargetSize()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportScaleFactor() {
        if (!this.HasProp("__IHolographicCamera")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera := IHolographicCamera(outPtr)
        }

        return this.__IHolographicCamera.get_ViewportScaleFactor()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ViewportScaleFactor(value) {
        if (!this.HasProp("__IHolographicCamera")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera := IHolographicCamera(outPtr)
        }

        return this.__IHolographicCamera.put_ViewportScaleFactor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        if (!this.HasProp("__IHolographicCamera")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera := IHolographicCamera(outPtr)
        }

        return this.__IHolographicCamera.get_IsStereo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IHolographicCamera")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera := IHolographicCamera(outPtr)
        }

        return this.__IHolographicCamera.get_Id()
    }

    /**
     * Sets the distance, along the z-axis, from the origin of view space to the near plane of the view frustum.
     * @param {Float} value The near plane distance, in meters. By default, this is set to 0.1 meters.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.setnearplanedistance
     */
    SetNearPlaneDistance(value) {
        if (!this.HasProp("__IHolographicCamera")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera := IHolographicCamera(outPtr)
        }

        return this.__IHolographicCamera.SetNearPlaneDistance(value)
    }

    /**
     * Sets the distance, along the z-axis, from the origin of view space to the far plane of the view frustum.
     * @param {Float} value The far plane distance, in meters. By default, this is set to 20 meters.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.setfarplanedistance
     */
    SetFarPlaneDistance(value) {
        if (!this.HasProp("__IHolographicCamera")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera := IHolographicCamera(outPtr)
        }

        return this.__IHolographicCamera.SetFarPlaneDistance(value)
    }

    /**
     * 
     * @returns {HolographicCameraViewportParameters} 
     */
    get_LeftViewportParameters() {
        if (!this.HasProp("__IHolographicCamera2")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera2 := IHolographicCamera2(outPtr)
        }

        return this.__IHolographicCamera2.get_LeftViewportParameters()
    }

    /**
     * 
     * @returns {HolographicCameraViewportParameters} 
     */
    get_RightViewportParameters() {
        if (!this.HasProp("__IHolographicCamera2")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera2 := IHolographicCamera2(outPtr)
        }

        return this.__IHolographicCamera2.get_RightViewportParameters()
    }

    /**
     * 
     * @returns {HolographicDisplay} 
     */
    get_Display() {
        if (!this.HasProp("__IHolographicCamera2")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera2 := IHolographicCamera2(outPtr)
        }

        return this.__IHolographicCamera2.get_Display()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrimaryLayerEnabled() {
        if (!this.HasProp("__IHolographicCamera3")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera3 := IHolographicCamera3(outPtr)
        }

        return this.__IHolographicCamera3.get_IsPrimaryLayerEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPrimaryLayerEnabled(value) {
        if (!this.HasProp("__IHolographicCamera3")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera3 := IHolographicCamera3(outPtr)
        }

        return this.__IHolographicCamera3.put_IsPrimaryLayerEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxQuadLayerCount() {
        if (!this.HasProp("__IHolographicCamera3")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera3 := IHolographicCamera3(outPtr)
        }

        return this.__IHolographicCamera3.get_MaxQuadLayerCount()
    }

    /**
     * 
     * @returns {IVector<HolographicQuadLayer>} 
     */
    get_QuadLayers() {
        if (!this.HasProp("__IHolographicCamera3")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera3 := IHolographicCamera3(outPtr)
        }

        return this.__IHolographicCamera3.get_QuadLayers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanOverrideViewport() {
        if (!this.HasProp("__IHolographicCamera4")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera4 := IHolographicCamera4(outPtr)
        }

        return this.__IHolographicCamera4.get_CanOverrideViewport()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHardwareContentProtectionSupported() {
        if (!this.HasProp("__IHolographicCamera5")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera5 := IHolographicCamera5(outPtr)
        }

        return this.__IHolographicCamera5.get_IsHardwareContentProtectionSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHardwareContentProtectionEnabled() {
        if (!this.HasProp("__IHolographicCamera5")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera5 := IHolographicCamera5(outPtr)
        }

        return this.__IHolographicCamera5.get_IsHardwareContentProtectionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHardwareContentProtectionEnabled(value) {
        if (!this.HasProp("__IHolographicCamera5")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera5 := IHolographicCamera5(outPtr)
        }

        return this.__IHolographicCamera5.put_IsHardwareContentProtectionEnabled(value)
    }

    /**
     * 
     * @returns {HolographicViewConfiguration} 
     */
    get_ViewConfiguration() {
        if (!this.HasProp("__IHolographicCamera6")) {
            if ((queryResult := this.QueryInterface(IHolographicCamera6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCamera6 := IHolographicCamera6(outPtr)
        }

        return this.__IHolographicCamera6.get_ViewConfiguration()
    }

;@endregion Instance Methods
}
