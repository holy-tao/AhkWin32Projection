#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionProjectedShadowCaster.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object that casts a projected shadow.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcaster
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionProjectedShadowCaster extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionProjectedShadowCaster

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionProjectedShadowCaster.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the brush used to draw the shadow.
     * @remarks
     * The brush must be a [CompositionColorBrush](compositioncolorbrush.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcaster.brush
     * @type {CompositionBrush} 
     */
    Brush {
        get => this.get_Brush()
        set => this.put_Brush(value)
    }

    /**
     * Gets or sets the Visual that casts the shadow.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadowcaster.castingvisual
     * @type {Visual} 
     */
    CastingVisual {
        get => this.get_CastingVisual()
        set => this.put_CastingVisual(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Brush() {
        if (!this.HasProp("__ICompositionProjectedShadowCaster")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCaster.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCaster := ICompositionProjectedShadowCaster(outPtr)
        }

        return this.__ICompositionProjectedShadowCaster.get_Brush()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Brush(value) {
        if (!this.HasProp("__ICompositionProjectedShadowCaster")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCaster.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCaster := ICompositionProjectedShadowCaster(outPtr)
        }

        return this.__ICompositionProjectedShadowCaster.put_Brush(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_CastingVisual() {
        if (!this.HasProp("__ICompositionProjectedShadowCaster")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCaster.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCaster := ICompositionProjectedShadowCaster(outPtr)
        }

        return this.__ICompositionProjectedShadowCaster.get_CastingVisual()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_CastingVisual(value) {
        if (!this.HasProp("__ICompositionProjectedShadowCaster")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadowCaster.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadowCaster := ICompositionProjectedShadowCaster(outPtr)
        }

        return this.__ICompositionProjectedShadowCaster.put_CastingVisual(value)
    }

;@endregion Instance Methods
}
