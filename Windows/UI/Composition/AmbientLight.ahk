#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionLight.ahk
#Include .\IAmbientLight.ahk
#Include .\IAmbientLight2.ahk
#Include ..\..\..\Guid.ahk

/**
 * A light that illuminates every targeted Visual equally .
 * @remarks
 * AmbientLight is one of the four light types derived from [CompositionLight](compositionlight.md).
 * 
 * | Light | Description |
 * |---|---|
 * | AmbientLight | A light source that emits non directional light that appears to have been reflected by everything in the scene. |
 * | [DistantLight](distantlight.md) | An infinitely large distant light source that emits light in a single direction. |
 * | [PointLight](pointlight.md) | A point source of light that emits light in all directions. |
 * | [SpotLight](spotlight.md) | A light source that emits inner and outer cones of light. |
 * 
 * > [!NOTE]
 * > A Visual cannot be targeted by more than two non-ambient lights (PointLight, SpotLight or DistantLight).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ambientlight
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AmbientLight extends CompositionLight {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAmbientLight

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAmbientLight.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Color of the light. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ambientlight.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the intensity of the light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ambientlight.intensity
     * @type {Float} 
     */
    Intensity {
        get => this.get_Intensity()
        set => this.put_Intensity(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__IAmbientLight")) {
            if ((queryResult := this.QueryInterface(IAmbientLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAmbientLight := IAmbientLight(outPtr)
        }

        return this.__IAmbientLight.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IAmbientLight")) {
            if ((queryResult := this.QueryInterface(IAmbientLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAmbientLight := IAmbientLight(outPtr)
        }

        return this.__IAmbientLight.put_Color(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Intensity() {
        if (!this.HasProp("__IAmbientLight2")) {
            if ((queryResult := this.QueryInterface(IAmbientLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAmbientLight2 := IAmbientLight2(outPtr)
        }

        return this.__IAmbientLight2.get_Intensity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Intensity(value) {
        if (!this.HasProp("__IAmbientLight2")) {
            if ((queryResult := this.QueryInterface(IAmbientLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAmbientLight2 := IAmbientLight2(outPtr)
        }

        return this.__IAmbientLight2.put_Intensity(value)
    }

;@endregion Instance Methods
}
