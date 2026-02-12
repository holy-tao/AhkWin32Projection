#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionGraphicsDevice.ahk
#Include .\ICompositionGraphicsDevice2.ahk
#Include .\ICompositionGraphicsDevice3.ahk
#Include .\ICompositionGraphicsDevice4.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CompositionGraphicsDevice.ahk
#Include .\RenderingDeviceReplacedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Used to create all hardware bound resources for a given DirectX device on a compositor session. CompositionGraphicsDevice contains a DirectX device that is used to perform the GPU operations. Developers can obtain a Graphics device from the compositor top level object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongraphicsdevice
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionGraphicsDevice extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionGraphicsDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionGraphicsDevice.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRenderingDeviceReplacedToken")) {
            this.remove_RenderingDeviceReplaced(this.__OnRenderingDeviceReplacedToken)
            this.__OnRenderingDeviceReplaced.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Creates an instance of [CompositionDrawingSurface](compositiondrawingsurface.md).
     * @remarks
     * If the requested pixel format is unsupported by the graphics device, an exception will be thrown.
     * @param {SIZE} sizePixels The size in pixels of the surface.
     * @param {Integer} pixelFormat The pixel format of the surface.
     * @param {Integer} alphaMode How the alpha channel should be handled.
     * @returns {CompositionDrawingSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongraphicsdevice.createdrawingsurface
     */
    CreateDrawingSurface(sizePixels, pixelFormat, alphaMode) {
        if (!this.HasProp("__ICompositionGraphicsDevice")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice := ICompositionGraphicsDevice(outPtr)
        }

        return this.__ICompositionGraphicsDevice.CreateDrawingSurface(sizePixels, pixelFormat, alphaMode)
    }

    /**
     * 
     * @param {TypedEventHandler<CompositionGraphicsDevice, RenderingDeviceReplacedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RenderingDeviceReplaced(handler) {
        if (!this.HasProp("__ICompositionGraphicsDevice")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice := ICompositionGraphicsDevice(outPtr)
        }

        return this.__ICompositionGraphicsDevice.add_RenderingDeviceReplaced(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RenderingDeviceReplaced(token) {
        if (!this.HasProp("__ICompositionGraphicsDevice")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice := ICompositionGraphicsDevice(outPtr)
        }

        return this.__ICompositionGraphicsDevice.remove_RenderingDeviceReplaced(token)
    }

    /**
     * Creates an instance of CompositionDrawingSurface.
     * @remarks
     * If the requested pixel format is unsupported by the graphics device, an exception will be thrown.
     * @param {SizeInt32} sizePixels The size of the drawing surface in pixels.
     * @param {Integer} pixelFormat The pixel format of the drawing surface.
     * @param {Integer} alphaMode The alpha mode of the drawing surface.
     * @returns {CompositionDrawingSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongraphicsdevice.createdrawingsurface2
     */
    CreateDrawingSurface2(sizePixels, pixelFormat, alphaMode) {
        if (!this.HasProp("__ICompositionGraphicsDevice2")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice2 := ICompositionGraphicsDevice2(outPtr)
        }

        return this.__ICompositionGraphicsDevice2.CreateDrawingSurface2(sizePixels, pixelFormat, alphaMode)
    }

    /**
     * Creates an instance of CompositionVirtualDrawingSurface.
     * @param {SizeInt32} sizePixels The size in pixels of the drawing surface.
     * @param {Integer} pixelFormat The pixel format of the drawing surface.
     * @param {Integer} alphaMode The alpha mode of the drawing surface.
     * @returns {CompositionVirtualDrawingSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongraphicsdevice.createvirtualdrawingsurface
     */
    CreateVirtualDrawingSurface(sizePixels, pixelFormat, alphaMode) {
        if (!this.HasProp("__ICompositionGraphicsDevice2")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice2 := ICompositionGraphicsDevice2(outPtr)
        }

        return this.__ICompositionGraphicsDevice2.CreateVirtualDrawingSurface(sizePixels, pixelFormat, alphaMode)
    }

    /**
     * Creates an instance of [CompositionMipMapSurface](compositionmipmapsurface.md).
     * @param {SizeInt32} sizePixels The size in pixels of the surface.
     * @param {Integer} pixelFormat The pixel format of the surface.
     * @param {Integer} alphaMode How the alpha channel should be handled.
     * @returns {CompositionMipmapSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongraphicsdevice.createmipmapsurface
     */
    CreateMipmapSurface(sizePixels, pixelFormat, alphaMode) {
        if (!this.HasProp("__ICompositionGraphicsDevice3")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice3 := ICompositionGraphicsDevice3(outPtr)
        }

        return this.__ICompositionGraphicsDevice3.CreateMipmapSurface(sizePixels, pixelFormat, alphaMode)
    }

    /**
     * Trims any graphics memory allocated by the graphics device on the app's behalf.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongraphicsdevice.trim
     */
    Trim() {
        if (!this.HasProp("__ICompositionGraphicsDevice3")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice3 := ICompositionGraphicsDevice3(outPtr)
        }

        return this.__ICompositionGraphicsDevice3.Trim()
    }

    /**
     * Captures various source elements, including visual trees owned by an application, to a composition surface.
     * @param {Visual} captureVisual The visual to capture.
     * @param {SizeInt32} size_ The size in pixels of the surface.
     * @param {Integer} pixelFormat The pixel format of the surface.
     * @param {Integer} alphaMode How the alpha channel should be handled.
     * @param {Float} sdrBoost The amount to boost SDR.
     * @returns {IAsyncOperation<ICompositionSurface>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongraphicsdevice.captureasync
     */
    CaptureAsync(captureVisual, size_, pixelFormat, alphaMode, sdrBoost) {
        if (!this.HasProp("__ICompositionGraphicsDevice4")) {
            if ((queryResult := this.QueryInterface(ICompositionGraphicsDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGraphicsDevice4 := ICompositionGraphicsDevice4(outPtr)
        }

        return this.__ICompositionGraphicsDevice4.CaptureAsync(captureVisual, size_, pixelFormat, alphaMode, sdrBoost)
    }

;@endregion Instance Methods
}
