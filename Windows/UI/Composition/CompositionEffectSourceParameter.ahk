#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositionEffectSourceParameter.ahk
#Include .\ICompositionEffectSourceParameterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to declare an arbitrary name (a String) to be associated with a CompositionBrush (the “effect source”). The association of the given name and the effect source occurs when the [SetSourceParameter](compositioneffectbrush_setsourceparameter_49982457.md) method of a [CompositionEffectBrush](compositioneffectbrush.md) is called.
 * @remarks
 * See the remarks section of [CompositionEffectBrush](compositioneffectbrush.md) for information on creating and using effects.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectsourceparameter
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionEffectSourceParameter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionEffectSourceParameter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionEffectSourceParameter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [CompositionEffectSourceParameter](compositioneffectsourceparameter.md).
     * @param {HSTRING} name The name for the [CompositionEffectSourceParameter](compositioneffectsourceparameter.md) instance.
     * @returns {CompositionEffectSourceParameter} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectsourceparameter.#ctor
     */
    static Create(name) {
        if (!CompositionEffectSourceParameter.HasProp("__ICompositionEffectSourceParameterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionEffectSourceParameter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionEffectSourceParameterFactory.IID)
            CompositionEffectSourceParameter.__ICompositionEffectSourceParameterFactory := ICompositionEffectSourceParameterFactory(factoryPtr)
        }

        return CompositionEffectSourceParameter.__ICompositionEffectSourceParameterFactory.Create(name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The name associated with the effect source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectsourceparameter.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ICompositionEffectSourceParameter")) {
            if ((queryResult := this.QueryInterface(ICompositionEffectSourceParameter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEffectSourceParameter := ICompositionEffectSourceParameter(outPtr)
        }

        return this.__ICompositionEffectSourceParameter.get_Name()
    }

;@endregion Instance Methods
}
