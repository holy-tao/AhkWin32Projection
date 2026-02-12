#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionClip.ahk
#Include .\ICompositionGeometricClip.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a shape that clips a portion of a visual. The visible portion of the visual is a shape defined by a [CompositionGeometry](compositiongeometry.md). The portion of the visual outside the geometry is clipped.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongeometricclip
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionGeometricClip extends CompositionClip {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionGeometricClip

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionGeometricClip.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets CompositionGeometry that defines the shape of the clip.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongeometricclip.geometry
     * @type {CompositionGeometry} 
     */
    Geometry {
        get => this.get_Geometry()
        set => this.put_Geometry(value)
    }

    /**
     * Gets or sets a CompositionViewBox that maps the shape visual tree coordinates onto the visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongeometricclip.viewbox
     * @type {CompositionViewBox} 
     */
    ViewBox {
        get => this.get_ViewBox()
        set => this.put_ViewBox(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionGeometry} 
     */
    get_Geometry() {
        if (!this.HasProp("__ICompositionGeometricClip")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometricClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometricClip := ICompositionGeometricClip(outPtr)
        }

        return this.__ICompositionGeometricClip.get_Geometry()
    }

    /**
     * 
     * @param {CompositionGeometry} value 
     * @returns {HRESULT} 
     */
    put_Geometry(value) {
        if (!this.HasProp("__ICompositionGeometricClip")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometricClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometricClip := ICompositionGeometricClip(outPtr)
        }

        return this.__ICompositionGeometricClip.put_Geometry(value)
    }

    /**
     * 
     * @returns {CompositionViewBox} 
     */
    get_ViewBox() {
        if (!this.HasProp("__ICompositionGeometricClip")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometricClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometricClip := ICompositionGeometricClip(outPtr)
        }

        return this.__ICompositionGeometricClip.get_ViewBox()
    }

    /**
     * 
     * @param {CompositionViewBox} value 
     * @returns {HRESULT} 
     */
    put_ViewBox(value) {
        if (!this.HasProp("__ICompositionGeometricClip")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometricClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometricClip := ICompositionGeometricClip(outPtr)
        }

        return this.__ICompositionGeometricClip.put_ViewBox(value)
    }

;@endregion Instance Methods
}
