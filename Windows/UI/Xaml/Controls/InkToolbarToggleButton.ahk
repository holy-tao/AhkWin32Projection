#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CheckBox.ahk
#Include .\IInkToolbarToggleButton.ahk
#Include .\IInkToolbarToggleButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an object that provides infrastructure for both built-in and custom toggle buttons on an [InkToolbar](inktoolbar.md).
 * @remarks
 * The InkToolbarToggleButton class cannot be instantiated directly. For user interface purposes, treat InkToolbarToggleButton as an abstract base class. Use the various built-in and custom [InkToolbar](inktoolbar.md) buttons instead.
 * 
 * By default, the [InkToolbar](inktoolbar.md) contains the following built-in buttons:
 * Radio group toggle buttons
 * 
 * + [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md)
 * + [InkToolbarPencilButton](inktoolbarpencilbutton.md)
 * + [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)
 * + [InkToolbarEraserButton](inktoolbareraserbutton.md)
 * 
 * Standalone toggle button
 * 
 * + [InkToolbarRulerButton](inktoolbarrulerbutton.md)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartogglebutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarToggleButton extends CheckBox {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarToggleButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarToggleButton.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of built-in or custom tool associated with the [InkToolbarToggleButton](inktoolbartogglebutton.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartogglebutton.togglekind
     * @type {Integer} 
     */
    ToggleKind {
        get => this.get_ToggleKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleKind() {
        if (!this.HasProp("__IInkToolbarToggleButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarToggleButton := IInkToolbarToggleButton(outPtr)
        }

        return this.__IInkToolbarToggleButton.get_ToggleKind()
    }

;@endregion Instance Methods
}
