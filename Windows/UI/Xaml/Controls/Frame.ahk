#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IFrame.ahk
#Include .\IFrame2.ahk
#Include .\IFrame3.ahk
#Include .\IFrame4.ahk
#Include .\IFrame5.ahk
#Include .\INavigate.ahk
#Include .\IFrameStatics.ahk
#Include .\IFrameStatics5.ahk
#Include .\IFrameStatics2.ahk
#Include .\IFrameFactory.ahk
#Include ..\Navigation\NavigatedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\Navigation\NavigationEventArgs.ahk
#Include ..\Navigation\NavigatingCancelEventHandler.ahk
#Include ..\Navigation\NavigatingCancelEventArgs.ahk
#Include ..\Navigation\NavigationFailedEventHandler.ahk
#Include ..\Navigation\NavigationFailedEventArgs.ahk
#Include ..\Navigation\NavigationStoppedEventHandler.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Displays [Page](page.md) instances, supports navigation to new pages, and maintains a navigation history to support forward and backward navigation.
 * @remarks
 * You use the Frame control to support navigation to [Page](page.md) instances. You create as many different page types as needed to present the content in your app, and then navigate to those pages by calling the [Navigate](frame_navigate_1426351961.md) method and passing in the type of the page to navigate to. You can also pass in a parameter object to initialize the page to a particular state.
 * 
 * The frame maintains a history of pages it has navigated to. You can get the type of the current page through the [CurrentSourcePageType](frame_currentsourcepagetype.md) property, and navigate forward or backward with the [GoBack](frame_goback_1030386674.md) and [GoForward](frame_goforward_1537152893.md) methods. The [CanGoBack](frame_cangoback.md) and [CanGoForward](frame_cangoforward.md) properties indicate whether a page is available in the desired direction. One common practice is to bind the [IsEnabled](control_isenabled.md) properties of navigation buttons to [CanGoBack](frame_cangoback.md) and [CanGoForward](frame_cangoforward.md) so that users can't navigate to a page that doesn't exist.
 * 
 * You can handle the [Navigating](frame_navigating.md), [Navigated](frame_navigated.md), [NavigationStopped](frame_navigationstopped.md), and [NavigationFailed](frame_navigationfailed.md) events to perform high-level tasks such as starting and stopping a "navigation in progress" animation or displaying an error message. For page-level tasks, override the page [OnNavigatedTo](page_onnavigatedto_1083052518.md), [OnNavigatingFrom](page_onnavigatingfrom_425696585.md), and [OnNavigatedFrom](page_onnavigatedfrom_1389759661.md) methods. This is useful to perform tasks such as initializing and saving the page state.
 * 
 * By default, each navigation creates a new instance of the specific [Page](page.md) subclass requested, and disposes the previous page instance. This happens even when navigating back to a previously visited page or when the new page type is the same as the previous page type. Apps that involve frequent navigation to the same pages can cache and reuse the page instances to make navigation more efficient. To do this, set the [CacheSize](frame_cachesize.md) property to specify how many pages to cache. For each page type that you want to cache, you must also set the [Page.NavigationCacheMode](page_navigationcachemode.md) property to either **Enabled** or **Required**. Pages with a **Required** cache mode are cached regardless of the [CacheSize](frame_cachesize.md) value, and do not count against the [CacheSize](frame_cachesize.md) total.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Frame extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrame.IID

    /**
     * Identifies the [CacheSize](frame_cachesize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.cachesizeproperty
     * @type {DependencyProperty} 
     */
    static CacheSizeProperty {
        get => Frame.get_CacheSizeProperty()
    }

    /**
     * Identifies the [CanGoBack](frame_cangoback.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.cangobackproperty
     * @type {DependencyProperty} 
     */
    static CanGoBackProperty {
        get => Frame.get_CanGoBackProperty()
    }

    /**
     * Identifies the [CanGoForward](frame_cangoforward.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.cangoforwardproperty
     * @type {DependencyProperty} 
     */
    static CanGoForwardProperty {
        get => Frame.get_CanGoForwardProperty()
    }

    /**
     * Identifies the [CurrentSourcePageType](frame_currentsourcepagetype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.currentsourcepagetypeproperty
     * @type {DependencyProperty} 
     */
    static CurrentSourcePageTypeProperty {
        get => Frame.get_CurrentSourcePageTypeProperty()
    }

    /**
     * Identifies the [SourcePageType](frame_sourcepagetype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.sourcepagetypeproperty
     * @type {DependencyProperty} 
     */
    static SourcePageTypeProperty {
        get => Frame.get_SourcePageTypeProperty()
    }

    /**
     * Identifies the [BackStackDepth](frame_backstackdepth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.backstackdepthproperty
     * @type {DependencyProperty} 
     */
    static BackStackDepthProperty {
        get => Frame.get_BackStackDepthProperty()
    }

    /**
     * Identifies the IsNavigationStackEnabled dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.isnavigationstackenabledproperty
     * @type {DependencyProperty} 
     */
    static IsNavigationStackEnabledProperty {
        get => Frame.get_IsNavigationStackEnabledProperty()
    }

    /**
     * Identifies the [BackStack](frame_backstack.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.backstackproperty
     * @type {DependencyProperty} 
     */
    static BackStackProperty {
        get => Frame.get_BackStackProperty()
    }

    /**
     * Identifies the [ForwardStack](frame_forwardstack.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.forwardstackproperty
     * @type {DependencyProperty} 
     */
    static ForwardStackProperty {
        get => Frame.get_ForwardStackProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CacheSizeProperty() {
        if (!Frame.HasProp("__IFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics.IID)
            Frame.__IFrameStatics := IFrameStatics(factoryPtr)
        }

        return Frame.__IFrameStatics.get_CacheSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanGoBackProperty() {
        if (!Frame.HasProp("__IFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics.IID)
            Frame.__IFrameStatics := IFrameStatics(factoryPtr)
        }

        return Frame.__IFrameStatics.get_CanGoBackProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanGoForwardProperty() {
        if (!Frame.HasProp("__IFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics.IID)
            Frame.__IFrameStatics := IFrameStatics(factoryPtr)
        }

        return Frame.__IFrameStatics.get_CanGoForwardProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CurrentSourcePageTypeProperty() {
        if (!Frame.HasProp("__IFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics.IID)
            Frame.__IFrameStatics := IFrameStatics(factoryPtr)
        }

        return Frame.__IFrameStatics.get_CurrentSourcePageTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourcePageTypeProperty() {
        if (!Frame.HasProp("__IFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics.IID)
            Frame.__IFrameStatics := IFrameStatics(factoryPtr)
        }

        return Frame.__IFrameStatics.get_SourcePageTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackStackDepthProperty() {
        if (!Frame.HasProp("__IFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics.IID)
            Frame.__IFrameStatics := IFrameStatics(factoryPtr)
        }

        return Frame.__IFrameStatics.get_BackStackDepthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsNavigationStackEnabledProperty() {
        if (!Frame.HasProp("__IFrameStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics5.IID)
            Frame.__IFrameStatics5 := IFrameStatics5(factoryPtr)
        }

        return Frame.__IFrameStatics5.get_IsNavigationStackEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackStackProperty() {
        if (!Frame.HasProp("__IFrameStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics2.IID)
            Frame.__IFrameStatics2 := IFrameStatics2(factoryPtr)
        }

        return Frame.__IFrameStatics2.get_BackStackProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForwardStackProperty() {
        if (!Frame.HasProp("__IFrameStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameStatics2.IID)
            Frame.__IFrameStatics2 := IFrameStatics2(factoryPtr)
        }

        return Frame.__IFrameStatics2.get_ForwardStackProperty()
    }

    /**
     * 
     * @returns {Frame} 
     */
    static CreateInstance() {
        if (!Frame.HasProp("__IFrameFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Frame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameFactory.IID)
            Frame.__IFrameFactory := IFrameFactory(factoryPtr)
        }

        return Frame.__IFrameFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the number of pages in the navigation history that can be cached for the frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.cachesize
     * @type {Integer} 
     */
    CacheSize {
        get => this.get_CacheSize()
        set => this.put_CacheSize(value)
    }

    /**
     * Gets a value that indicates whether there is at least one entry in back navigation history.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.cangoback
     * @type {Boolean} 
     */
    CanGoBack {
        get => this.get_CanGoBack()
    }

    /**
     * Gets a value that indicates whether there is at least one entry in forward navigation history.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.cangoforward
     * @type {Boolean} 
     */
    CanGoForward {
        get => this.get_CanGoForward()
    }

    /**
     * Gets a type reference for the content that is currently displayed.
     * @remarks
     * CurrentSourcePageType and [SourcePageType](frame_sourcepagetype.md) are normally the same value. However, if the frame calls [Navigate](frame_navigate_1426351961.md) and the navigation is still in progress, the CurrentSourcePageType is the value before the navigation and the [SourcePageType](frame_sourcepagetype.md) is the value being navigated to.
     * 
     * 
     * 
     * > [!TIP]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). When programming using C#, it is common to use the **typeof** operator to get references to the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) of a type. In Microsoft Visual Basic, use **GetType**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.currentsourcepagetype
     * @type {TypeName} 
     */
    CurrentSourcePageType {
        get => this.get_CurrentSourcePageType()
    }

    /**
     * Gets or sets a type reference of the current content, or the content that should be navigated to.
     * @remarks
     * [CurrentSourcePageType](frame_currentsourcepagetype.md) and SourcePageType are normally the same value. However, if the frame calls [Navigate](frame_navigate_1426351961.md) and the navigation is still in progress, the [CurrentSourcePageType](frame_currentsourcepagetype.md) is the value before the navigation and the SourcePageType is the value being navigated to.
     * 
     * > [!TIP]
     * > If you are programming using a Microsoft .NET language (C# or Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). When programming using C#, it is common to use the **typeof** operator to get references to the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) of a type. In Visual Basic, use **GetType**.
     * 
     * SourcePageType can be set in XAML, using string-to-type conversion that's interpreted using XAML namespace mappings, but that's rarely done. It's a better practice to have code at the app level that tracks activation and whether a suspended app is resuming, which then uses [Frame.Navigate](frame_navigate_1426351961.md) to set the current page. The Microsoft Visual Studio templates often produce such code for you. For this same reason, it's also rare to set SourcePageType as an alternative to calling [Frame.Navigate](frame_navigate_1426351961.md), which also specifies a [Page](page.md) by type reference. If you do set a value for SourcePageType in XAML, you typically need to use a prefix such as "local:" that's defined in the same XAML construct. You need the prefix to map a XAML namespace that references the code namespace where your page partial class is defined. For more info, see [XAML namespaces and namespace mapping](/windows/uwp/xaml-platform/xaml-namespaces-and-namespace-mapping).
     * 
     * A more typical scenario for SourcePageType in code is to only read its value, and not set it. For example you might compare SourcePageType for the current page in the [Frame](frame.md) with items in the navigation stacks ([BackStack](frame_backstack.md), [ForwardStack](frame_forwardstack.md)) to see if there are existing entries for that same [Page](page.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.sourcepagetype
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
        set => this.put_SourcePageType(value)
    }

    /**
     * Gets the number of entries in the navigation back stack.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.backstackdepth
     * @type {Integer} 
     */
    BackStackDepth {
        get => this.get_BackStackDepth()
    }

    /**
     * Gets a collection of [PageStackEntry](../windows.ui.xaml.navigation/pagestackentry.md) instances representing the backward navigation history of the [Frame](frame.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.backstack
     * @type {IVector<PageStackEntry>} 
     */
    BackStack {
        get => this.get_BackStack()
    }

    /**
     * Gets a collection of [PageStackEntry](../windows.ui.xaml.navigation/pagestackentry.md) instances representing the forward navigation history of the [Frame](frame.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.forwardstack
     * @type {IVector<PageStackEntry>} 
     */
    ForwardStack {
        get => this.get_ForwardStack()
    }

    /**
     * Gets or sets a value that indicates whether navigation is recorded in the Frame's ForwardStack or BackStack.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.isnavigationstackenabled
     * @type {Boolean} 
     */
    IsNavigationStackEnabled {
        get => this.get_IsNavigationStackEnabled()
        set => this.put_IsNavigationStackEnabled(value)
    }

    /**
     * Occurs when the content that is being navigated to has been found and is available from the [Content](contentcontrol_content.md) property, although it may not have completed loading.
     * @type {NavigatedEventHandler}
    */
    OnNavigated {
        get {
            if(!this.HasProp("__OnNavigated")){
                this.__OnNavigated := WinRTEventHandler(
                    NavigatedEventHandler,
                    NavigatedEventHandler.IID,
                    IInspectable,
                    NavigationEventArgs
                )
                this.__OnNavigatedToken := this.add_Navigated(this.__OnNavigated.iface)
            }
            return this.__OnNavigated
        }
    }

    /**
     * Occurs when a new navigation is requested.
     * @type {NavigatingCancelEventHandler}
    */
    OnNavigating {
        get {
            if(!this.HasProp("__OnNavigating")){
                this.__OnNavigating := WinRTEventHandler(
                    NavigatingCancelEventHandler,
                    NavigatingCancelEventHandler.IID,
                    IInspectable,
                    NavigatingCancelEventArgs
                )
                this.__OnNavigatingToken := this.add_Navigating(this.__OnNavigating.iface)
            }
            return this.__OnNavigating
        }
    }

    /**
     * Occurs when an error is raised while navigating to the requested content.
     * @remarks
     * Currently, you must handle NavigationFailed to respond when the [Navigate](frame_navigate_1426351961.md) method fails. You can handle the failure directly in the event handler, or you can set the [NavigationFailedEventArgs.Handled](../windows.ui.xaml.navigation/navigationfailedeventargs_handled.md) property to **true** and use the [Navigate](frame_navigate_1426351961.md) method return value to respond to the failure.
     * @type {NavigationFailedEventHandler}
    */
    OnNavigationFailed {
        get {
            if(!this.HasProp("__OnNavigationFailed")){
                this.__OnNavigationFailed := WinRTEventHandler(
                    NavigationFailedEventHandler,
                    NavigationFailedEventHandler.IID,
                    IInspectable,
                    NavigationFailedEventArgs
                )
                this.__OnNavigationFailedToken := this.add_NavigationFailed(this.__OnNavigationFailed.iface)
            }
            return this.__OnNavigationFailed
        }
    }

    /**
     * Occurs when 
     * <!--the StopLoading method is called, or when -->
     * a new navigation is requested while a current navigation is in progress.
     * @type {NavigationStoppedEventHandler}
    */
    OnNavigationStopped {
        get {
            if(!this.HasProp("__OnNavigationStopped")){
                this.__OnNavigationStopped := WinRTEventHandler(
                    NavigationStoppedEventHandler,
                    NavigationStoppedEventHandler.IID,
                    IInspectable,
                    NavigationEventArgs
                )
                this.__OnNavigationStoppedToken := this.add_NavigationStopped(this.__OnNavigationStopped.iface)
            }
            return this.__OnNavigationStopped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnNavigatedToken")) {
            this.remove_Navigated(this.__OnNavigatedToken)
            this.__OnNavigated.iface.Dispose()
        }

        if(this.HasProp("__OnNavigatingToken")) {
            this.remove_Navigating(this.__OnNavigatingToken)
            this.__OnNavigating.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationFailedToken")) {
            this.remove_NavigationFailed(this.__OnNavigationFailedToken)
            this.__OnNavigationFailed.iface.Dispose()
        }

        if(this.HasProp("__OnNavigationStoppedToken")) {
            this.remove_NavigationStopped(this.__OnNavigationStoppedToken)
            this.__OnNavigationStopped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CacheSize() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.get_CacheSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CacheSize(value) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.put_CacheSize(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoBack() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.get_CanGoBack()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGoForward() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.get_CanGoForward()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_CurrentSourcePageType() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.get_CurrentSourcePageType()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.get_SourcePageType()
    }

    /**
     * 
     * @param {TypeName} value 
     * @returns {HRESULT} 
     */
    put_SourcePageType(value) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.put_SourcePageType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackStackDepth() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.get_BackStackDepth()
    }

    /**
     * 
     * @param {NavigatedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Navigated(handler) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.add_Navigated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Navigated(token) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.remove_Navigated(token)
    }

    /**
     * 
     * @param {NavigatingCancelEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Navigating(handler) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.add_Navigating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Navigating(token) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.remove_Navigating(token)
    }

    /**
     * 
     * @param {NavigationFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationFailed(handler) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.add_NavigationFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationFailed(token) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.remove_NavigationFailed(token)
    }

    /**
     * 
     * @param {NavigationStoppedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationStopped(handler) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.add_NavigationStopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NavigationStopped(token) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.remove_NavigationStopped(token)
    }

    /**
     * Navigates to the most recent item in back navigation history, if a [Frame](frame.md) manages its own navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.goback
     */
    GoBack() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.GoBack()
    }

    /**
     * Navigates to the most recent item in forward navigation history, if a [Frame](frame.md) manages its own navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.goforward
     */
    GoForward() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.GoForward()
    }

    /**
     * Causes the [Frame](frame.md) to load content represented by the specified [Page](page.md)-derived data type, also passing a parameter to be interpreted by the target of the navigation, and a value indicating the animated transition to use.
     * @param {TypeName} sourcePageType The page to navigate to, specified as a type reference to its partial class type. Must be a [Page](page.md)-derived data type; otherwise, an exception is thrown. (A type reference is given as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, or a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {IInspectable} parameter The navigation parameter to pass to the target page; must have a basic type (string, char, numeric, or [GUID](/windows/win32/api/guiddef/ns-guiddef-guid)) to support parameter serialization using [GetNavigationState](frame_getnavigationstate_1352043812.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.navigate
     */
    Navigate(sourcePageType, parameter) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.Navigate(sourcePageType, parameter)
    }

    /**
     * Serializes the [Frame](frame.md) navigation history into a string.
     * @remarks
     * This method is useful to restore the navigation state of your app after it has been suspended and resumed. When your app is suspended, call GetNavigationState and save the return value. When your app is resumed, call [SetNavigationState](/uwp/api/windows.ui.xaml.controls.frame.setnavigationstate) and pass it the saved value.
     * 
     * Calling this method will call [Page.OnNavigatedFrom](page_onnavigatedfrom_1389759661.md) for the current page using **NavigationMode.Forward**. GetNavigationState is usually called when the application is being suspended, so the current page is navigated away from.
     * 
     * 
     * 
     * > [!NOTE]
     * > The serialization format used by these methods is for internal use only. Your app should not form any dependencies on it. Additionally, this format supports serialization only for basic types like string, char, numeric and [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) types.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.getnavigationstate
     */
    GetNavigationState() {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.GetNavigationState()
    }

    /**
     * Reads and restores the navigation history of a [Frame](frame.md) from a provided serialization string.
     * @remarks
     * This method is useful to restore the navigation state of your app after it has been suspended and resumed. When your app is suspended, call [GetNavigationState](frame_getnavigationstate_1352043812.md) and save the return value. When your app is resumed, call [SetNavigationState](/uwp/api/windows.ui.xaml.controls.frame.setnavigationstate) and pass it the saved value.
     * 
     * Calling [SetNavigationState](/uwp/api/windows.ui.xaml.controls.frame.setnavigationstate) will call [Page.OnNavigatedTo](page_onnavigatedto_1083052518.md) for the current page, with **NavigationMode.Back**. [SetNavigationState](/uwp/api/windows.ui.xaml.controls.frame.setnavigationstate) is usually called when the application is being resumed, so the current page is navigated to.
     * @param {HSTRING} navigationState The serialization string that supplies the restore point for navigation history.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.setnavigationstate
     */
    SetNavigationState(navigationState) {
        if (!this.HasProp("__IFrame")) {
            if ((queryResult := this.QueryInterface(IFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame := IFrame(outPtr)
        }

        return this.__IFrame.SetNavigationState(navigationState)
    }

    /**
     * 
     * @returns {IVector<PageStackEntry>} 
     */
    get_BackStack() {
        if (!this.HasProp("__IFrame2")) {
            if ((queryResult := this.QueryInterface(IFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame2 := IFrame2(outPtr)
        }

        return this.__IFrame2.get_BackStack()
    }

    /**
     * 
     * @returns {IVector<PageStackEntry>} 
     */
    get_ForwardStack() {
        if (!this.HasProp("__IFrame2")) {
            if ((queryResult := this.QueryInterface(IFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame2 := IFrame2(outPtr)
        }

        return this.__IFrame2.get_ForwardStack()
    }

    /**
     * Causes the [Frame](frame.md) to load content represented by the specified [Page](page.md)-derived data type.
     * @remarks
     * You handle the [NavigationFailed](frame_navigationfailed.md) event to respond to navigation failure. You can handle the failure directly in the event handler, or you can set the [NavigationFailedEventArgs.Handled](../windows.ui.xaml.navigation/navigationfailedeventargs_handled.md) property to **true** and use the [Navigate](frame_navigate_1426351961.md) method return value to respond to the failure.
     * 
     * Apps typically use [GetNavigationState](frame_getnavigationstate_1352043812.md) to serialize the frame’s state when the app suspends. You can do this directly in your app code or indirectly by using the `SuspensionManager` class generated by the Visual Studio templates. To enable frame state serialization using [GetNavigationState](frame_getnavigationstate_1352043812.md), you must use only basic types for the navigation parameter, such as string, char, numeric, and [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) types. Otherwise [GetNavigationState](frame_getnavigationstate_1352043812.md) will throw an exception when the app suspends. The parameter can have other types if you do not use [GetNavigationState](frame_getnavigationstate_1352043812.md).
     * 
     * The parameter value can have a complex type if you do not use [GetNavigationState](frame_getnavigationstate_1352043812.md). However, you should still use only basic types in order to avoid excess memory usage caused by the frame’s navigation stack holding a reference to the parameter. A preferred approach is to not pass the actual object, but instead pass an identifier that you can use to look up the object in the target landing page. For example, instead of passing a `Customer` object, pass a reference to the `CustomerID`, then look up the `Customer` after the navigation is complete.
     * 
     * > [!TIP]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). When programming using C#, it is common to use the **typeof** operator to get references to the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) of a type. In Microsoft Visual Basic, use **GetType**. If you're using Visual C++ component extensions (C++/CX), where you'll need to create a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct, you can use the [typeid component extension](/cpp/windows/typeid-cpp-component-extensions).
     * @param {TypeName} sourcePageType The page to navigate to, specified as a type reference to its partial class type. Must be a [Page](page.md)-derived data type; otherwise, an exception is thrown. (A type reference is given as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, or a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {IInspectable} parameter 
     * @param {NavigationTransitionInfo} infoOverride 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.navigate
     */
    Navigate1(sourcePageType, parameter, infoOverride) {
        if (!this.HasProp("__IFrame2")) {
            if ((queryResult := this.QueryInterface(IFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame2 := IFrame2(outPtr)
        }

        return this.__IFrame2.Navigate(sourcePageType, parameter, infoOverride)
    }

    /**
     * Navigates to the most recent item in back navigation history, if a [Frame](frame.md) manages its own navigation history, and specifies the animated transition to use.
     * @param {NavigationTransitionInfo} transitionInfoOverride Info about the animated transition to use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.goback
     */
    GoBack1(transitionInfoOverride) {
        if (!this.HasProp("__IFrame3")) {
            if ((queryResult := this.QueryInterface(IFrame3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame3 := IFrame3(outPtr)
        }

        return this.__IFrame3.GoBack(transitionInfoOverride)
    }

    /**
     * Reads and restores the navigation history of a [Frame](frame.md) from a provided serialization string.
     * @remarks
     * If you call **SetNavigationState** with the **suppressNavigate** parameter set to **true**, [Page.OnNavigatedTo](page_onnavigatedto_1083052518.md) is not called for the current page. The current page is also put into the BackStack. When suppressing the transition, also be sure to use GoBack or GoForward to navigate to the correct page in the navigation history. NavigateTo is also supported, however the forward stack will be cleared when it is used.
     * @param {HSTRING} navigationState The serialization string that supplies the restore point for navigation history.
     * @param {Boolean} suppressNavigate **true** to restore navigation history without navigating to the current page; otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.setnavigationstate
     */
    SetNavigationStateWithNavigationControl(navigationState, suppressNavigate) {
        if (!this.HasProp("__IFrame4")) {
            if ((queryResult := this.QueryInterface(IFrame4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame4 := IFrame4(outPtr)
        }

        return this.__IFrame4.SetNavigationStateWithNavigationControl(navigationState, suppressNavigate)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNavigationStackEnabled() {
        if (!this.HasProp("__IFrame5")) {
            if ((queryResult := this.QueryInterface(IFrame5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame5 := IFrame5(outPtr)
        }

        return this.__IFrame5.get_IsNavigationStackEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsNavigationStackEnabled(value) {
        if (!this.HasProp("__IFrame5")) {
            if ((queryResult := this.QueryInterface(IFrame5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame5 := IFrame5(outPtr)
        }

        return this.__IFrame5.put_IsNavigationStackEnabled(value)
    }

    /**
     * Causes the [Frame](frame.md) to load content represented by the specified [Page](page.md), also passing a parameter to be interpreted by the target of the navigation.
     * @param {TypeName} sourcePageType The page to navigate to, specified as a type reference to its partial class type. (A type reference is given as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, or a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {IInspectable} parameter The navigation parameter to pass to the target page; must have a basic type (string, char, numeric, or [GUID](/windows/win32/api/guiddef/ns-guiddef-guid)) to support parameter serialization using [GetNavigationState](frame_getnavigationstate_1352043812.md).
     * @param {FrameNavigationOptions} navigationOptions Options for the navigation, including whether it is recorded in the navigation stack and what transition animation is used.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.navigatetotype
     */
    NavigateToType(sourcePageType, parameter, navigationOptions) {
        if (!this.HasProp("__IFrame5")) {
            if ((queryResult := this.QueryInterface(IFrame5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrame5 := IFrame5(outPtr)
        }

        return this.__IFrame5.NavigateToType(sourcePageType, parameter, navigationOptions)
    }

    /**
     * Causes the [Frame](frame.md) to load content represented by the specified [Page](page.md)-derived data type, also passing a parameter to be interpreted by the target of the navigation.
     * @param {TypeName} sourcePageType The page to navigate to, specified as a type reference to its partial class type. Must be a [Page](page.md)-derived data type; otherwise, an exception is thrown. (A type reference is given as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, or a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.frame.navigate
     */
    Navigate2(sourcePageType) {
        if (!this.HasProp("__INavigate")) {
            if ((queryResult := this.QueryInterface(INavigate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigate := INavigate(outPtr)
        }

        return this.__INavigate.Navigate(sourcePageType)
    }

;@endregion Instance Methods
}
