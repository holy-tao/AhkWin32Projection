#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IHolographicQuadLayer.ahk
#Include .\IHolographicQuadLayerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a retained texture for the system to display at a specified location on top of the app's primary rendered content.
 * @remarks
 * A quad layer is a texture that the system’s holographic compositor will render on behalf of the app at a specific location in the world.  This allows the compositor to directly sample from that quad texture when producing the final composited image, improving text quality and allowing for lower-resolution world content.  Unlike the primary layer's immediate-mode back buffer, which must be filled each frame, quad layers are retained.  Once added to a given HolographicCamera, each quad layer will continue to render at its specified location on top of that frame's primary layer back buffer until the quad layer is moved, updated or removed.
 * 
 * To display quad layers, an app creates the necessary HolographicQuadLayer instances and adds them to a HolographicCamera's mutable [QuadLayers](holographiccamera_quadlayers.md) list.  To synchronize a retained quad layer update with a given immediate-mode holographic frame, an app requests a [HolographicQuadLayerUpdateParameters](holographicquadlayerupdateparameters.md) instance from that frame by calling [HolographicFrame.GetQuadLayerUpdateParameters](holographicframe_getquadlayerupdateparameters_1786338093.md).  Any updates requested on that HolographicQuadLayerUpdateParameters instance will apply starting in that frame.
 * 
 * Apps may position quad layers in a stationary mode or display-relative mode, which affects how they are positioned in future frames if not moved explicitly:
 * * For a stationary quad, the app calls [UpdateLocationWithStationaryMode](holographicquadlayerupdateparameters_updatelocationwithstationarymode_1099037134.md) to specify the spatial position and orientation in the world at which a quad layer should appear.  This defines a plane, along with the 2D size of the quad in that plane centered around the specified position.
 * * For a display-relative quad, the app calls [UpdateLocationWithDisplayRelativeMode](holographicquadlayerupdateparameters_updatelocationwithdisplayrelativemode_881203171.md) to specify the spatial position and orientation in world coordinates relative to the display.
 * 
 * Quad layers are rendered in the specified order using the painter’s algorithm, entirely on top of the primary layer.  No depth-testing is done while rendering.  An app that moves one quad in front of another may reorder the quads in the layer list without having to refill the texture buffers.  An app that only wishes to render quad layers, for example during loading scenes, can disable the primary layer entirely by setting [IsPrimaryLayerEnabled](holographiccamera_isprimarylayerenabled.md) to false.
 * 
 * If an app no longer needs a quad layer, it may disable that layer by removing it from the camera, which allows the system to reclaim the content buffers allocated for it.  If the app knows it is permanently done with a layer, it may close it entirely.
 * 
 * Note that HolographicQuadLayer objects may use and retain device-based resources.  It is better to create a HolographicQuadLayer once and re-use it as much as possible, as opposed to creating and disposing of them - for example, every time a menu is brought up. HolographicQuadLayer objects should be disposed of and recreated in Direct3D device lost scenarios.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayer
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicQuadLayer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClosable

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClosable.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new quad layer with a specified texture size, using a default pixel format of DXGI_FORMAT_B8G8R8A8_UNORM.
     * @remarks
     * Note that the spatial location and extents of this new quad layer in world coordinates must also be specified by requesting a [HolographicQuadLayerUpdateParameters](holographicquadlayerupdateparameters.md) instance.
     * @param {SIZE} size_ The size in pixels of the texture that will back this quad layer.
     * @returns {HolographicQuadLayer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayer.#ctor
     */
    static Create(size_) {
        if (!HolographicQuadLayer.HasProp("__IHolographicQuadLayerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicQuadLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicQuadLayerFactory.IID)
            HolographicQuadLayer.__IHolographicQuadLayerFactory := IHolographicQuadLayerFactory(factoryPtr)
        }

        return HolographicQuadLayer.__IHolographicQuadLayerFactory.Create(size_)
    }

    /**
     * Creates a new quad layer with a specified texture size and pixel format.
     * @remarks
     * Note that the spatial location and extents of this new quad layer in world coordinates must also be specified by requesting a [HolographicQuadLayerUpdateParameters](holographicquadlayerupdateparameters.md) instance.
     * 
     * The pixel format specified must be an RGB format, such as DXGI_FORMAT_B8G8R8A8_UNORM.
     * @param {SIZE} size_ The size in pixels of the texture that will back this quad layer.
     * @param {Integer} pixelFormat The pixel format for the texture that will back this quad layer.
     * @returns {HolographicQuadLayer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayer.#ctor
     */
    static CreateWithPixelFormat(size_, pixelFormat) {
        if (!HolographicQuadLayer.HasProp("__IHolographicQuadLayerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicQuadLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicQuadLayerFactory.IID)
            HolographicQuadLayer.__IHolographicQuadLayerFactory := IHolographicQuadLayerFactory(factoryPtr)
        }

        return HolographicQuadLayer.__IHolographicQuadLayerFactory.CreateWithPixelFormat(size_, pixelFormat)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The pixel format for the texture that will back this quad layer.
     * @remarks
     * The pixel format specified must be an RGB format, such as DXGI_FORMAT_B8G8R8A8_UNORM.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayer.pixelformat
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
    }

    /**
     * The size in pixels of the texture that will back this quad layer.
     * @remarks
     * Note that the spatial location and extents of this new quad layer in world coordinates must also be specified by requesting a [HolographicQuadLayerUpdateParameters](holographicquadlayerupdateparameters.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayer.size
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
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
     * Closes a quad layer, reclaiming any associated system resources.
     * @remarks
     * If an app knows that it will not need a given quad layer later, it may permanently close that layer.  This allows the system to reclaim any buffers used to retain that layer's texture.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicquadlayer.close
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
     * 
     * @returns {Integer} 
     */
    get_PixelFormat() {
        if (!this.HasProp("__IHolographicQuadLayer")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayer := IHolographicQuadLayer(outPtr)
        }

        return this.__IHolographicQuadLayer.get_PixelFormat()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        if (!this.HasProp("__IHolographicQuadLayer")) {
            if ((queryResult := this.QueryInterface(IHolographicQuadLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicQuadLayer := IHolographicQuadLayer(outPtr)
        }

        return this.__IHolographicQuadLayer.get_Size()
    }

;@endregion Instance Methods
}
