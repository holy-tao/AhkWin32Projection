#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicCameraPose.ahk
#Include .\IHolographicCameraPose2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the predicted location of a holographic camera for a particular frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicCameraPose extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicCameraPose

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicCameraPose.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the HolographicCamera that's described by this camera pose.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.holographiccamera
     * @type {HolographicCamera} 
     */
    HolographicCamera {
        get => this.get_HolographicCamera()
    }

    /**
     * Gets the viewport rectangle that the app must render to for this camera in this frame.
     * @remarks
     * To shrink this viewport for future frames, set the ViewportScaleFactor on the HolographicCamera.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.viewport
     * @type {RECT} 
     */
    Viewport {
        get => this.get_Viewport()
    }

    /**
     * Gets the stereo projection transform for this camera pose.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.projectiontransform
     * @type {HolographicStereoTransform} 
     */
    ProjectionTransform {
        get => this.get_ProjectionTransform()
    }

    /**
     * Gets the near plane distance for this frame, which you set by calling the HolographicCamera.SetNearPlaneDistance method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.nearplanedistance
     * @type {Float} 
     */
    NearPlaneDistance {
        get => this.get_NearPlaneDistance()
    }

    /**
     * Gets the far plane distance for this frame, which is set by calling the HolographicCamera.SetFarPlaneDistance method.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.farplanedistance
     * @type {Float} 
     */
    FarPlaneDistance {
        get => this.get_FarPlaneDistance()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HolographicCamera} 
     */
    get_HolographicCamera() {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.get_HolographicCamera()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Viewport() {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.get_Viewport()
    }

    /**
     * Gets the stereo view transform for this camera pose, expressed as a transform from the specified coordinate system. This method will return null if the specified coordinate system cannot be located at the moment.
     * @remarks
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system from which the rendered geometry should be transformed.
     * @returns {IReference<HolographicStereoTransform>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.trygetviewtransform
     */
    TryGetViewTransform(coordinateSystem) {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.TryGetViewTransform(coordinateSystem)
    }

    /**
     * 
     * @returns {HolographicStereoTransform} 
     */
    get_ProjectionTransform() {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.get_ProjectionTransform()
    }

    /**
     * Gets the predicted conservative culling frustum for this camera pose, expressed in the specified coordinate system.
     * @remarks
     * This frustum is wider than the displays to account for uncertainty in the camera's pose prediction. As you get closer to the target frame time, this uncertainty reduces and the culling frustum gets smaller in size. This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the culling frustum.
     * @returns {IReference<SpatialBoundingFrustum>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.trygetcullingfrustum
     */
    TryGetCullingFrustum(coordinateSystem) {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.TryGetCullingFrustum(coordinateSystem)
    }

    /**
     * Gets the predicted view frustum for the current pose, expressed in the specified coordinate system.
     * @remarks
     * If this is a stereo display, this is the combined frustum of both stereo views, including the left and right view and projection matrices.
     * 
     * This frustum shares the same dimensions as the true view frustum at the time of rendering, although it may be off by some amount due to prediction error. Call TryGetCullingFrustum to get a conservative frustum that takes this uncertainty into account.
     * 
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the visible frustum.
     * @returns {IReference<SpatialBoundingFrustum>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.trygetvisiblefrustum
     */
    TryGetVisibleFrustum(coordinateSystem) {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.TryGetVisibleFrustum(coordinateSystem)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NearPlaneDistance() {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.get_NearPlaneDistance()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FarPlaneDistance() {
        if (!this.HasProp("__IHolographicCameraPose")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose := IHolographicCameraPose(outPtr)
        }

        return this.__IHolographicCameraPose.get_FarPlaneDistance()
    }

    /**
     * Notifies the compositor that the app is rendering with an alternate suboptimal view transform this frame.
     * @remarks
     * **Warning:** Rendering a frame with any view transform other than that frame's [TryGetViewTransform](holographiccamerapose_trygetviewtransform_1213971379.md) value will result in increased misprediction and thus reduced visual quality.  This quality reduction will be most pronounced if the alternate view transform's position component is changed.
     * 
     * However, if you must render a frame with an alternate view transform, be sure to call this method and provide that transform.  Visual quality will be even worse if the compositor does not know the actual transforms used for rendering.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which the alternate suboptimal view transform will be expressed.
     * @param {HolographicStereoTransform} coordinateSystemToViewTransform The alternate suboptimal view transform.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.overrideviewtransform
     */
    OverrideViewTransform(coordinateSystem, coordinateSystemToViewTransform) {
        if (!this.HasProp("__IHolographicCameraPose2")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose2 := IHolographicCameraPose2(outPtr)
        }

        return this.__IHolographicCameraPose2.OverrideViewTransform(coordinateSystem, coordinateSystemToViewTransform)
    }

    /**
     * Notifies the compositor that the app is rendering with an alternate suboptimal projection transform this frame.
     * @remarks
     * **Warning:** Rendering a frame with any projection transform other than that frame's [ProjectionTransform](holographiccamerapose_projectiontransform.md) value will result in reduced visual quality.
     * 
     * However, if you must render a frame with an alternate projection transform, be sure to call this method and provide that transform.  Visual quality will be even worse if the compositor does not know the actual transforms used for rendering.
     * @param {HolographicStereoTransform} projectionTransform The alternate suboptimal projection transform.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.overrideprojectiontransform
     */
    OverrideProjectionTransform(projectionTransform) {
        if (!this.HasProp("__IHolographicCameraPose2")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose2 := IHolographicCameraPose2(outPtr)
        }

        return this.__IHolographicCameraPose2.OverrideProjectionTransform(projectionTransform)
    }

    /**
     * Specifies an alternate viewport rectangle within the frame buffer that the app is rendering into this frame.
     * @remarks
     * It is an error to call OverrideViewport on devices where [CanOverrideViewport](holographiccamera_canoverrideviewport.md) returns false, such as HoloLens.
     * @param {RECT} leftViewport The left eye viewport rectangle.
     * @param {RECT} rightViewport The right eye viewport rectangle.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose.overrideviewport
     */
    OverrideViewport(leftViewport, rightViewport) {
        if (!this.HasProp("__IHolographicCameraPose2")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraPose2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraPose2 := IHolographicCameraPose2(outPtr)
        }

        return this.__IHolographicCameraPose2.OverrideViewport(leftViewport, rightViewport)
    }

;@endregion Instance Methods
}
