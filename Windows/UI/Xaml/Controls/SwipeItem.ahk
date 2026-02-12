#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\ISwipeItem.ahk
#Include .\ISwipeItemFactory.ahk
#Include .\ISwipeItemStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SwipeItem.ahk
#Include .\SwipeItemInvokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents an individual command in a SwipeControl.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwipeItem extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwipeItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwipeItem.IID

    /**
     * Identifies the IconSource dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.IconSourceProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.iconsourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.iconsourceproperty
     * @type {DependencyProperty} 
     */
    static IconSourceProperty {
        get => SwipeItem.get_IconSourceProperty()
    }

    /**
     * Identifies the Text dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.TextProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.textproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => SwipeItem.get_TextProperty()
    }

    /**
     * Identifies the Background dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.BackgroundProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.backgroundproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.backgroundproperty
     * @type {DependencyProperty} 
     */
    static BackgroundProperty {
        get => SwipeItem.get_BackgroundProperty()
    }

    /**
     * Identifies the Foreground dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.ForegroundProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.foregroundproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => SwipeItem.get_ForegroundProperty()
    }

    /**
     * Identifies the Command dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.CommandProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.commandproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.commandproperty
     * @type {DependencyProperty} 
     */
    static CommandProperty {
        get => SwipeItem.get_CommandProperty()
    }

    /**
     * Identifies the CommandParameter dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.CommandParameterProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.commandparameterproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.commandparameterproperty
     * @type {DependencyProperty} 
     */
    static CommandParameterProperty {
        get => SwipeItem.get_CommandParameterProperty()
    }

    /**
     * Identifies the BehaviorOnInvoked dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.BehaviorOnInvokedProperty](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.behavioroninvokedproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.behavioroninvokedproperty
     * @type {DependencyProperty} 
     */
    static BehaviorOnInvokedProperty {
        get => SwipeItem.get_BehaviorOnInvokedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SwipeItem} 
     */
    static CreateInstance() {
        if (!SwipeItem.HasProp("__ISwipeItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemFactory.IID)
            SwipeItem.__ISwipeItemFactory := ISwipeItemFactory(factoryPtr)
        }

        return SwipeItem.__ISwipeItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconSourceProperty() {
        if (!SwipeItem.HasProp("__ISwipeItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemStatics.IID)
            SwipeItem.__ISwipeItemStatics := ISwipeItemStatics(factoryPtr)
        }

        return SwipeItem.__ISwipeItemStatics.get_IconSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!SwipeItem.HasProp("__ISwipeItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemStatics.IID)
            SwipeItem.__ISwipeItemStatics := ISwipeItemStatics(factoryPtr)
        }

        return SwipeItem.__ISwipeItemStatics.get_TextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundProperty() {
        if (!SwipeItem.HasProp("__ISwipeItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemStatics.IID)
            SwipeItem.__ISwipeItemStatics := ISwipeItemStatics(factoryPtr)
        }

        return SwipeItem.__ISwipeItemStatics.get_BackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!SwipeItem.HasProp("__ISwipeItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemStatics.IID)
            SwipeItem.__ISwipeItemStatics := ISwipeItemStatics(factoryPtr)
        }

        return SwipeItem.__ISwipeItemStatics.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandProperty() {
        if (!SwipeItem.HasProp("__ISwipeItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemStatics.IID)
            SwipeItem.__ISwipeItemStatics := ISwipeItemStatics(factoryPtr)
        }

        return SwipeItem.__ISwipeItemStatics.get_CommandProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandParameterProperty() {
        if (!SwipeItem.HasProp("__ISwipeItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemStatics.IID)
            SwipeItem.__ISwipeItemStatics := ISwipeItemStatics(factoryPtr)
        }

        return SwipeItem.__ISwipeItemStatics.get_CommandParameterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BehaviorOnInvokedProperty() {
        if (!SwipeItem.HasProp("__ISwipeItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SwipeItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeItemStatics.IID)
            SwipeItem.__ISwipeItemStatics := ISwipeItemStatics(factoryPtr)
        }

        return SwipeItem.__ISwipeItemStatics.get_BehaviorOnInvokedProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text description displayed on the item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.Text](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.text) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the graphic content of the item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.IconSource](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.iconsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.iconsource
     * @type {IconSource} 
     */
    IconSource {
        get => this.get_IconSource()
        set => this.put_IconSource(value)
    }

    /**
     * Gets or sets a brush that provides the background of the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.Background](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.background) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.background
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets or sets the brush that paints the text and icon of the item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.Foreground](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.foreground) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Gets or sets the command to execute when this item is invoked.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.Command](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.command) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.command
     * @type {ICommand} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

    /**
     * Gets or sets the parameter to pass to the Command property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.CommandParameter](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.commandparameter) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.commandparameter
     * @type {IInspectable} 
     */
    CommandParameter {
        get => this.get_CommandParameter()
        set => this.put_CommandParameter(value)
    }

    /**
     * Gets or sets a value that indicates how a [SwipeControl](swipecontrol.md) behaves after this item is invoked.
     *  
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.BehaviorOnInvoked](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.behavioroninvoked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeitem.behavioroninvoked
     * @type {Integer} 
     */
    BehaviorOnInvoked {
        get => this.get_BehaviorOnInvoked()
        set => this.put_BehaviorOnInvoked(value)
    }

    /**
     * Occurs when user interaction indicates that the command represented by this item should execute.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItem.Invoked](/windows/winui/api/microsoft.ui.xaml.controls.swipeitem.invoked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<SwipeItem, SwipeItemInvokedEventArgs>}
    */
    OnInvoked {
        get {
            if(!this.HasProp("__OnInvoked")){
                this.__OnInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3397b4eb-ce58-5d81-a25f-e8e63198b368}"),
                    SwipeItem,
                    SwipeItemInvokedEventArgs
                )
                this.__OnInvokedToken := this.add_Invoked(this.__OnInvoked.iface)
            }
            return this.__OnInvoked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInvokedToken")) {
            this.remove_Invoked(this.__OnInvokedToken)
            this.__OnInvoked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.put_Text(value)
    }

    /**
     * 
     * @returns {IconSource} 
     */
    get_IconSource() {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.get_IconSource()
    }

    /**
     * 
     * @param {IconSource} value 
     * @returns {HRESULT} 
     */
    put_IconSource(value) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.put_IconSource(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.get_Background()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.put_Background(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.put_Foreground(value)
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_Command() {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.get_Command()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.put_Command(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CommandParameter() {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.get_CommandParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_CommandParameter(value) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.put_CommandParameter(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BehaviorOnInvoked() {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.get_BehaviorOnInvoked()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BehaviorOnInvoked(value) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.put_BehaviorOnInvoked(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SwipeItem, SwipeItemInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Invoked(handler) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.add_Invoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Invoked(token) {
        if (!this.HasProp("__ISwipeItem")) {
            if ((queryResult := this.QueryInterface(ISwipeItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItem := ISwipeItem(outPtr)
        }

        return this.__ISwipeItem.remove_Invoked(token)
    }

;@endregion Instance Methods
}
