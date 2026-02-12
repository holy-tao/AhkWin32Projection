#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconSource.ahk
#Include .\ISymbolIconSource.ahk
#Include .\ISymbolIconSourceStatics.ahk
#Include .\ISymbolIconSourceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon source that uses a glyph from the Segoe MDL2 Assets font as its content.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SymbolIconSource](/windows/winui/api/microsoft.ui.xaml.controls.symboliconsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * **SymbolIconSource** is similar to [SymbolIcon](symbolicon.md). However, because it is not a [FrameworkElement](../windows.ui.xaml/frameworkelement.md), it can be shared.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symboliconsource
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SymbolIconSource extends IconSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISymbolIconSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISymbolIconSource.IID

    /**
     * Identifies the Symbol dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SymbolIconSource.SymbolProperty](/windows/winui/api/microsoft.ui.xaml.controls.symboliconsource.symbolproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symboliconsource.symbolproperty
     * @type {DependencyProperty} 
     */
    static SymbolProperty {
        get => SymbolIconSource.get_SymbolProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SymbolProperty() {
        if (!SymbolIconSource.HasProp("__ISymbolIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SymbolIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymbolIconSourceStatics.IID)
            SymbolIconSource.__ISymbolIconSourceStatics := ISymbolIconSourceStatics(factoryPtr)
        }

        return SymbolIconSource.__ISymbolIconSourceStatics.get_SymbolProperty()
    }

    /**
     * 
     * @returns {SymbolIconSource} 
     */
    static CreateInstance() {
        if (!SymbolIconSource.HasProp("__ISymbolIconSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SymbolIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymbolIconSourceFactory.IID)
            SymbolIconSource.__ISymbolIconSourceFactory := ISymbolIconSourceFactory(factoryPtr)
        }

        return SymbolIconSource.__ISymbolIconSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Segoe MDL2 Assets glyph used as the icon content.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SymbolIconSource.Symbol](/windows/winui/api/microsoft.ui.xaml.controls.symboliconsource.symbol) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.symboliconsource.symbol
     * @type {Integer} 
     */
    Symbol {
        get => this.get_Symbol()
        set => this.put_Symbol(value)
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
    get_Symbol() {
        if (!this.HasProp("__ISymbolIconSource")) {
            if ((queryResult := this.QueryInterface(ISymbolIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISymbolIconSource := ISymbolIconSource(outPtr)
        }

        return this.__ISymbolIconSource.get_Symbol()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Symbol(value) {
        if (!this.HasProp("__ISymbolIconSource")) {
            if ((queryResult := this.QueryInterface(ISymbolIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISymbolIconSource := ISymbolIconSource(outPtr)
        }

        return this.__ISymbolIconSource.put_Symbol(value)
    }

;@endregion Instance Methods
}
