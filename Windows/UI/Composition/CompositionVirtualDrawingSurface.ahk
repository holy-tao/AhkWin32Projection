#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionDrawingSurface.ahk
#Include .\ICompositionVirtualDrawingSurface.ahk
#Include .\ICompositionVirtualDrawingSurfaceFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents sparsely allocated bitmaps that can be associated with visuals for composition in a visual tree.
 * @remarks
 * `CompositionVirtualDrawingSurface` is similar to [CompositionDrawingSurface](compositiondrawingsurface.md), except the surface is sparsely allocated. The content can be rendered using [Win2D](https://github.com/Microsoft/Win2D) (or D2D).
 * 
 * The virtual drawing surface is designed for use in scenarios where an application needs to define a large amount of content but only expects a small portion of content to be visible to a user at a given time. For example, think of a long scrolling document or webpage. In such cases, the app only needs to draw the part of the surface that is currently visible to the user, and can defer drawing portions that are not visible until later when they become visible.
 * 
 * The maximum size of a virtual surface is 2^24(16M) pixels. This limit has been imposed because of floating point precision limits, that come into play beyond that size, which prevents guaranteed accurate pixel alignment of drawn patches.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionvirtualdrawingsurface
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionVirtualDrawingSurface extends CompositionDrawingSurface {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionVirtualDrawingSurface

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionVirtualDrawingSurface.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Clears portions of a virtual drawing surface that were previously defined. Areas that are cleared will be treated as empty once again, and video memory that was previously backing them will be reclaimed.
     * @param {Integer} rects_length 
     * @param {Pointer<RectInt32>} rects The region of the drawing surface to trim.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionvirtualdrawingsurface.trim
     */
    Trim(rects_length, rects) {
        if (!this.HasProp("__ICompositionVirtualDrawingSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionVirtualDrawingSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionVirtualDrawingSurface := ICompositionVirtualDrawingSurface(outPtr)
        }

        return this.__ICompositionVirtualDrawingSurface.Trim(rects_length, rects)
    }

;@endregion Instance Methods
}
