#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionBrush.ahk
#Include .\ICompositionBackdropBrush.ahk
#Include ..\..\..\Guid.ahk

/**
 * A brush that applies an effect (or a chain of effects) to the region behind a [SpriteVisual](spritevisual.md).
 * @remarks
 * See the remarks section of [CompositionEffectBrush](compositioneffectbrush.md) for information on creating and using effects.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionbackdropbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionBackdropBrush extends CompositionBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionBackdropBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionBackdropBrush.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
