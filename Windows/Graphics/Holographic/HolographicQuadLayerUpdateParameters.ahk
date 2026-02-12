#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicQuadLayerUpdateParameters.ahk
#Include .\IHolographicQuadLayerUpdateParameters2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an update payload that lets an application configure a specific quad layer's parameters from a given frame forward.
 * @remarks
 * To display quad layers, an application creates the necessary [HolographicQuadLayer](holographicquadlayer.md) instances and adds them to a [HolographicCamera](holographiccamera.md)'s mutable [QuadLayers](holographiccamera_quadlayers.md) list.  To synchronize a retained quad layer update with a given immediate-mode holographic frame, an application requests a HolographicQuadLayerUpdateParameters instance from that frame by calling [HolographicFrame.GetQuadLayerUpdateParameters](holographicframe_getquadlayerupdateparameters_1786338093.md).  Any updates requested on that **HolographicQuadLayerUpdateParameters** instance will apply starting in that frame.
 * 
 * > [!NOTE]
 * > The [AcquireBufferToUpdateContent](holographicquadlayerupdateparameters_acquirebuffertoupdatecontent_748006292.md) or [AcquireBufferToUpdateContentWithHardwareProtection](holographicquadlayerupdateparameters_acquirebuffertoupdatecontentwithhardwareprotection_809854092.md) method must be called when updating a **HolographicQuadLayer** object for the first time.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicQuadLayerUpdateParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicQuadLayerUpdateParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicQuadLayerUpdateParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether hardware content protection is supported for this quad layer.
     * @remarks
     * To enable hardware content protection for a quad layer's buffer, call [AcquireBufferToUpdateContentWithHardwareProtection](holographicquadlayerupdateparameters_acquirebuffertoupdatecontentwithhardwareprotection_809854092.md) whenever you acquire new buffers for updates.
     * 
     * To enable hardware content protection for the primary layer's back buffer, set [IsHardwareContentProtectionEnabled](holographiccamera_ishardwarecontentprotectionenabled.md) to true.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.canacquirewithhardwareprotection
     * @type {Boolean} 
     */
    CanAcquireWithHardwareProtection {
        get => this.get_CanAcquireWithHardwareProtection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a Direct3D 11 back buffer whose contents will be displayed for this quad layer from this frame forward.
     * @remarks
     * This method acquires a buffer that will be used to update the quad layer. Apps must acquire a new buffer each time they need to change the texture. Avoid calling this method if you do not need to update the texture.
     * 
     * To avoid repeated texture load costs, apps may load a single quad layer buffer containing a texture atlas and then call [UpdateViewport](holographicquadlayerupdateparameters_updateviewport_1003624236.md) to select a subset rectangle within the texture to display.
     * 
     * This method will make use of the Direct3D device you provided to the HolographicSpace.  If you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to call this method from your single Direct3D thread to avoid undefined behavior.
     * 
     * **Note:** This method must be called when updating a HolographicQuadLayer object for the first time.
     * @returns {IDirect3DSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.acquirebuffertoupdatecontent
     */
    AcquireBufferToUpdateContent() {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters := IHolographicQuadLayerUpdateParameters(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters.AcquireBufferToUpdateContent()
    }

    /**
     * Updates the viewport rectangle within the quad layer's texture that will be displayed to the screen.
     * @remarks
     * By default, quad layers display the full contents of the texture buffer to fill the specified extents.  If the app fills the buffer with a texture atlas, it can then specify a viewport to fill the quad layer with just a subset of the image.
     * 
     * For example, if the quad layer is used to display a reticle, the app can fill the texture buffer with one texture containing four reticle images.  The app can then change just the viewport rectangle to select among those four images.
     * @param {RECT} value The viewport rectangle.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.updateviewport
     */
    UpdateViewport(value) {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters := IHolographicQuadLayerUpdateParameters(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters.UpdateViewport(value)
    }

    /**
     * Updates whether this quad layer contains protected content.
     * @remarks
     * While content protection is enabled for an active quad layer, rendered content will be visible only in the headset, disabling the Mixed Reality Portal's preview.
     * @param {Boolean} value Whether content protection should be enabled for this quad layer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.updatecontentprotectionenabled
     */
    UpdateContentProtectionEnabled(value) {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters := IHolographicQuadLayerUpdateParameters(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters.UpdateContentProtectionEnabled(value)
    }

    /**
     * Updates the extents of this quad layer in world coordinates.
     * @remarks
     * You must also call [UpdateLocationWithDisplayRelativeMode](holographicquadlayerupdateparameters_updatelocationwithdisplayrelativemode_881203171.md) or [UpdateLocationWithStationaryMode](holographicquadlayerupdateparameters_updatelocationwithstationarymode_1099037134.md) to specify the center point for the quad layer.  The quad will be displayed centered around that location, with its full width and height specified by these extents.
     * 
     * Note that these extents are distinct from the HolographicQuadLayer's [Size](holographicquadlayer_size.md) property, which defines the pixel size of the texture that backs the quad.
     * @param {Vector2} value The full width and height of the quad layer in meters.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.updateextents
     */
    UpdateExtents(value) {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters := IHolographicQuadLayerUpdateParameters(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters.UpdateExtents(value)
    }

    /**
     * Updates the center location of this quad layer in the world, setting it to remain at that world location in future frames.
     * @remarks
     * For a stationary quad, the app calls UpdateLocationWithStationaryMode to specify the spatial position and orientation in the world at which a quad layer should appear.
     * 
     * Stationary quads will continue to be rendered in the same place if their position is not changed, as if placed in a stationary frame of reference.  To keep a quad more strongly anchored, for example to a spatial anchor or stage, the app must also update its location whenever that coordinate system adjusts.  For apps with anchored content, it will likely be most straightforward to just update each quad’s location each frame.
     * 
     * You must also call [UpdateExtents](holographicquadlayerupdateparameters_updateextents_1256384983.md) to specify the width and height of the quad layer, centered around this point.
     * @param {SpatialCoordinateSystem} coordinateSystem The reference SpatialCoordinateSystem object.
     * @param {Vector3} position A point for the center of the quad plane, specified relative to the origin of the reference coordinate system.
     * @param {Quaternion} orientation_ A rotation for the normal of the quad plane, specified relative to the neutral orientation of the reference coordinate system.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.updatelocationwithstationarymode
     */
    UpdateLocationWithStationaryMode(coordinateSystem, position, orientation_) {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters := IHolographicQuadLayerUpdateParameters(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters.UpdateLocationWithStationaryMode(coordinateSystem, position, orientation_)
    }

    /**
     * Updates the center location of this quad layer relative to the center of the displays, setting it to remain at that display-relative location in future frames.
     * @remarks
     * For a display-relative quad, the app calls UpdateLocationWithDisplayRelativeMode to specify the spatial position and orientation in world coordinates relative to the center of the displays.
     * 
     * You must also call [UpdateExtents](holographicquadlayerupdateparameters_updateextents_1256384983.md) to specify the width and height of the quad layer, centered around this point.
     * @param {Vector3} position A point for the center of the quad plane, specified relative to the center of the displays.
     * @param {Quaternion} orientation_ A rotation for the normal of the quad plane, specified relative to a normal facing the displays.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.updatelocationwithdisplayrelativemode
     */
    UpdateLocationWithDisplayRelativeMode(position, orientation_) {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters := IHolographicQuadLayerUpdateParameters(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters.UpdateLocationWithDisplayRelativeMode(position, orientation_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanAcquireWithHardwareProtection() {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters2")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters2 := IHolographicQuadLayerUpdateParameters2(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters2.get_CanAcquireWithHardwareProtection()
    }

    /**
     * Gets a hardware-protected Direct3D 11 back buffer whose contents will be displayed for this quad layer from this frame forward.
     * @remarks
     * This method acquires a hardware-protected buffer that will be used to update the quad layer. Applications must acquire a new buffer each time they need to change the texture. Avoid calling this method if you do not need to update the texture.
     * 
     * This method call will fail unless [CanAcquireWithHardwareProtection](holographicquadlayerupdateparameters_canacquirewithhardwareprotection.md) returns true.
     * 
     * To avoid repeated texture load costs, applications may load a single quad layer buffer containing a texture atlas and then call [UpdateViewport](holographicquadlayerupdateparameters_updateviewport_1003624236.md) to select a subset rectangle within the texture to display.
     * 
     * This method will make use of the Direct3D device you provided to the [HolographicSpace](holographicspace.md).  If you've specified the [D3D11_CREATE_DEVICE_SINGLETHREADED](/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag) flag on your device, be sure to call this method from your single Direct3D thread to avoid undefined behavior.
     * 
     * To enable hardware content protection for the primary layer's buffer, set [HolographicCamera.IsHardwareContentProtectionEnabled](holographiccamera_ishardwarecontentprotectionenabled.md) to true.
     * 
     * > [!NOTE]
     * > This method must be called when updating a [HolographicQuadLayer](holographicquadlayer.md) object for the first time.
     * @returns {IDirect3DSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters.acquirebuffertoupdatecontentwithhardwareprotection
     */
    AcquireBufferToUpdateContentWithHardwareProtection() {
        if (!this.HasProp("__IHolographicQuadLayerUpdateParameters2")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayerUpdateParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayerUpdateParameters2 := IHolographicQuadLayerUpdateParameters2(outPtr)
        }

        return this.__IHolographicQuadLayerUpdateParameters2.AcquireBufferToUpdateContentWithHardwareProtection()
    }

;@endregion Instance Methods
}
