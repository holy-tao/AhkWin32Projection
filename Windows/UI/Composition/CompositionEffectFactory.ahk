#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionEffectFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates a composition object that contains a [Win2D](https://microsoft.github.io/Win2D/WinUI2/html/Introduction.htm) effect description format in the [Microsoft.Graphics.Canvas.Effects](https://microsoft.github.io/Win2D/WinUI2/html/N_Microsoft_Graphics_Canvas_Effects.htm) namespace.
  * 
  * > [!NOTE]
  * > Effects that are not supported are marked as [NoComposition] in the [Win2D API Reference](https://microsoft.github.io/Win2D/WinUI2/html/APIReference.htm) for effects namespace.
 * @remarks
 * A composition effect is a graph of operations that define how to produce graphical content based on composition surfaces; for example, the pixel content of images. Effects are applied to visuals in the tree and can reference existing surfaces.
 * 
 * See the remarks section of [CompositionEffectBrush](compositioneffectbrush.md) for information on creating and using effects.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectfactory
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionEffectFactory extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionEffectFactory

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionEffectFactory.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * An extended error code for the result of a call to [CreateBrush](compositioneffectfactory_createbrush_639615316.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectfactory.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * The load status of a [CreateBrush](compositioneffectfactory_createbrush_639615316.md) call.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectfactory.loadstatus
     * @type {Integer} 
     */
    LoadStatus {
        get => this.get_LoadStatus()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates an instance of [CompositionEffectBrush](compositioneffectbrush.md) with the effect definition and animatable properties contained in the [CompositionEffectFactory](compositioneffectfactory.md) object.
     * @returns {CompositionEffectBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneffectfactory.createbrush
     */
    CreateBrush() {
        if (!this.HasProp("__ICompositionEffectFactory")) {
            if ((queryResult := this.QueryInterface(ICompositionEffectFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEffectFactory := ICompositionEffectFactory(outPtr)
        }

        return this.__ICompositionEffectFactory.CreateBrush()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICompositionEffectFactory")) {
            if ((queryResult := this.QueryInterface(ICompositionEffectFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEffectFactory := ICompositionEffectFactory(outPtr)
        }

        return this.__ICompositionEffectFactory.get_ExtendedError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LoadStatus() {
        if (!this.HasProp("__ICompositionEffectFactory")) {
            if ((queryResult := this.QueryInterface(ICompositionEffectFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEffectFactory := ICompositionEffectFactory(outPtr)
        }

        return this.__ICompositionEffectFactory.get_LoadStatus()
    }

;@endregion Instance Methods
}
