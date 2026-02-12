#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicCameraRenderingParameters.ahk
#Include .\IHolographicCameraRenderingParameters2.ahk
#Include .\IHolographicCameraRenderingParameters3.ahk
#Include .\IHolographicCameraRenderingParameters4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents per-camera parameters for rendering holographic content.
 * @remarks
 * Calling this method acquires a buffer that will be used to update the primary layer for the holographic compositor. The buffer remains acquired until the app presents the HolographicFrame used to create the corresponding HolographicCameraRenderingParameters object, at which time the buffer will be committed to the holographic compositor. Apps can have up to two primary layer buffers acquired at any given time. The primary layer buffer format is 8-bit BGRA.
 * 
 * Your app will generally achieve optimal visual quality by calling CommitDirect3D11DepthBuffer to commit an accurate depth buffer whose pixels can be mapped back to meters using your specified near and far planes and then not calling SetFocusPoint.  This enables depth-based stabilization of the holograms in your frame.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicCameraRenderingParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicCameraRenderingParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicCameraRenderingParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Direct3D 11 device for this camera.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.direct3d11device
     * @type {IDirect3DDevice} 
     */
    Direct3D11Device {
        get => this.get_Direct3D11Device()
    }

    /**
     * Gets the Direct3D 11 back buffer surface for this camera. Apps must retrieve a new back buffer surface for rendering each frame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.direct3d11backbuffer
     * @type {IDirect3DSurface} 
     */
    Direct3D11BackBuffer {
        get => this.get_Direct3D11BackBuffer()
    }

    /**
     * Gets or sets the kind of reprojection the app is requesting to stabilize its holographic rendering relative to the user's head motion.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.reprojectionmode
     * @type {Integer} 
     */
    ReprojectionMode {
        get => this.get_ReprojectionMode()
        set => this.put_ReprojectionMode(value)
    }

    /**
     * Gets or sets whether the application is displaying protected content.
     * @remarks
     * While content protection is enabled, rendered content will be visible only in the headset, disabling the Mixed Reality Portal's preview.
     * 
     * If [IsHardwareContentProtectionEnabled](holographiccamera_ishardwarecontentprotectionenabled.md) is set to true, **IsContentProtectionEnabled** will always return true.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.iscontentprotectionenabled
     * @type {Boolean} 
     */
    IsContentProtectionEnabled {
        get => this.get_IsContentProtectionEnabled()
        set => this.put_IsContentProtectionEnabled(value)
    }

    /**
     * Gets or sets the reprojection method used for the associated [HolographicCamera](holographiccamera.md) for a given [HolographicFrame](holographicframe.md). The system will select a default reprojection method based on the device and/or platform capabilities.
     * @remarks
     * Apps that use a particular mode can use this property to select the mode on devices which support that mode. Check to see what modes are supported on a device by calling [HolographicViewConfiguration.SupportedDepthReprojectionMethods](holographicviewconfiguration_supporteddepthreprojectionmethods.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.depthreprojectionmethod
     * @type {Integer} 
     */
    DepthReprojectionMethod {
        get => this.get_DepthReprojectionMethod()
        set => this.put_DepthReprojectionMethod(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the stationary point in the holographic space that the user will likely focus on for the current frame.
     * @remarks
     * There are two types of LSR your app can use - Planar LSR and Depth LSR. Planar LSR is used by HoloLens and Windows Mixed Reality devices. Depth LSR is available on HoloLens 2.
     * 
     * Planar LSR is the default mode where the platform stabilizes a single plane in the scene. This function allows you to specify that plane. If you set a manual focus point, you must set it again each frame, or it will reset to its default.  Otherwise, the default focus point will be 2 meters away from the headset, with a normal facing the headset.
     * 
     * Depth LSR is obtained by calling [CommitDirect3D11DepthBuffer](holographiccamerarenderingparameters_commitdirect3d11depthbuffer_1424767526.md). Your app will generally achieve optimal visual quality by calling CommitDirect3D11DepthBuffer to commit an accurate depth buffer whose pixels can be mapped back to meters using your specified near and far planes.
     * 
     * LSR will use head velocity and stabilize things to the world, but if the application knows that something is moving through the scene and that the user is following it, then the FocusPoint velocity can be used to stabilize things to that moving object. 
     * 
     * If your app is using Depth LSR, SetFocusPoint is still important if you wish to stabilize to a moving object in the scene.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system of the position vector.
     * @param {Vector3} position The location of the focus point in the specified coordinate system.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint
     */
    SetFocusPoint(coordinateSystem, position) {
        if (!this.HasProp("__IHolographicCameraRenderingParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters := IHolographicCameraRenderingParameters(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters.SetFocusPoint(coordinateSystem, position)
    }

    /**
     * Sets the stationary point in the holographic space that the user will focus on, as well as the normal for a focus plane through that point.
     * @remarks
     * There are two types of LSR your app can use - Planar LSR and Depth LSR. Planar LSR is used by HoloLens and Windows Mixed Reality devices. Depth LSR is available on HoloLens 2.
     * 
     * Planar LSR is the default mode where the platform stabilizes a single plane in the scene. This function allows you to specify that plane. If you set a manual focus point, you must set it again each frame, or it will reset to its default.  Otherwise, the default focus point will be 2 meters away from the headset, with a normal facing the headset.
     * 
     * Depth LSR is obtained by calling [CommitDirect3D11DepthBuffer](holographiccamerarenderingparameters_commitdirect3d11depthbuffer_1424767526.md). Your app will generally achieve optimal visual quality by calling CommitDirect3D11DepthBuffer to commit an accurate depth buffer whose pixels can be mapped back to meters using your specified near and far planes.
     * 
     * LSR will use head velocity and stabilize things to the world, but if the application knows that something is moving through the scene and that the user is following it, then the FocusPoint velocity can be used to stabilize things to that moving object. 
     * 
     * If your app is using Depth LSR, SetFocusPoint is still important if you wish to stabilize to a moving object in the scene.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system of the position and normal vectors.
     * @param {Vector3} position The location of the focus point in the specified coordinate system.
     * @param {Vector3} normal The normal of the focus point in the specified coordinate system, if known. If there is no obvious normal, have it face the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint
     */
    SetFocusPointWithNormal(coordinateSystem, position, normal) {
        if (!this.HasProp("__IHolographicCameraRenderingParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters := IHolographicCameraRenderingParameters(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters.SetFocusPointWithNormal(coordinateSystem, position, normal)
    }

    /**
     * Sets the moving point in the holographic space that the user will focus on, as well as the normal for a focus plane through that point.
     * @remarks
     * There are two types of LSR your app can use - Planar LSR and Depth LSR. Planar LSR is used by HoloLens and Windows Mixed Reality devices. Depth LSR is available on HoloLens 2.
     * 
     * Planar LSR is the default mode where the platform stabilizes a single plane in the scene. This function allows you to specify that plane. If you set a manual focus point, you must set it again each frame, or it will reset to its default.  Otherwise, the default focus point will be 2 meters away from the headset, with a normal facing the headset.
     * 
     * Depth LSR is obtained by calling [CommitDirect3D11DepthBuffer](holographiccamerarenderingparameters_commitdirect3d11depthbuffer_1424767526.md). Your app will generally achieve optimal visual quality by calling CommitDirect3D11DepthBuffer to commit an accurate depth buffer whose pixels can be mapped back to meters using your specified near and far planes.
     * 
     * LSR will use head velocity and stabilize things to the world, but if the application knows that something is moving through the scene and that the user is following it, then the FocusPoint velocity can be used to stabilize things to that moving object. 
     * 
     * If your app is using Depth LSR, SetFocusPoint is still important if you wish to stabilize to a moving object in the scene.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system of the position, normal and velocity vectors.
     * @param {Vector3} position The location of the focus point in the specified coordinate system.
     * @param {Vector3} normal The normal of the focus point in the specified coordinate system, if known. If there is no obvious normal, have it face the user.
     * @param {Vector3} linearVelocity The velocity vector of the focus point in the specified coordinate system.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint
     */
    SetFocusPointWithNormalLinearVelocity(coordinateSystem, position, normal, linearVelocity) {
        if (!this.HasProp("__IHolographicCameraRenderingParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters := IHolographicCameraRenderingParameters(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters.SetFocusPointWithNormalLinearVelocity(coordinateSystem, position, normal, linearVelocity)
    }

    /**
     * 
     * @returns {IDirect3DDevice} 
     */
    get_Direct3D11Device() {
        if (!this.HasProp("__IHolographicCameraRenderingParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters := IHolographicCameraRenderingParameters(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters.get_Direct3D11Device()
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3D11BackBuffer() {
        if (!this.HasProp("__IHolographicCameraRenderingParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters := IHolographicCameraRenderingParameters(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters.get_Direct3D11BackBuffer()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReprojectionMode() {
        if (!this.HasProp("__IHolographicCameraRenderingParameters2")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters2 := IHolographicCameraRenderingParameters2(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters2.get_ReprojectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReprojectionMode(value) {
        if (!this.HasProp("__IHolographicCameraRenderingParameters2")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters2 := IHolographicCameraRenderingParameters2(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters2.put_ReprojectionMode(value)
    }

    /**
     * Provides a depth buffer for this frame to the holographic display pipeline, enabling depth-based stabilization of the frame relative to the user's head motion.
     * @remarks
     * If an app provides a depth buffer for a frame and then skips calling SetFocusPoint, the focus point and normal are inferred based on the depth buffer.  Your app will generally achieve optimal visual quality by committing an accurate depth buffer whose pixels can be mapped back to meters using your specified near and far planes and then not calling SetFocusPoint.
     * 
     * This method will make use of the Direct3D device you provided to the HolographicSpace.  If you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to call this method from your single Direct3D thread to avoid undefined behavior.
     * 
     * The following code example shows how to convert a depth buffer resource from a native [ID3D11Texture2D](/windows/win32/api/d3d11/nn-d3d11-id3d11texture2d) to a WinRT [IDirect3DSurface](/uwp/api/windows.graphics.directx.direct3d11.idirect3dsurface) interface that can be passed into **CommitDirect3D11DepthBuffer**. The **ID3D11Texture2D** must have been created with the [D3D11_BIND_SHADER_RESOURCE](/windows/win32/api/d3d11/ne-d3d11-d3d11_bind_flag) to be read by the system.
     * 
     * ```cppwinrt
     * inline winrt::Windows::Graphics::DirectX::Direct3D11::IDirect3DSurface CreateDepthTextureInteropObject(
     *         const Microsoft::WRL::ComPtr<ID3D11Texture2D> spTexture2D)
     * {
     *     // Direct3D interop APIs are used to provide the buffer to the WinRT API.
     *     Microsoft::WRL::ComPtr<IDXGIResource1> depthStencilResource;
     *     winrt::check_hresult(spTexture2D.As(&depthStencilResource));
     *     Microsoft::WRL::ComPtr<IDXGISurface2> depthDxgiSurface;
     *     winrt::check_hresult(depthStencilResource->CreateSubresourceSurface(0, &depthDxgiSurface));
     *     winrt::com_ptr<::IInspectable> inspectableSurface;
     *     winrt::check_hresult(
     *         CreateDirect3D11SurfaceFromDXGISurface(
     *             depthDxgiSurface.Get(),
     *             reinterpret_cast<IInspectable**>(winrt::put_abi(inspectableSurface))
     *         ));
     * 
     *     return inspectableSurface.as<winrt::Windows::Graphics::DirectX::Direct3D11::IDirect3DSurface>();
     * }
     * ```
     * 
     * The **CreateDepthTextureInteropObject** method shown in this example is included in the [Windows Mixed Reality App templates](https://marketplace.visualstudio.com/items?itemName=WindowsMixedRealityteam.WindowsMixedRealityAppTemplatesVSIX).
     * @param {IDirect3DSurface} value The Direct3D 11 surface containing the app's depth buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer
     */
    CommitDirect3D11DepthBuffer(value) {
        if (!this.HasProp("__IHolographicCameraRenderingParameters2")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters2 := IHolographicCameraRenderingParameters2(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters2.CommitDirect3D11DepthBuffer(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContentProtectionEnabled() {
        if (!this.HasProp("__IHolographicCameraRenderingParameters3")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters3 := IHolographicCameraRenderingParameters3(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters3.get_IsContentProtectionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsContentProtectionEnabled(value) {
        if (!this.HasProp("__IHolographicCameraRenderingParameters3")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters3 := IHolographicCameraRenderingParameters3(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters3.put_IsContentProtectionEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DepthReprojectionMethod() {
        if (!this.HasProp("__IHolographicCameraRenderingParameters4")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters4 := IHolographicCameraRenderingParameters4(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters4.get_DepthReprojectionMethod()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DepthReprojectionMethod(value) {
        if (!this.HasProp("__IHolographicCameraRenderingParameters4")) {
            if ((queryResult := this.QueryInterface(IHolographicCameraRenderingParameters4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicCameraRenderingParameters4 := IHolographicCameraRenderingParameters4(outPtr)
        }

        return this.__IHolographicCameraRenderingParameters4.put_DepthReprojectionMethod(value)
    }

;@endregion Instance Methods
}
