#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconElement.ahk
#Include .\ISymbolIcon.ahk
#Include .\ISymbolIconFactory.ahk
#Include .\ISymbolIconStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon that uses a glyph from the Segoe MDL2 Assets font as its content.
 * @remarks
 * The most common way to specify the icon for an app bar button is to use one of the standard glyphs provided by the Segoe MDL2 Assets font, as specified in the [Symbol](symbol.md) enumeration. You can use a SymbolIcon by setting the [Icon](appbarbutton_icon.md) property of an [AppBarButton](appbarbutton.md) directly to a value of the [Symbol](symbol.md) enumeration.
 * 
 * > [!NOTE]
 * > You can set the **Foreground** property on the [AppBarButton](appbarbutton.md) or on the SymbolIcon. If you set the [Foreground](control_foreground.md) on the [AppBarButton](appbarbutton.md), it's applied only to the default visual state. It's not applied to the other visual states defined in the [AppBarButton](appbarbutton.md) template, like `MouseOver`. If you set the [Foreground](iconelement_foreground.md) on the SymbolIcon, the color is applied to all visual states.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symbolicon
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SymbolIcon extends IconElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISymbolIcon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISymbolIcon.IID

    /**
     * Identifies the [Symbol](symbolicon_symbol.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symbolicon.symbolproperty
     * @type {DependencyProperty} 
     */
    static SymbolProperty {
        get => SymbolIcon.get_SymbolProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [SymbolIcon](symbolicon.md) class using the specified symbol.
     * @param {Integer} symbol_ A named constant of the enumeration that specifies the Segoe MDL2 Assets glyph to use. The default is **null**.
     * @returns {SymbolIcon} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symbolicon.#ctor
     */
    static CreateInstanceWithSymbol(symbol_) {
        if (!SymbolIcon.HasProp("__ISymbolIconFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SymbolIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymbolIconFactory.IID)
            SymbolIcon.__ISymbolIconFactory := ISymbolIconFactory(factoryPtr)
        }

        return SymbolIcon.__ISymbolIconFactory.CreateInstanceWithSymbol(symbol_)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SymbolProperty() {
        if (!SymbolIcon.HasProp("__ISymbolIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SymbolIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymbolIconStatics.IID)
            SymbolIcon.__ISymbolIconStatics := ISymbolIconStatics(factoryPtr)
        }

        return SymbolIcon.__ISymbolIconStatics.get_SymbolProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Segoe MDL2 Assets glyph used as the icon content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symbolicon.symbol
     * @type {Integer} 
     */
    Symbol {
        get => this.get_Symbol()
        set => this.put_Symbol(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SymbolIcon](symbolicon.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SymbolIcon")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Symbol() {
        if (!this.HasProp("__ISymbolIcon")) {
            if ((queryResult := this.QueryInterface(ISymbolIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISymbolIcon := ISymbolIcon(outPtr)
        }

        return this.__ISymbolIcon.get_Symbol()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Symbol(value) {
        if (!this.HasProp("__ISymbolIcon")) {
            if ((queryResult := this.QueryInterface(ISymbolIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISymbolIcon := ISymbolIcon(outPtr)
        }

        return this.__ISymbolIcon.put_Symbol(value)
    }

;@endregion Instance Methods
}
