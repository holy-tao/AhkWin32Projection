#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionShadow.ahk
#Include .\IDropShadow.ahk
#Include .\IDropShadow2.ahk
#Include ..\..\..\Guid.ahk

/**
 * A drop shadow cast by a [SpriteVisual](spritevisual.md) or [LayerVisual](layervisual.md).
 * @remarks
 * DropShadows are a common way to provide an indication of depth in application UI. To add a DropShadow, create an instance of DropShadow and attach it using the .Shadow property on a [SpriteVisual](spritevisual.md) or [LayerVisual](layervisual.md).
 * 
 * Shadows are not clipped by the implicit clip set on the visual (based on size of the visual). However, shadows respect the explicit clip set on the visual using SpriteVisual.Clip Property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.dropshadow
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class DropShadow extends CompositionShadow {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDropShadow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDropShadow.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The radius of the Gaussian blur used to generate the shadow. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.dropshadow.blurradius
     * @type {Float} 
     */
    BlurRadius {
        get => this.get_BlurRadius()
        set => this.put_BlurRadius(value)
    }

    /**
     * The color of the shadow. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.dropshadow.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Brush used to specify an opacity mask for the shadow. Defaults to the SpriteVisual's brush. Animatable.
     * @remarks
     * A non-rectangular shadow can be casted by setting the Mask of the Shadow property to a SurfaceBrush that represents the shape.
     * 
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.dropshadow.mask
     * @type {CompositionBrush} 
     */
    Mask {
        get => this.get_Mask()
        set => this.put_Mask(value)
    }

    /**
     * Offset of the shadow relative to its SpriteVisual. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.dropshadow.offset
     * @type {Vector3} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * The opacity of the shadow. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.dropshadow.opacity
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * Used to define the shadow masking policy to be used for the shadow.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.dropshadow.sourcepolicy
     * @type {Integer} 
     */
    SourcePolicy {
        get => this.get_SourcePolicy()
        set => this.put_SourcePolicy(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BlurRadius() {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.get_BlurRadius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BlurRadius(value) {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.put_BlurRadius(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.put_Color(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Mask() {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.get_Mask()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Mask(value) {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.put_Mask(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Offset() {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.get_Offset()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.get_Opacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Opacity(value) {
        if (!this.HasProp("__IDropShadow")) {
            if ((queryResult := this.QueryInterface(IDropShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow := IDropShadow(outPtr)
        }

        return this.__IDropShadow.put_Opacity(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourcePolicy() {
        if (!this.HasProp("__IDropShadow2")) {
            if ((queryResult := this.QueryInterface(IDropShadow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow2 := IDropShadow2(outPtr)
        }

        return this.__IDropShadow2.get_SourcePolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SourcePolicy(value) {
        if (!this.HasProp("__IDropShadow2")) {
            if ((queryResult := this.QueryInterface(IDropShadow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropShadow2 := IDropShadow2(outPtr)
        }

        return this.__IDropShadow2.put_SourcePolicy(value)
    }

;@endregion Instance Methods
}
