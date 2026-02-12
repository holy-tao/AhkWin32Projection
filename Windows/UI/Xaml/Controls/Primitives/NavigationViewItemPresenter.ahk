#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContentControl.ahk
#Include .\INavigationViewItemPresenter.ahk
#Include .\INavigationViewItemPresenterFactory.ahk
#Include .\INavigationViewItemPresenterStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the visual elements of a NavigationViewItem.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.NavigationViewItemPresenter](/windows/winui/api/microsoft.ui.xaml.controls.primitives.navigationviewitempresenter) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.navigationviewitempresenter
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class NavigationViewItemPresenter extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewItemPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewItemPresenter.IID

    /**
     * Identifies the [Icon](navigationviewitempresenter_icon.md) dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.NavigationViewItemPresenter.IconProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.navigationviewitempresenter.iconproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.navigationviewitempresenter.iconproperty
     * @type {DependencyProperty} 
     */
    static IconProperty {
        get => NavigationViewItemPresenter.get_IconProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {NavigationViewItemPresenter} 
     */
    static CreateInstance() {
        if (!NavigationViewItemPresenter.HasProp("__INavigationViewItemPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.NavigationViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemPresenterFactory.IID)
            NavigationViewItemPresenter.__INavigationViewItemPresenterFactory := INavigationViewItemPresenterFactory(factoryPtr)
        }

        return NavigationViewItemPresenter.__INavigationViewItemPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconProperty() {
        if (!NavigationViewItemPresenter.HasProp("__INavigationViewItemPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.NavigationViewItemPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemPresenterStatics.IID)
            NavigationViewItemPresenter.__INavigationViewItemPresenterStatics := INavigationViewItemPresenterStatics(factoryPtr)
        }

        return NavigationViewItemPresenter.__INavigationViewItemPresenterStatics.get_IconProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the icon in a NavigationView item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.NavigationViewItemPresenter.Icon](/windows/winui/api/microsoft.ui.xaml.controls.primitives.navigationviewitempresenter.icon) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.navigationviewitempresenter.icon
     * @type {IconElement} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_Icon() {
        if (!this.HasProp("__INavigationViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(INavigationViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItemPresenter := INavigationViewItemPresenter(outPtr)
        }

        return this.__INavigationViewItemPresenter.get_Icon()
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__INavigationViewItemPresenter")) {
            if ((queryResult := this.QueryInterface(INavigationViewItemPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationViewItemPresenter := INavigationViewItemPresenter(outPtr)
        }

        return this.__INavigationViewItemPresenter.put_Icon(value)
    }

;@endregion Instance Methods
}
