#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositeVideoFrameContext.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides context for performing a custom overlay operation within the [CompositeFrame](ivideocompositor_compositeframe_269150036.md) method.
 * @remarks
 * To retrieve an instance of this class, implement the [CompositeFrame](ivideocompositor_compositeframe_269150036.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.compositevideoframecontext
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class CompositeVideoFrameContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositeVideoFrameContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositeVideoFrameContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of Direct3D surfaces to be used in an overlay operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.compositevideoframecontext.surfacestooverlay
     * @type {IVectorView<IDirect3DSurface>} 
     */
    SurfacesToOverlay {
        get => this.get_SurfacesToOverlay()
    }

    /**
     * Gets the background frame for an overlay operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.compositevideoframecontext.backgroundframe
     * @type {VideoFrame} 
     */
    BackgroundFrame {
        get => this.get_BackgroundFrame()
    }

    /**
     * Gets the output frame for an overlay operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.compositevideoframecontext.outputframe
     * @type {VideoFrame} 
     */
    OutputFrame {
        get => this.get_OutputFrame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<IDirect3DSurface>} 
     */
    get_SurfacesToOverlay() {
        if (!this.HasProp("__ICompositeVideoFrameContext")) {
            if ((queryResult := this.QueryInterface(ICompositeVideoFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeVideoFrameContext := ICompositeVideoFrameContext(outPtr)
        }

        return this.__ICompositeVideoFrameContext.get_SurfacesToOverlay()
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_BackgroundFrame() {
        if (!this.HasProp("__ICompositeVideoFrameContext")) {
            if ((queryResult := this.QueryInterface(ICompositeVideoFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeVideoFrameContext := ICompositeVideoFrameContext(outPtr)
        }

        return this.__ICompositeVideoFrameContext.get_BackgroundFrame()
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_OutputFrame() {
        if (!this.HasProp("__ICompositeVideoFrameContext")) {
            if ((queryResult := this.QueryInterface(ICompositeVideoFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeVideoFrameContext := ICompositeVideoFrameContext(outPtr)
        }

        return this.__ICompositeVideoFrameContext.get_OutputFrame()
    }

    /**
     * Gets a [MediaOverlay](../windows.media.editing/mediaoverlay.md) object for the provided Direct3D surface.
     * @param {IDirect3DSurface} surfaceToOverlay The Direct3D surface.
     * @returns {MediaOverlay} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.compositevideoframecontext.getoverlayforsurface
     */
    GetOverlayForSurface(surfaceToOverlay) {
        if (!this.HasProp("__ICompositeVideoFrameContext")) {
            if ((queryResult := this.QueryInterface(ICompositeVideoFrameContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeVideoFrameContext := ICompositeVideoFrameContext(outPtr)
        }

        return this.__ICompositeVideoFrameContext.GetOverlayForSurface(surfaceToOverlay)
    }

;@endregion Instance Methods
}
