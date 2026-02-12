#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionBrush.ahk
#Include .\ICompositionBrushFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Base class for brushes used to paint a [SpriteVisual](spritevisual.md).
 * @remarks
 * In your app, you'll typically use one of these subclasses of CompositionBrush:
 * 
 * + [CompositionBackdropBrush](compositionbackdropbrush.md)
 * + [CompositionColorBrush](compositioncolorbrush.md)
 * + [CompositionEffectBrush](compositioneffectbrush.md)
 * + [CompositionSurfaceBrush](compositionsurfacebrush.md)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionBrush extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionBrush.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
