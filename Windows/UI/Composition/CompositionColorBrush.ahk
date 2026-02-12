#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionBrush.ahk
#Include .\ICompositionColorBrush.ahk
#Include ..\..\..\Guid.ahk

/**
 * Paints a [SpriteVisual](spritevisual.md) with a solid color.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncolorbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionColorBrush extends CompositionBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionColorBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionColorBrush.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The color used to fill a [SpriteVisual](spritevisual.md). Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncolorbrush.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
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
        if (!this.HasProp("__ICompositionColorBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionColorBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionColorBrush := ICompositionColorBrush(outPtr)
        }

        return this.__ICompositionColorBrush.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ICompositionColorBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionColorBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionColorBrush := ICompositionColorBrush(outPtr)
        }

        return this.__ICompositionColorBrush.put_Color(value)
    }

;@endregion Instance Methods
}
