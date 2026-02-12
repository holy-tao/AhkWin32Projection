#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionProjectedShadow.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a scene-based shadow calculated using the relationship between the light, the visual that casts the shadow,and the visual that receives the shadow, such that the shadow is drawn differently on each receiver.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadow
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionProjectedShadow extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionProjectedShadow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionProjectedShadow.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the multiplier for the shadow's blur radius.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadow.blurradiusmultiplier
     * @type {Float} 
     */
    BlurRadiusMultiplier {
        get => this.get_BlurRadiusMultiplier()
        set => this.put_BlurRadiusMultiplier(value)
    }

    /**
     * Gets the collection of objects that cast a shadow on the receivers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadow.casters
     * @type {CompositionProjectedShadowCasterCollection} 
     */
    Casters {
        get => this.get_Casters()
    }

    /**
     * Gets or sets the composition light that determines the direction the shadow is cast.
     * @remarks
     * The LightSource must be a [DistantLight](distantlight.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadow.lightsource
     * @type {CompositionLight} 
     */
    LightSource {
        get => this.get_LightSource()
        set => this.put_LightSource(value)
    }

    /**
     * Gets or sets the maximum blur radius of the shadow.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadow.maxblurradius
     * @type {Float} 
     */
    MaxBlurRadius {
        get => this.get_MaxBlurRadius()
        set => this.put_MaxBlurRadius(value)
    }

    /**
     * Gets or sets the minimum blur radius of the shadow.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadow.minblurradius
     * @type {Float} 
     */
    MinBlurRadius {
        get => this.get_MinBlurRadius()
        set => this.put_MinBlurRadius(value)
    }

    /**
     * Gets the collection of objects that the shadow is cast on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionprojectedshadow.receivers
     * @type {CompositionProjectedShadowReceiverUnorderedCollection} 
     */
    Receivers {
        get => this.get_Receivers()
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
    get_BlurRadiusMultiplier() {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.get_BlurRadiusMultiplier()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BlurRadiusMultiplier(value) {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.put_BlurRadiusMultiplier(value)
    }

    /**
     * 
     * @returns {CompositionProjectedShadowCasterCollection} 
     */
    get_Casters() {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.get_Casters()
    }

    /**
     * 
     * @returns {CompositionLight} 
     */
    get_LightSource() {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.get_LightSource()
    }

    /**
     * 
     * @param {CompositionLight} value 
     * @returns {HRESULT} 
     */
    put_LightSource(value) {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.put_LightSource(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxBlurRadius() {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.get_MaxBlurRadius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxBlurRadius(value) {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.put_MaxBlurRadius(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinBlurRadius() {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.get_MinBlurRadius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinBlurRadius(value) {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.put_MinBlurRadius(value)
    }

    /**
     * 
     * @returns {CompositionProjectedShadowReceiverUnorderedCollection} 
     */
    get_Receivers() {
        if (!this.HasProp("__ICompositionProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositionProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionProjectedShadow := ICompositionProjectedShadow(outPtr)
        }

        return this.__ICompositionProjectedShadow.get_Receivers()
    }

;@endregion Instance Methods
}
