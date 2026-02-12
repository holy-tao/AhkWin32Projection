#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\ToggleButton.ahk
#Include .\IInkToolbarMenuButton.ahk
#Include .\IInkToolbarMenuButtonFactory.ahk
#Include .\IInkToolbarMenuButtonStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button that invokes a menu of tools, defined by the host app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarmenubutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarMenuButton extends ToggleButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarMenuButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarMenuButton.IID

    /**
     * Identifies the [IsExtensionGlyphShown](inktoolbarmenubutton_isextensionglyphshown.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarmenubutton.isextensionglyphshownproperty
     * @type {DependencyProperty} 
     */
    static IsExtensionGlyphShownProperty {
        get => InkToolbarMenuButton.get_IsExtensionGlyphShownProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsExtensionGlyphShownProperty() {
        if (!InkToolbarMenuButton.HasProp("__IInkToolbarMenuButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarMenuButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarMenuButtonStatics.IID)
            InkToolbarMenuButton.__IInkToolbarMenuButtonStatics := IInkToolbarMenuButtonStatics(factoryPtr)
        }

        return InkToolbarMenuButton.__IInkToolbarMenuButtonStatics.get_IsExtensionGlyphShownProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the type of menu button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarmenubutton.menukind
     * @type {Integer} 
     */
    MenuKind {
        get => this.get_MenuKind()
    }

    /**
     * Gets or sets whether an extension glyph is shown on the menu button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarmenubutton.isextensionglyphshown
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
    get_MenuKind() {
        if (!this.HasProp("__IInkToolbarMenuButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarMenuButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarMenuButton := IInkToolbarMenuButton(outPtr)
        }

        return this.__IInkToolbarMenuButton.get_MenuKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExtensionGlyphShown() {
        if (!this.HasProp("__IInkToolbarMenuButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarMenuButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarMenuButton := IInkToolbarMenuButton(outPtr)
        }

        return this.__IInkToolbarMenuButton.get_IsExtensionGlyphShown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExtensionGlyphShown(value) {
        if (!this.HasProp("__IInkToolbarMenuButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarMenuButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarMenuButton := IInkToolbarMenuButton(outPtr)
        }

        return this.__IInkToolbarMenuButton.put_IsExtensionGlyphShown(value)
    }

;@endregion Instance Methods
}
