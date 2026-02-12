#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Span.ahk
#Include .\IHyperlink.ahk
#Include .\IHyperlink2.ahk
#Include .\IHyperlink3.ahk
#Include .\IHyperlink4.ahk
#Include .\IHyperlink5.ahk
#Include .\IHyperlinkStatics5.ahk
#Include .\IHyperlinkStatics.ahk
#Include .\IHyperlinkStatics2.ahk
#Include .\IHyperlinkStatics4.ahk
#Include .\IHyperlinkStatics3.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\Hyperlink.ahk
#Include .\HyperlinkClickEventArgs.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides an inline-level content element that provides facilities for hosting hyperlinks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Hyperlink extends Span {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHyperlink

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHyperlink.IID

    /**
     * Identifies the IsTabStop dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.istabstopproperty
     * @type {DependencyProperty} 
     */
    static IsTabStopProperty {
        get => Hyperlink.get_IsTabStopProperty()
    }

    /**
     * Identifies the TabIndex dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.tabindexproperty
     * @type {DependencyProperty} 
     */
    static TabIndexProperty {
        get => Hyperlink.get_TabIndexProperty()
    }

    /**
     * Identifies the [NavigateUri](hyperlink_navigateuri.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.navigateuriproperty
     * @type {DependencyProperty} 
     */
    static NavigateUriProperty {
        get => Hyperlink.get_NavigateUriProperty()
    }

    /**
     * Identifies the [UnderlineStyle](hyperlink_underlinestyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.underlinestyleproperty
     * @type {DependencyProperty} 
     */
    static UnderlineStyleProperty {
        get => Hyperlink.get_UnderlineStyleProperty()
    }

    /**
     * Identifies the [FocusState](hyperlink_focusstate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.focusstateproperty
     * @type {DependencyProperty} 
     */
    static FocusStateProperty {
        get => Hyperlink.get_FocusStateProperty()
    }

    /**
     * Identifies the [XYFocusUpNavigationStrategy](hyperlink_xyfocusupnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusupnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusUpNavigationStrategyProperty {
        get => Hyperlink.get_XYFocusUpNavigationStrategyProperty()
    }

    /**
     * Identifies the [XYFocusDownNavigationStrategy](hyperlink_xyfocusdownnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusdownnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusDownNavigationStrategyProperty {
        get => Hyperlink.get_XYFocusDownNavigationStrategyProperty()
    }

    /**
     * Identifies the [XYFocusLeftNavigationStrategy](hyperlink_xyfocusleftnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusleftnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusLeftNavigationStrategyProperty {
        get => Hyperlink.get_XYFocusLeftNavigationStrategyProperty()
    }

    /**
     * Identifies the [XYFocusRightNavigationStrategy](hyperlink_xyfocusrightnavigationstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusrightnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusRightNavigationStrategyProperty {
        get => Hyperlink.get_XYFocusRightNavigationStrategyProperty()
    }

    /**
     * Identifies the [XYFocusLeft](hyperlink_xyfocusleft.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusleftproperty
     * @type {DependencyProperty} 
     */
    static XYFocusLeftProperty {
        get => Hyperlink.get_XYFocusLeftProperty()
    }

    /**
     * Identifies the [XYFocusRight](hyperlink_xyfocusright.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusrightproperty
     * @type {DependencyProperty} 
     */
    static XYFocusRightProperty {
        get => Hyperlink.get_XYFocusRightProperty()
    }

    /**
     * Identifies the [XYFocusUp](hyperlink_xyfocusup.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusupproperty
     * @type {DependencyProperty} 
     */
    static XYFocusUpProperty {
        get => Hyperlink.get_XYFocusUpProperty()
    }

    /**
     * Identifies the [XYFocusDown](hyperlink_xyfocusdown.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusdownproperty
     * @type {DependencyProperty} 
     */
    static XYFocusDownProperty {
        get => Hyperlink.get_XYFocusDownProperty()
    }

    /**
     * Identifies the [ElementSoundMode](hyperlink_elementsoundmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.elementsoundmodeproperty
     * @type {DependencyProperty} 
     */
    static ElementSoundModeProperty {
        get => Hyperlink.get_ElementSoundModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTabStopProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics5.IID)
            Hyperlink.__IHyperlinkStatics5 := IHyperlinkStatics5(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics5.get_IsTabStopProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TabIndexProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics5.IID)
            Hyperlink.__IHyperlinkStatics5 := IHyperlinkStatics5(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics5.get_TabIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NavigateUriProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics.IID)
            Hyperlink.__IHyperlinkStatics := IHyperlinkStatics(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics.get_NavigateUriProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UnderlineStyleProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics2.IID)
            Hyperlink.__IHyperlinkStatics2 := IHyperlinkStatics2(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics2.get_UnderlineStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusStateProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics4.IID)
            Hyperlink.__IHyperlinkStatics4 := IHyperlinkStatics4(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics4.get_FocusStateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusUpNavigationStrategyProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics4.IID)
            Hyperlink.__IHyperlinkStatics4 := IHyperlinkStatics4(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics4.get_XYFocusUpNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusDownNavigationStrategyProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics4.IID)
            Hyperlink.__IHyperlinkStatics4 := IHyperlinkStatics4(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics4.get_XYFocusDownNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusLeftNavigationStrategyProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics4.IID)
            Hyperlink.__IHyperlinkStatics4 := IHyperlinkStatics4(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics4.get_XYFocusLeftNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusRightNavigationStrategyProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics4.IID)
            Hyperlink.__IHyperlinkStatics4 := IHyperlinkStatics4(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics4.get_XYFocusRightNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusLeftProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics3.IID)
            Hyperlink.__IHyperlinkStatics3 := IHyperlinkStatics3(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics3.get_XYFocusLeftProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusRightProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics3.IID)
            Hyperlink.__IHyperlinkStatics3 := IHyperlinkStatics3(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics3.get_XYFocusRightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusUpProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics3.IID)
            Hyperlink.__IHyperlinkStatics3 := IHyperlinkStatics3(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics3.get_XYFocusUpProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusDownProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics3.IID)
            Hyperlink.__IHyperlinkStatics3 := IHyperlinkStatics3(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics3.get_XYFocusDownProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ElementSoundModeProperty() {
        if (!Hyperlink.HasProp("__IHyperlinkStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkStatics3.IID)
            Hyperlink.__IHyperlinkStatics3 := IHyperlinkStatics3(factoryPtr)
        }

        return Hyperlink.__IHyperlinkStatics3.get_ElementSoundModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) to navigate to when the [Hyperlink](hyperlink.md) is activated.
     * @remarks
     * By default, a [Hyperlink](hyperlink.md) appears as a text hyperlink. When a user clicks it, it opens the URI you specify in the NavigateUri property in the default browser. (More specifically, it launches in the app that's registered for the particular scheme/protocol as you specified in the NavigateUri value.) The default browser is a separate process from your app. The typical user experience is that a new browser app appears as a split pane alongside your app, and the browser gets focus.
     * 
     * 
     * <!--Issue: default browser is not necessarily IE. This makes it more difficult to give more info on what happens to security and content settings when using a browser as 'modern' app; otherwise we could link this page: (https://msdn.microsoft.com/library/ie/hh771832(v=vs.85).aspx) and answer a lot of potential questions.-->
     * You don't need to handle the [Click](hyperlink_click.md) event to cause the navigation when you specify a value for NavigateUri. The [Click](hyperlink_click.md) event is intended for navigation within the app, for example if you want a new app page to load, and for that scenario you don't need a NavigateUri value. There's also nothing you can do within the [Click](hyperlink_click.md) event handler to prevent the default browser from loading any valid target specified for NavigateUri; that action takes place automatically (asynchronously) when the hyperlink is activated and can't be canceled from within the [Click](hyperlink_click.md) event handler.
     * 
     * If your intent is that the [Hyperlink](hyperlink.md) should load a specified URI within a [WebView](../windows.ui.xaml.controls/webview.md) control that's also part of your app, then don't specify a value for NavigateUri. Handle the [Click](hyperlink_click.md) event instead, and call [WebView.Navigate](../windows.ui.xaml.controls/webview_navigate_1098085581.md), specifying the URI to load.
     * 
     * You don't have to use **http:** or **https:** schemes. You can use schemes such as **ms-appx:**, **ms-appdata:**, or **ms-resources:**, if there's resource content at these locations that's appropriate to load in a browser. However, the **file:** scheme is specifically blocked. For more info, see [URI schemes](/previous-versions/windows/apps/jj655406(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.navigateuri
     * @type {Uri} 
     */
    NavigateUri {
        get => this.get_NavigateUri()
        set => this.put_NavigateUri(value)
    }

    /**
     * Gets or sets a value that indicates what kind of underline is shown under the hyperlink.
     * @remarks
     * By default, [Hyperlink](hyperlink.md) elements are underlined with a single, solid line. To turn off the underline, set this property to **None**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.underlinestyle
     * @type {Integer} 
     */
    UnderlineStyle {
        get => this.get_UnderlineStyle()
        set => this.put_UnderlineStyle(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) left.
     * @remarks
     * This property is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusleft
     * @type {DependencyObject} 
     */
    XYFocusLeft {
        get => this.get_XYFocusLeft()
        set => this.put_XYFocusLeft(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) right.
     * @remarks
     * This property is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusright
     * @type {DependencyObject} 
     */
    XYFocusRight {
        get => this.get_XYFocusRight()
        set => this.put_XYFocusRight(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) up.
     * @remarks
     * This property is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusup
     * @type {DependencyObject} 
     */
    XYFocusUp {
        get => this.get_XYFocusUp()
        set => this.put_XYFocusUp(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) down.
     * @remarks
     * This property is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusdown
     * @type {DependencyObject} 
     */
    XYFocusDown {
        get => this.get_XYFocusDown()
        set => this.put_XYFocusDown(value)
    }

    /**
     * Gets or sets a value that specifies the control's preference for whether it plays sounds.
     * @remarks
     * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.elementsoundmode
     * @type {Integer} 
     */
    ElementSoundMode {
        get => this.get_ElementSoundMode()
        set => this.put_ElementSoundMode(value)
    }

    /**
     * Gets a value that specifies whether this hyperlink has focus, and the mode by which focus was obtained.
     * @remarks
     * For more info, see [Control.FocusState](../windows.ui.xaml.controls/control_focusstate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.focusstate
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of an up navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusupnavigationstrategy
     * @type {Integer} 
     */
    XYFocusUpNavigationStrategy {
        get => this.get_XYFocusUpNavigationStrategy()
        set => this.put_XYFocusUpNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a down navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusdownnavigationstrategy
     * @type {Integer} 
     */
    XYFocusDownNavigationStrategy {
        get => this.get_XYFocusDownNavigationStrategy()
        set => this.put_XYFocusDownNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a left navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusleftnavigationstrategy
     * @type {Integer} 
     */
    XYFocusLeftNavigationStrategy {
        get => this.get_XYFocusLeftNavigationStrategy()
        set => this.put_XYFocusLeftNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a right navigation.
     * @remarks
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.xyfocusrightnavigationstrategy
     * @type {Integer} 
     */
    XYFocusRightNavigationStrategy {
        get => this.get_XYFocusRightNavigationStrategy()
        set => this.put_XYFocusRightNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that indicates whether the hyperlink is included in tab navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.istabstop
     * @type {Boolean} 
     */
    IsTabStop {
        get => this.get_IsTabStop()
        set => this.put_IsTabStop(value)
    }

    /**
     * Gets or sets a value that determines the order in which elements receive focus when the user navigates through controls by pressing the Tab key.
     * @remarks
     * For more info, see [Control.Tabindex](../windows.ui.xaml.controls/control_tabindex.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.tabindex
     * @type {Integer} 
     */
    TabIndex {
        get => this.get_TabIndex()
        set => this.put_TabIndex(value)
    }

    /**
     * Occurs when the [Hyperlink](hyperlink.md) is clicked.
     * @remarks
     * The Click event is intended for navigation within the app, or actions other than launching a URI in a browser. For example, if you want a new app page to load rather than opening a browser, or if you want to load the URI specifically within a [WebView](../windows.ui.xaml.controls/webview.md) control, you handle the Click event and write code to perform the actions you want. You don't typically handle Click as well as specifying a [NavigateUri](hyperlink_navigateuri.md) value, these represent two different ways of using the [Hyperlink](hyperlink.md) element. If your intent is to open the URI in the default browser, and you have specified a value for [NavigateUri](hyperlink_navigateuri.md), don't handle Click. Conversely, if you have code for the Click event, don't specify a [NavigateUri](hyperlink_navigateuri.md).
     * @type {TypedEventHandler<Hyperlink, HyperlinkClickEventArgs>}
    */
    OnClick {
        get {
            if(!this.HasProp("__OnClick")){
                this.__OnClick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5fead0d2-e657-5aef-a91b-7f52ead17fe3}"),
                    Hyperlink,
                    HyperlinkClickEventArgs
                )
                this.__OnClickToken := this.add_Click(this.__OnClick.iface)
            }
            return this.__OnClick
        }
    }

    /**
     * Occurs when a **Hyperlink** receives focus.
     * @remarks
     * For more info, see [UIElement.GotFocus](../windows.ui.xaml/uielement_gotfocus.md)
     * @type {RoutedEventHandler}
    */
    OnGotFocus {
        get {
            if(!this.HasProp("__OnGotFocus")){
                this.__OnGotFocus := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnGotFocusToken := this.add_GotFocus(this.__OnGotFocus.iface)
            }
            return this.__OnGotFocus
        }
    }

    /**
     * Occurs when a **Hyperlink** loses focus.
     * @remarks
     * For more info, see [UIElement.LostFocus](../windows.ui.xaml/uielement_lostfocus.md)
     * @type {RoutedEventHandler}
    */
    OnLostFocus {
        get {
            if(!this.HasProp("__OnLostFocus")){
                this.__OnLostFocus := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnLostFocusToken := this.add_LostFocus(this.__OnLostFocus.iface)
            }
            return this.__OnLostFocus
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Hyperlink](hyperlink.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Hyperlink")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClickToken")) {
            this.remove_Click(this.__OnClickToken)
            this.__OnClick.iface.Dispose()
        }

        if(this.HasProp("__OnGotFocusToken")) {
            this.remove_GotFocus(this.__OnGotFocusToken)
            this.__OnGotFocus.iface.Dispose()
        }

        if(this.HasProp("__OnLostFocusToken")) {
            this.remove_LostFocus(this.__OnLostFocusToken)
            this.__OnLostFocus.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_NavigateUri() {
        if (!this.HasProp("__IHyperlink")) {
            if ((queryResult := this.QueryInterface(IHyperlink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink := IHyperlink(outPtr)
        }

        return this.__IHyperlink.get_NavigateUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_NavigateUri(value) {
        if (!this.HasProp("__IHyperlink")) {
            if ((queryResult := this.QueryInterface(IHyperlink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink := IHyperlink(outPtr)
        }

        return this.__IHyperlink.put_NavigateUri(value)
    }

    /**
     * 
     * @param {TypedEventHandler<Hyperlink, HyperlinkClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Click(handler) {
        if (!this.HasProp("__IHyperlink")) {
            if ((queryResult := this.QueryInterface(IHyperlink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink := IHyperlink(outPtr)
        }

        return this.__IHyperlink.add_Click(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Click(token) {
        if (!this.HasProp("__IHyperlink")) {
            if ((queryResult := this.QueryInterface(IHyperlink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink := IHyperlink(outPtr)
        }

        return this.__IHyperlink.remove_Click(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnderlineStyle() {
        if (!this.HasProp("__IHyperlink2")) {
            if ((queryResult := this.QueryInterface(IHyperlink2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink2 := IHyperlink2(outPtr)
        }

        return this.__IHyperlink2.get_UnderlineStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UnderlineStyle(value) {
        if (!this.HasProp("__IHyperlink2")) {
            if ((queryResult := this.QueryInterface(IHyperlink2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink2 := IHyperlink2(outPtr)
        }

        return this.__IHyperlink2.put_UnderlineStyle(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusLeft() {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.get_XYFocusLeft()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeft(value) {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.put_XYFocusLeft(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusRight() {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.get_XYFocusRight()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRight(value) {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.put_XYFocusRight(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusUp() {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.get_XYFocusUp()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUp(value) {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.put_XYFocusUp(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusDown() {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.get_XYFocusDown()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDown(value) {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.put_XYFocusDown(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElementSoundMode() {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.get_ElementSoundMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ElementSoundMode(value) {
        if (!this.HasProp("__IHyperlink3")) {
            if ((queryResult := this.QueryInterface(IHyperlink3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink3 := IHyperlink3(outPtr)
        }

        return this.__IHyperlink3.put_ElementSoundMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FocusState() {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.get_FocusState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusUpNavigationStrategy() {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.get_XYFocusUpNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUpNavigationStrategy(value) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.put_XYFocusUpNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusDownNavigationStrategy() {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.get_XYFocusDownNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDownNavigationStrategy(value) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.put_XYFocusDownNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusLeftNavigationStrategy() {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.get_XYFocusLeftNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeftNavigationStrategy(value) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.put_XYFocusLeftNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusRightNavigationStrategy() {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.get_XYFocusRightNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRightNavigationStrategy(value) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.put_XYFocusRightNavigationStrategy(value)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.add_GotFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GotFocus(token) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.remove_GotFocus(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.add_LostFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LostFocus(token) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.remove_LostFocus(token)
    }

    /**
     * Attempts to set the focus on the hyperlink.
     * @remarks
     * For more info, see [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md).
     * @param {Integer} value Specifies how focus was set, as a value of the enumeration.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.hyperlink.focus
     */
    Focus(value) {
        if (!this.HasProp("__IHyperlink4")) {
            if ((queryResult := this.QueryInterface(IHyperlink4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink4 := IHyperlink4(outPtr)
        }

        return this.__IHyperlink4.Focus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTabStop() {
        if (!this.HasProp("__IHyperlink5")) {
            if ((queryResult := this.QueryInterface(IHyperlink5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink5 := IHyperlink5(outPtr)
        }

        return this.__IHyperlink5.get_IsTabStop()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTabStop(value) {
        if (!this.HasProp("__IHyperlink5")) {
            if ((queryResult := this.QueryInterface(IHyperlink5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink5 := IHyperlink5(outPtr)
        }

        return this.__IHyperlink5.put_IsTabStop(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabIndex() {
        if (!this.HasProp("__IHyperlink5")) {
            if ((queryResult := this.QueryInterface(IHyperlink5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink5 := IHyperlink5(outPtr)
        }

        return this.__IHyperlink5.get_TabIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TabIndex(value) {
        if (!this.HasProp("__IHyperlink5")) {
            if ((queryResult := this.QueryInterface(IHyperlink5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlink5 := IHyperlink5(outPtr)
        }

        return this.__IHyperlink5.put_TabIndex(value)
    }

;@endregion Instance Methods
}
