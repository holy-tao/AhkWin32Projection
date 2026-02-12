#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\ISwipeControl.ahk
#Include .\ISwipeControlFactory.ahk
#Include .\ISwipeControlStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a container that provides access to contextual commands through touch interactions.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwipeControl extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwipeControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwipeControl.IID

    /**
     * Identifies the LeftItems dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.LeftItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.leftitemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.leftitemsproperty
     * @type {DependencyProperty} 
     */
    static LeftItemsProperty {
        get => SwipeControl.get_LeftItemsProperty()
    }

    /**
     * Identifies the RightItems dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.RightItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.rightitemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.rightitemsproperty
     * @type {DependencyProperty} 
     */
    static RightItemsProperty {
        get => SwipeControl.get_RightItemsProperty()
    }

    /**
     * Identifies the TopItems dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.TopItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.topitemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.topitemsproperty
     * @type {DependencyProperty} 
     */
    static TopItemsProperty {
        get => SwipeControl.get_TopItemsProperty()
    }

    /**
     * Identifies the BottomItems dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.BottomItemsProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.bottomitemsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.bottomitemsproperty
     * @type {DependencyProperty} 
     */
    static BottomItemsProperty {
        get => SwipeControl.get_BottomItemsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SwipeControl} 
     */
    static CreateInstance() {
        if (!SwipeControl.HasProp("__ISwipeControlFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeControlFactory.IID)
            SwipeControl.__ISwipeControlFactory := ISwipeControlFactory(factoryPtr)
        }

        return SwipeControl.__ISwipeControlFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LeftItemsProperty() {
        if (!SwipeControl.HasProp("__ISwipeControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeControlStatics.IID)
            SwipeControl.__ISwipeControlStatics := ISwipeControlStatics(factoryPtr)
        }

        return SwipeControl.__ISwipeControlStatics.get_LeftItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RightItemsProperty() {
        if (!SwipeControl.HasProp("__ISwipeControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeControlStatics.IID)
            SwipeControl.__ISwipeControlStatics := ISwipeControlStatics(factoryPtr)
        }

        return SwipeControl.__ISwipeControlStatics.get_RightItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TopItemsProperty() {
        if (!SwipeControl.HasProp("__ISwipeControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeControlStatics.IID)
            SwipeControl.__ISwipeControlStatics := ISwipeControlStatics(factoryPtr)
        }

        return SwipeControl.__ISwipeControlStatics.get_TopItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BottomItemsProperty() {
        if (!SwipeControl.HasProp("__ISwipeControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeControlStatics.IID)
            SwipeControl.__ISwipeControlStatics := ISwipeControlStatics(factoryPtr)
        }

        return SwipeControl.__ISwipeControlStatics.get_BottomItemsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the items that can be invoked when the control is swiped from the left side.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.LeftItems](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.leftitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.leftitems
     * @type {SwipeItems} 
     */
    LeftItems {
        get => this.get_LeftItems()
        set => this.put_LeftItems(value)
    }

    /**
     * Gets or sets the items that can be invoked when the control is swiped from the right side.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.RightItems](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.rightitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.rightitems
     * @type {SwipeItems} 
     */
    RightItems {
        get => this.get_RightItems()
        set => this.put_RightItems(value)
    }

    /**
     * Gets or sets the items that can be invoked when the control is swiped from the top down.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.TopItems](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.topitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.topitems
     * @type {SwipeItems} 
     */
    TopItems {
        get => this.get_TopItems()
        set => this.put_TopItems(value)
    }

    /**
     * Gets or sets the items that can be invoked when the control is swiped from the bottom up.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.BottomItems](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.bottomitems) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.bottomitems
     * @type {SwipeItems} 
     */
    BottomItems {
        get => this.get_BottomItems()
        set => this.put_BottomItems(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_LeftItems() {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.get_LeftItems()
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_LeftItems(value) {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.put_LeftItems(value)
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_RightItems() {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.get_RightItems()
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_RightItems(value) {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.put_RightItems(value)
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_TopItems() {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.get_TopItems()
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_TopItems(value) {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.put_TopItems(value)
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_BottomItems() {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.get_BottomItems()
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_BottomItems(value) {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.put_BottomItems(value)
    }

    /**
     * Closes the swipe control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeControl.Close](/windows/winui/api/microsoft.ui.xaml.controls.swipecontrol.close) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipecontrol.close
     */
    Close() {
        if (!this.HasProp("__ISwipeControl")) {
            if ((queryResult := this.QueryInterface(ISwipeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeControl := ISwipeControl(outPtr)
        }

        return this.__ISwipeControl.Close()
    }

;@endregion Instance Methods
}
