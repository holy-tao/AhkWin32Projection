#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionBrush.ahk
#Include .\ICompositionEffectBrush.ahk
#Include ..\..\..\Guid.ahk

/**
 * Paints a SpriteVisual with the output of a filter effect. The filter effect description is defined using the  [CompositionEffectFactory](compositioneffectfactory.md) class.
 * @remarks
 * The effect APIs enable developers to customize how their UI is rendered. This can be something as simple as adjusting saturation levels on an image or something more complex like chaining numerous effects together and animating the effect properties to create interesting application transitions and user experiences. A composition effect is a graph of operations that define how to produce graphical content based on composition surfaces. For example, the pixel content of images. Effects are applied to visuals in the tree and can reference existing surfaces.
 * 
 * An instance of CompositionEffectBrush is created using a [CompositionEffectFactory](compositioneffectfactory.md) based on a specified effect description. [CompositionEffectFactory](compositioneffectfactory.md) uses the [Win2D](https://microsoft.github.io/Win2D/WinUI2/html/Introduction.htm) effect description format in the [Microsoft.Graphics.Canvas.Effects](https://microsoft.github.io/Win2D/WinUI2/html/N_Microsoft_Graphics_Canvas_Effects.htm) namespace. 
 * 
 * > [!NOTE]
 * > Effects that are not supported are marked as **[NoComposition]** in the [Win2D API Reference](https://microsoft.github.io/Win2D/WinUI2/html/APIReference.htm) for effects namespace.
 * 
 * A CompositionEffectBrush is applied to a [SpriteVisual](spritevisual.md) in the composition tree.
 * 
 * Sources to CompositionEffectBrush can be an existing surface or texture, or another effect enabling effect chaining.
 * 
 * CompositionEffectBrush.Properties (inherited from CompositionObject.Properties) allows setting or animating the animatable properties that were specified in the call to Compositor.[CreateEffectFactory](compositor_createeffectfactory_720924202.md) using their full 'EffectName.PropertyName' name.
 * 
 * Effect sources can be set independently from other CompositionEffectBrush instances, and properties can be animated independently from other CompositionEffectBrush instances.
 * 
 * Once an effect graph is declared, the system compiles the effect using built-in shaders. Custom shaders cannot be specified.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionEffectBrush extends CompositionBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionEffectBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionEffectBrush.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves a CompositionBrush associated with a given [CompositionEffectSourceParameter](compositioneffectsourceparameter.md) name.
     * @param {HSTRING} name The name of the input.
     * @returns {CompositionBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectbrush.getsourceparameter
     */
    GetSourceParameter(name) {
        if (!this.HasProp("__ICompositionEffectBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionEffectBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEffectBrush := ICompositionEffectBrush(outPtr)
        }

        return this.__ICompositionEffectBrush.GetSourceParameter(name)
    }

    /**
     * Associates a name declared using [CompositionEffectSourceParameter](compositioneffectsourceparameter.md) to an effect source.
     * @param {HSTRING} name The name of the source parameter.
     * @param {CompositionBrush} source The source to pass to the effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectbrush.setsourceparameter
     */
    SetSourceParameter(name, source) {
        if (!this.HasProp("__ICompositionEffectBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionEffectBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEffectBrush := ICompositionEffectBrush(outPtr)
        }

        return this.__ICompositionEffectBrush.SetSourceParameter(name, source)
    }

;@endregion Instance Methods
}
