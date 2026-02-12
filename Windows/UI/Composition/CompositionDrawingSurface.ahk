#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionDrawingSurface.ahk
#Include .\ICompositionDrawingSurface2.ahk
#Include .\ICompositionDrawingSurfaceFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A drawing surface for interoperation with Direct2D or Direct3D.
 * @remarks
 * `CompositionDrawingSurface` is a fixed sized surface that can be rendered with:
 * 
 * - an image using [LoadedImageSurface](/uwp/api/windows.ui.xaml.media.loadedimagesurface).
 * - a custom drawing using [Win2D](https://github.com/Microsoft/Win2D) (orD2D).
 * - a video using [MediaPlayer](/uwp/api/Windows.Media.Playback.MediaPlayer).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionDrawingSurface extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionDrawingSurface

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionDrawingSurface.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The alpha mode of the drawing surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.alphamode
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
    }

    /**
     * The pixel format of the drawing surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.pixelformat
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
    }

    /**
     * The size of the drawing surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.size
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * The size of the drawing surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.sizeint32
     * @type {SizeInt32} 
     */
    SizeInt32 {
        get => this.get_SizeInt32()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlphaMode() {
        if (!this.HasProp("__ICompositionDrawingSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface := ICompositionDrawingSurface(outPtr)
        }

        return this.__ICompositionDrawingSurface.get_AlphaMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelFormat() {
        if (!this.HasProp("__ICompositionDrawingSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface := ICompositionDrawingSurface(outPtr)
        }

        return this.__ICompositionDrawingSurface.get_PixelFormat()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        if (!this.HasProp("__ICompositionDrawingSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface := ICompositionDrawingSurface(outPtr)
        }

        return this.__ICompositionDrawingSurface.get_Size()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_SizeInt32() {
        if (!this.HasProp("__ICompositionDrawingSurface2")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface2 := ICompositionDrawingSurface2(outPtr)
        }

        return this.__ICompositionDrawingSurface2.get_SizeInt32()
    }

    /**
     * Resizes the drawing surface to the specified size.
     * @param {SizeInt32} sizePixels The new size in pixels for the drawing surface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.resize
     */
    Resize(sizePixels) {
        if (!this.HasProp("__ICompositionDrawingSurface2")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface2 := ICompositionDrawingSurface2(outPtr)
        }

        return this.__ICompositionDrawingSurface2.Resize(sizePixels)
    }

    /**
     * Scrolls the drawing surface.
     * @param {PointInt32} offset The scrolling offset.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.scroll
     */
    Scroll(offset) {
        if (!this.HasProp("__ICompositionDrawingSurface2")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface2 := ICompositionDrawingSurface2(outPtr)
        }

        return this.__ICompositionDrawingSurface2.Scroll(offset)
    }

    /**
     * Scrolls the drawing surface.
     * @param {PointInt32} offset The scrolling offset.
     * @param {RectInt32} scrollRect The scrolling rectangle.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.scroll
     */
    ScrollRect(offset, scrollRect) {
        if (!this.HasProp("__ICompositionDrawingSurface2")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface2 := ICompositionDrawingSurface2(outPtr)
        }

        return this.__ICompositionDrawingSurface2.ScrollRect(offset, scrollRect)
    }

    /**
     * Scrolls the drawing surface using the specified clip rectangle.
     * @param {PointInt32} offset The scrolling offset.
     * @param {RectInt32} clipRect The clipping rectangle to apply.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.scrollwithclip
     */
    ScrollWithClip(offset, clipRect) {
        if (!this.HasProp("__ICompositionDrawingSurface2")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface2 := ICompositionDrawingSurface2(outPtr)
        }

        return this.__ICompositionDrawingSurface2.ScrollWithClip(offset, clipRect)
    }

    /**
     * Scrolls the drawing surface with the specified clip rectangle.
     * @param {PointInt32} offset The scrolling offset.
     * @param {RectInt32} clipRect The clipping rectangle to apply.
     * @param {RectInt32} scrollRect The scrolling rectangle.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiondrawingsurface.scrollwithclip
     */
    ScrollRectWithClip(offset, clipRect, scrollRect) {
        if (!this.HasProp("__ICompositionDrawingSurface2")) {
            if ((queryResult := this.QueryInterface(ICompositionDrawingSurface2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDrawingSurface2 := ICompositionDrawingSurface2(outPtr)
        }

        return this.__ICompositionDrawingSurface2.ScrollRectWithClip(offset, clipRect, scrollRect)
    }

;@endregion Instance Methods
}
