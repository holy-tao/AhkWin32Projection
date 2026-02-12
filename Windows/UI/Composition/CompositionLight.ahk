#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionLight.ahk
#Include .\ICompositionLight2.ahk
#Include .\ICompositionLight3.ahk
#Include .\ICompositionLightFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Base class for a light source that can target a UI scene.
  * 
  * The [CompositionLight.Targets](compositionlight_targets.md) property determines which Visuals are lit.
 * @remarks
 * CompositionLight is the base class for four light types.
 * 
 * | Light | Description |
 * |---|---|
 * | [AmbientLight](ambientlight.md) | A light source that emits non directional light that appears to have been reflected by everything in the scene. |
 * | [DistantLight](distantlight.md) | An infinitely large distant light source that emits light in a single direction. |
 * | [PointLight](pointlight.md) | A point source of light that emits light in all directions. |
 * | [SpotLight](spotlight.md) | A light source that emits inner and outer cones of light. |
 * 
 * > [!NOTE]
 * > A Visual cannot be targeted by more than two non-ambient lights (PointLight, SpotLight or DistantLight).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlight
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionLight extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionLight

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionLight.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The collection of Visuals targeted by the light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlight.targets
     * @type {VisualUnorderedCollection} 
     */
    Targets {
        get => this.get_Targets()
    }

    /**
     * Gets a collection of Visuals that are not targeted by the light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlight.exclusionsfromtargets
     * @type {VisualUnorderedCollection} 
     */
    ExclusionsFromTargets {
        get => this.get_ExclusionsFromTargets()
    }

    /**
     * Gets or sets a value that determines whether the composition light is on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlight.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VisualUnorderedCollection} 
     */
    get_Targets() {
        if (!this.HasProp("__ICompositionLight")) {
            if ((queryResult := this.QueryInterface(ICompositionLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLight := ICompositionLight(outPtr)
        }

        return this.__ICompositionLight.get_Targets()
    }

    /**
     * 
     * @returns {VisualUnorderedCollection} 
     */
    get_ExclusionsFromTargets() {
        if (!this.HasProp("__ICompositionLight2")) {
            if ((queryResult := this.QueryInterface(ICompositionLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLight2 := ICompositionLight2(outPtr)
        }

        return this.__ICompositionLight2.get_ExclusionsFromTargets()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__ICompositionLight3")) {
            if ((queryResult := this.QueryInterface(ICompositionLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLight3 := ICompositionLight3(outPtr)
        }

        return this.__ICompositionLight3.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__ICompositionLight3")) {
            if ((queryResult := this.QueryInterface(ICompositionLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLight3 := ICompositionLight3(outPtr)
        }

        return this.__ICompositionLight3.put_IsEnabled(value)
    }

;@endregion Instance Methods
}
