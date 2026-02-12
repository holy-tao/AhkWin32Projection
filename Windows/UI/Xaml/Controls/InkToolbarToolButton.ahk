#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RadioButton.ahk
#Include .\IInkToolbarToolButton.ahk
#Include .\IInkToolbarToolButtonFactory.ahk
#Include .\IInkToolbarToolButtonStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for all built-in and custom buttons on an [InkToolbar](inktoolbar.md).
 * @remarks
 * The InkToolbarToolButton class cannot be instantiated directly. Use the various built-in and custom [InkToolbar](inktoolbar.md) pen buttons instead.
 * 
 * By default, the [InkToolbar](inktoolbar.md) contains the following built-in buttons:
 * 
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartoolbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarToolButton extends RadioButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarToolButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarToolButton.IID

    /**
     * Identifies the [IsExtensionGlyphShown](inktoolbartoolbutton_isextensionglyphshown.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartoolbutton.isextensionglyphshownproperty
     * @type {DependencyProperty} 
     */
    static IsExtensionGlyphShownProperty {
        get => InkToolbarToolButton.get_IsExtensionGlyphShownProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsExtensionGlyphShownProperty() {
        if (!InkToolbarToolButton.HasProp("__IInkToolbarToolButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarToolButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarToolButtonStatics.IID)
            InkToolbarToolButton.__IInkToolbarToolButtonStatics := IInkToolbarToolButtonStatics(factoryPtr)
        }

        return InkToolbarToolButton.__IInkToolbarToolButtonStatics.get_IsExtensionGlyphShownProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type of built-in or custom tool associated with the [InkToolbarToolButton](inktoolbartoolbutton.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartoolbutton.toolkind
     * @type {Integer} 
     */
    ToolKind {
        get => this.get_ToolKind()
    }

    /**
     * Gets or sets whether a glyph is shown on the [InkToolbarToolButton](inktoolbartoolbutton.md) to indicate the presence of an ink stroke configuration flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbartoolbutton.isextensionglyphshown
     * @type {Boolean} 
     */
    IsExtensionGlyphShown {
        get => this.get_IsExtensionGlyphShown()
        set => this.put_IsExtensionGlyphShown(value)
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
    get_ToolKind() {
        if (!this.HasProp("__IInkToolbarToolButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarToolButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarToolButton := IInkToolbarToolButton(outPtr)
        }

        return this.__IInkToolbarToolButton.get_ToolKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExtensionGlyphShown() {
        if (!this.HasProp("__IInkToolbarToolButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarToolButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarToolButton := IInkToolbarToolButton(outPtr)
        }

        return this.__IInkToolbarToolButton.get_IsExtensionGlyphShown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExtensionGlyphShown(value) {
        if (!this.HasProp("__IInkToolbarToolButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarToolButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarToolButton := IInkToolbarToolButton(outPtr)
        }

        return this.__IInkToolbarToolButton.put_IsExtensionGlyphShown(value)
    }

;@endregion Instance Methods
}
