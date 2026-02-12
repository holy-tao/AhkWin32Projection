#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IMenuBar.ahk
#Include .\IMenuBarFactory.ahk
#Include .\IMenuBarStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a specialized container that presents a set of menus in a horizontal row, typically at the top of an app window.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.MenuBar](/windows/winui/api/microsoft.ui.xaml.controls.menubar) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menubar
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WinRTMenuBar extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuBar.IID

    /**
     * @type {DependencyProperty} 
     */
    static ItemsProperty {
        get => WinRTMenuBar.get_ItemsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {WinRTMenuBar} 
     */
    static CreateInstance() {
        if (!WinRTMenuBar.HasProp("__IMenuBarFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WinRTMenuBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarFactory.IID)
            WinRTMenuBar.__IMenuBarFactory := IMenuBarFactory(factoryPtr)
        }

        return WinRTMenuBar.__IMenuBarFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsProperty() {
        if (!WinRTMenuBar.HasProp("__IMenuBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.WinRTMenuBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarStatics.IID)
            WinRTMenuBar.__IMenuBarStatics := IMenuBarStatics(factoryPtr)
        }

        return WinRTMenuBar.__IMenuBarStatics.get_ItemsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {IVector<MenuBarItem>} 
     */
    Items {
        get => this.get_Items()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<MenuBarItem>} 
     */
    get_Items() {
        if (!this.HasProp("__IMenuBar")) {
            if ((queryResult := this.QueryInterface(IMenuBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuBar := IMenuBar(outPtr)
        }

        return this.__IMenuBar.get_Items()
    }

;@endregion Instance Methods
}
