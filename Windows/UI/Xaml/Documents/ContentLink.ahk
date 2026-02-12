#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Inline.ahk
#Include .\IContentLink.ahk
#Include .\IContentLinkStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ContentLink.ahk
#Include .\ContentLinkInvokedEventArgs.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides an inline-level content element that provides facilities for hosting links to contextual information.
 * @remarks
 * > [!IMPORTANT]
 * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ContentLink extends Inline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentLink

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentLink.IID

    /**
     * Identifies the Background dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.backgroundproperty
     * @type {DependencyProperty} 
     */
    static BackgroundProperty {
        get => ContentLink.get_BackgroundProperty()
    }

    /**
     * Identifies the Cursor dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.cursorproperty
     * @type {DependencyProperty} 
     */
    static CursorProperty {
        get => ContentLink.get_CursorProperty()
    }

    /**
     * Identifies the XYFocusLeft dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusleftproperty
     * @type {DependencyProperty} 
     */
    static XYFocusLeftProperty {
        get => ContentLink.get_XYFocusLeftProperty()
    }

    /**
     * Identifies the XYFocusRight dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusrightproperty
     * @type {DependencyProperty} 
     */
    static XYFocusRightProperty {
        get => ContentLink.get_XYFocusRightProperty()
    }

    /**
     * Identifies the XYFocusUp dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusupproperty
     * @type {DependencyProperty} 
     */
    static XYFocusUpProperty {
        get => ContentLink.get_XYFocusUpProperty()
    }

    /**
     * Identifies the XYFocusDown dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusdownproperty
     * @type {DependencyProperty} 
     */
    static XYFocusDownProperty {
        get => ContentLink.get_XYFocusDownProperty()
    }

    /**
     * Identifies the ElementSoundMode dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.elementsoundmodeproperty
     * @type {DependencyProperty} 
     */
    static ElementSoundModeProperty {
        get => ContentLink.get_ElementSoundModeProperty()
    }

    /**
     * Identifies the FocusState dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.focusstateproperty
     * @type {DependencyProperty} 
     */
    static FocusStateProperty {
        get => ContentLink.get_FocusStateProperty()
    }

    /**
     * Identifies the XYFocusUpNavigationStrategy dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusupnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusUpNavigationStrategyProperty {
        get => ContentLink.get_XYFocusUpNavigationStrategyProperty()
    }

    /**
     * Identifies the XYFocusDownNavigationStrategy dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusdownnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusDownNavigationStrategyProperty {
        get => ContentLink.get_XYFocusDownNavigationStrategyProperty()
    }

    /**
     * Identifies the XYFocusLeftNavigationStrategy dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusleftnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusLeftNavigationStrategyProperty {
        get => ContentLink.get_XYFocusLeftNavigationStrategyProperty()
    }

    /**
     * Identifies the XYFocusRightNavigationStrategy dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusrightnavigationstrategyproperty
     * @type {DependencyProperty} 
     */
    static XYFocusRightNavigationStrategyProperty {
        get => ContentLink.get_XYFocusRightNavigationStrategyProperty()
    }

    /**
     * Identifies the IsTabStop dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.istabstopproperty
     * @type {DependencyProperty} 
     */
    static IsTabStopProperty {
        get => ContentLink.get_IsTabStopProperty()
    }

    /**
     * Identifies the TabIndex dependency property.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.tabindexproperty
     * @type {DependencyProperty} 
     */
    static TabIndexProperty {
        get => ContentLink.get_TabIndexProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_BackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CursorProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_CursorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusLeftProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusLeftProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusRightProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusRightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusUpProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusUpProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusDownProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusDownProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ElementSoundModeProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_ElementSoundModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusStateProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_FocusStateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusUpNavigationStrategyProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusUpNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusDownNavigationStrategyProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusDownNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusLeftNavigationStrategyProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusLeftNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XYFocusRightNavigationStrategyProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_XYFocusRightNavigationStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTabStopProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_IsTabStopProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TabIndexProperty() {
        if (!ContentLink.HasProp("__IContentLinkStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentLinkStatics.IID)
            ContentLink.__IContentLinkStatics := IContentLinkStatics(factoryPtr)
        }

        return ContentLink.__IContentLinkStatics.get_TabIndexProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the information that the ContentLink contains.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.info
     * @type {ContentLinkInfo} 
     */
    Info {
        get => this.get_Info()
        set => this.put_Info(value)
    }

    /**
     * Gets or sets a brush that provides the background color of the link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.background
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets or sets the type of cursor to show when the pointer is over the link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.cursor
     * @type {Integer} 
     */
    Cursor {
        get => this.get_Cursor()
        set => this.put_Cursor(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) left.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * This property is supported only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusleft
     * @type {DependencyObject} 
     */
    XYFocusLeft {
        get => this.get_XYFocusLeft()
        set => this.put_XYFocusLeft(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) right.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * This property is supported only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusright
     * @type {DependencyObject} 
     */
    XYFocusRight {
        get => this.get_XYFocusRight()
        set => this.put_XYFocusRight(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) up.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * This property is supported only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusup
     * @type {DependencyObject} 
     */
    XYFocusUp {
        get => this.get_XYFocusUp()
        set => this.put_XYFocusUp(value)
    }

    /**
     * Gets or sets the object that gets focus when a user presses the Directional Pad (DPAD) down.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * This property is supported only when using a game pad or remote control. The property is ignored otherwise.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusdown
     * @type {DependencyObject} 
     */
    XYFocusDown {
        get => this.get_XYFocusDown()
        set => this.put_XYFocusDown(value)
    }

    /**
     * Gets or sets a value that specifies the control's preference for whether it plays sounds.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * For more info, see [Sound in UWP apps](/windows/uwp/design/style/sound).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.elementsoundmode
     * @type {Integer} 
     */
    ElementSoundMode {
        get => this.get_ElementSoundMode()
        set => this.put_ElementSoundMode(value)
    }

    /**
     * Gets a value that specifies whether this link has focus, and the mode by which focus was obtained.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * For more info, see [Control.FocusState](../windows.ui.xaml.controls/control_focusstate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.focusstate
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of an up navigation.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusupnavigationstrategy
     * @type {Integer} 
     */
    XYFocusUpNavigationStrategy {
        get => this.get_XYFocusUpNavigationStrategy()
        set => this.put_XYFocusUpNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a down navigation.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusdownnavigationstrategy
     * @type {Integer} 
     */
    XYFocusDownNavigationStrategy {
        get => this.get_XYFocusDownNavigationStrategy()
        set => this.put_XYFocusDownNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a left navigation.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusleftnavigationstrategy
     * @type {Integer} 
     */
    XYFocusLeftNavigationStrategy {
        get => this.get_XYFocusLeftNavigationStrategy()
        set => this.put_XYFocusLeftNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that specifies the strategy used to determine the target element of a right navigation.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * When this property is set to **Auto**, the strategy is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback strategy is **Projection**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.xyfocusrightnavigationstrategy
     * @type {Integer} 
     */
    XYFocusRightNavigationStrategy {
        get => this.get_XYFocusRightNavigationStrategy()
        set => this.put_XYFocusRightNavigationStrategy(value)
    }

    /**
     * Gets or sets a value that indicates whether the link is included in tab navigation.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * For more info, see [Control.IsTabStop](../windows.ui.xaml.controls/control_istabstop.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.istabstop
     * @type {Boolean} 
     */
    IsTabStop {
        get => this.get_IsTabStop()
        set => this.put_IsTabStop(value)
    }

    /**
     * Gets or sets a value that determines the order in which elements receive focus when the user navigates through controls by pressing the Tab key.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * For more info, see [Control.TabIndex](../windows.ui.xaml.controls/control_tabindex.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.tabindex
     * @type {Integer} 
     */
    TabIndex {
        get => this.get_TabIndex()
        set => this.put_TabIndex(value)
    }

    /**
     * Occurs when user interaction activates the link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @type {TypedEventHandler<ContentLink, ContentLinkInvokedEventArgs>}
    */
    OnInvoked {
        get {
            if(!this.HasProp("__OnInvoked")){
                this.__OnInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{51ba1af0-354e-5868-b10b-8748e55a6370}"),
                    ContentLink,
                    ContentLinkInvokedEventArgs
                )
                this.__OnInvokedToken := this.add_Invoked(this.__OnInvoked.iface)
            }
            return this.__OnInvoked
        }
    }

    /**
     * Occurs when a link receives focus.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * For more info, see [UIElement.GotFocus](../windows.ui.xaml/uielement_gotfocus.md).
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
     * Occurs when a link loses focus.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * For more info, see [UIElement.LostFocus](../windows.ui.xaml/uielement_lostfocus.md).
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
     * Initializes a new instance of the ContentLink class.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.ContentLink")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInvokedToken")) {
            this.remove_Invoked(this.__OnInvokedToken)
            this.__OnInvoked.iface.Dispose()
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
     * @returns {ContentLinkInfo} 
     */
    get_Info() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_Info()
    }

    /**
     * 
     * @param {ContentLinkInfo} value 
     * @returns {HRESULT} 
     */
    put_Info(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_Info(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_Background()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_Background(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Cursor() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_Cursor()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Cursor(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_Cursor(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusLeft() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusLeft()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeft(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusLeft(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusRight() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusRight()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRight(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusRight(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusUp() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusUp()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUp(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusUp(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_XYFocusDown() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusDown()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDown(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusDown(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElementSoundMode() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_ElementSoundMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ElementSoundMode(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_ElementSoundMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FocusState() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_FocusState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusUpNavigationStrategy() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusUpNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusUpNavigationStrategy(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusUpNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusDownNavigationStrategy() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusDownNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusDownNavigationStrategy(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusDownNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusLeftNavigationStrategy() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusLeftNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusLeftNavigationStrategy(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusLeftNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusRightNavigationStrategy() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_XYFocusRightNavigationStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusRightNavigationStrategy(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_XYFocusRightNavigationStrategy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTabStop() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_IsTabStop()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTabStop(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_IsTabStop(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabIndex() {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.get_TabIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TabIndex(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.put_TabIndex(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ContentLink, ContentLinkInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Invoked(handler) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.add_Invoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Invoked(token) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.remove_Invoked(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.add_GotFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GotFocus(token) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.remove_GotFocus(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.add_LostFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LostFocus(token) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.remove_LostFocus(token)
    }

    /**
     * Attempts to set the focus on the link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * 
     * For more info, see [Control.Focus](/uwp/api/Windows.UI.Xaml.Controls.Control#controls-and-focus).
     * @param {Integer} value Specifies how focus was set, as a value of the enumeration.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlink.focus
     */
    Focus(value) {
        if (!this.HasProp("__IContentLink")) {
            if ((queryResult := this.QueryInterface(IContentLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLink := IContentLink(outPtr)
        }

        return this.__IContentLink.Focus(value)
    }

;@endregion Instance Methods
}
