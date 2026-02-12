#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UserControl.ahk
#Include .\IPage.ahk
#Include .\IPageOverrides.ahk
#Include .\IPageFactory.ahk
#Include .\IPageStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents content that a [Frame](frame.md) control can navigate to.
 * @remarks
 * The Page class encapsulates content that the [Frame](frame.md) control can navigate to. You will generally create your own page types that derive from the Page class, and use Page (or a custom type) as the root element for the XAML-declared content.
 * 
 * Page is a [UserControl](usercontrol.md), therefore you can declare a single XAML object element as [Content](usercontrol_content.md) for the Page. Most pages contain more than one UI element in total. You typically use a panel or items control as the immediate child of a Page, so that you can have the page contain and compose multiple elements of a UI.
 * 
 * You can also specify app bars, with the [TopAppBar](page_topappbar.md) and [BottomAppBar](page_bottomappbar.md) properties. You must use property element syntax for these properties to contain the [AppBar](appbar.md) values in XAML.
 * 
 * You can create new pages using the **Add | New Item** menu option for your project in Microsoft Visual Studio. These all create XAML files where the root is a Page class, and the code-behind class derives from Page. Some page item templates add navigation support and additional features. For more info on the Microsoft Visual Studio item templates, see [C#, VB, and C++ item templates for ](/previous-versions/windows/apps/jj236469(v=win.10)).
 * 
 * Create as many pages as you need to present the content in your app, and then navigate to those pages by calling the [Frame.Navigate](frame_navigate_1426351961.md) method and passing in a type reference for the page to navigate to. By type reference, we mean an instance of a class that identifies a type in the type system, for the language you are using. For Microsoft .NET that type is [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true), and you can get a [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) reference from a page class' name by using the operators **typeof** (C#) or **GetType** (Visual Basic). For Visual C++ component extensions (C++/CX), use [TypeName](../windows.ui.xaml.interop/typename.md). Initialize a [TypeName](../windows.ui.xaml.interop/typename.md) by using the **typeid** of a class. **typeid** is a component extension that can be called for any runtime class.
 * 
 * Through [Frame.Navigate](frame_navigate_1426351961.md), you can also pass in a parameter object to initialize the page to a particular state. The parameter object is loosely typed but serialization of navigation history only works for basic types (see Remarks in [Frame.Navigate(Type, Object)](frame_navigate_1603787821.md)). Pages that are navigated to as part of an activation generally pass data from the activation. Other navigation scenarios such as search result pages also have expectations of what info will be contained in the parameter.
 * 
 * By default, each navigation creates a new instance of the specific Page (or subclass) requested, and disposes the previous page instance. This happens even when navigating back to a previously visited page or when the new page type is the same as the previous page type. Apps that involve frequent navigation to the same pages can cache and reuse the page instances to make navigation more efficient. To do this, set the [Frame.CacheSize](frame_cachesize.md) property to specify how many pages to cache. For each page type that you want to cache, you must also set the [NavigationCacheMode](page_navigationcachemode.md) property to either **Enabled** or **Required**. Pages with a **Required** cache mode are cached regardless of the [CacheSize](frame_cachesize.md) value, and do not count against the [CacheSize](frame_cachesize.md) total.
 * 
 * You can override the page [OnNavigatedTo](page_onnavigatedto_1083052518.md), [OnNavigatingFrom](page_onnavigatingfrom_425696585.md), and [OnNavigatedFrom](page_onnavigatedfrom_1389759661.md) methods to perform tasks such as initializing and saving the page state. [OnNavigatingFrom](page_onnavigatingfrom_425696585.md) can be used to cancel a navigation by setting a [Cancel](../windows.ui.xaml.navigation/navigatingcanceleventargs_cancel.md) property in the event data from your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Page extends UserControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPage.IID

    /**
     * Identifies the [Frame](page_frame.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.frameproperty
     * @type {DependencyProperty} 
     */
    static FrameProperty {
        get => Page.get_FrameProperty()
    }

    /**
     * Identifies the [TopAppBar](page_topappbar.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.topappbarproperty
     * @type {DependencyProperty} 
     */
    static TopAppBarProperty {
        get => Page.get_TopAppBarProperty()
    }

    /**
     * Identifies the [BottomAppBar](page_bottomappbar.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.bottomappbarproperty
     * @type {DependencyProperty} 
     */
    static BottomAppBarProperty {
        get => Page.get_BottomAppBarProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Page} 
     */
    static CreateInstance() {
        if (!Page.HasProp("__IPageFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Page")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPageFactory.IID)
            Page.__IPageFactory := IPageFactory(factoryPtr)
        }

        return Page.__IPageFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FrameProperty() {
        if (!Page.HasProp("__IPageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Page")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPageStatics.IID)
            Page.__IPageStatics := IPageStatics(factoryPtr)
        }

        return Page.__IPageStatics.get_FrameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TopAppBarProperty() {
        if (!Page.HasProp("__IPageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Page")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPageStatics.IID)
            Page.__IPageStatics := IPageStatics(factoryPtr)
        }

        return Page.__IPageStatics.get_TopAppBarProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BottomAppBarProperty() {
        if (!Page.HasProp("__IPageStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Page")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPageStatics.IID)
            Page.__IPageStatics := IPageStatics(factoryPtr)
        }

        return Page.__IPageStatics.get_BottomAppBarProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the controlling [Frame](frame.md) for the [Page](page.md) content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.frame
     * @type {Frame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * Gets or sets the navigation mode that indicates whether this [Page](page.md) is cached, and the period of time that the cache entry should persist.
     * @remarks
     * To enable a page to be cached, set NavigationCacheMode to either **Enabled** or **Required**. The difference in behavior is that **Enabled** might not be cached if the frame's cache size limit ([CacheSize](frame_cachesize.md)) is exceeded, whereas **Required** always generates an entry no matter the size limit.
     * 
     * If you want to change the value of NavigationCacheMode programmatically to **Enabled** or **Required**, you can only set these values in the constructor for the page.
     * 
     * If you change the value of NavigationCacheMode from **Required** or **Enabled** to **Disabled**, the page is flushed from the cache. The page is not simply marked as available to be flushed when the configured [CacheSize](frame_cachesize.md) is exceeded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.navigationcachemode
     * @type {Integer} 
     */
    NavigationCacheMode {
        get => this.get_NavigationCacheMode()
        set => this.put_NavigationCacheMode(value)
    }

    /**
     * Gets a reference to an [AppBar](appbar.md) displayed at the top of the page, if any.
     * @remarks
     * In XAML, make sure you specify the `Page.TopAppBar` property element in the same area as other property elements that may already be defined, like `Page.BottomAppBar` or `Page.Resources`. The XAML language enforces that you can't mix the property elements between the XAML content that is setting [Content](usercontrol_content.md), such as the typical root [Grid](grid.md) element. For more info on XAML syntax, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.topappbar
     * @type {AppBar} 
     */
    TopAppBar {
        get => this.get_TopAppBar()
        set => this.put_TopAppBar(value)
    }

    /**
     * Gets a reference to an [AppBar](appbar.md) displayed at the bottom of the page, if any.
     * @remarks
     * In XAML, make sure you specify the `Page.BottomAppBar` property element in the same area as other property elements that may already be defined, like `Page.TopAppBar` or `Page.Resources`. The XAML language enforces that you can't mix the property elements between the XAML content that is setting [Content](usercontrol_content.md), such as the typical root [Grid](grid.md) element. For more info on XAML syntax, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.bottomappbar
     * @type {AppBar} 
     */
    BottomAppBar {
        get => this.get_BottomAppBar()
        set => this.put_BottomAppBar(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Frame} 
     */
    get_Frame() {
        if (!this.HasProp("__IPage")) {
            if ((queryResult := this.QueryInterface(IPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPage := IPage(outPtr)
        }

        return this.__IPage.get_Frame()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NavigationCacheMode() {
        if (!this.HasProp("__IPage")) {
            if ((queryResult := this.QueryInterface(IPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPage := IPage(outPtr)
        }

        return this.__IPage.get_NavigationCacheMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NavigationCacheMode(value) {
        if (!this.HasProp("__IPage")) {
            if ((queryResult := this.QueryInterface(IPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPage := IPage(outPtr)
        }

        return this.__IPage.put_NavigationCacheMode(value)
    }

    /**
     * 
     * @returns {AppBar} 
     */
    get_TopAppBar() {
        if (!this.HasProp("__IPage")) {
            if ((queryResult := this.QueryInterface(IPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPage := IPage(outPtr)
        }

        return this.__IPage.get_TopAppBar()
    }

    /**
     * 
     * @param {AppBar} value 
     * @returns {HRESULT} 
     */
    put_TopAppBar(value) {
        if (!this.HasProp("__IPage")) {
            if ((queryResult := this.QueryInterface(IPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPage := IPage(outPtr)
        }

        return this.__IPage.put_TopAppBar(value)
    }

    /**
     * 
     * @returns {AppBar} 
     */
    get_BottomAppBar() {
        if (!this.HasProp("__IPage")) {
            if ((queryResult := this.QueryInterface(IPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPage := IPage(outPtr)
        }

        return this.__IPage.get_BottomAppBar()
    }

    /**
     * 
     * @param {AppBar} value 
     * @returns {HRESULT} 
     */
    put_BottomAppBar(value) {
        if (!this.HasProp("__IPage")) {
            if ((queryResult := this.QueryInterface(IPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPage := IPage(outPtr)
        }

        return this.__IPage.put_BottomAppBar(value)
    }

    /**
     * Invoked immediately after the [Page](page.md) is unloaded and is no longer the current source of a parent [Frame](frame.md).
     * @remarks
     * OnNavigatedFrom is invoked by default when you navigate between pages in your app. You can override this method and get info about the navigation from the NavigationEventArgs, and take any action required by your app. However, you should avoid changing the state of the page by unregistering event handlers or doing other cleanup, especially in apps that call [Frame.GetNavigationState](frame_getnavigationstate_1352043812.md) on suspend.
     * @param {NavigationEventArgs} e Event data that can be examined by overriding code. The event data is representative of the navigation that has unloaded the current [Page](page.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.onnavigatedfrom
     */
    OnNavigatedFrom(e) {
        if (!this.HasProp("__IPageOverrides")) {
            if ((queryResult := this.QueryInterface(IPageOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageOverrides := IPageOverrides(outPtr)
        }

        return this.__IPageOverrides.OnNavigatedFrom(e)
    }

    /**
     * Invoked when the [Page](page.md) is loaded and becomes the current source of a parent [Frame](frame.md).
     * @remarks
     * Unlike in prior XAML platforms, the OnNavigated method is called before the visual tree is loaded. This has the following implications:
     * + You cannot access a valid [Parent](../windows.ui.xaml/frameworkelement_parent.md) property value from an override of OnNavigated. If you need to access the [Parent](../windows.ui.xaml/frameworkelement_parent.md) property, do so in a [Loaded](../windows.ui.xaml/frameworkelement_loaded.md) event handler.
     * + You cannot use OnNavigatedTo for element manipulation or state change of controls on the destination page. Instead, attach a [Loaded](../windows.ui.xaml/frameworkelement_loaded.md) event handler at the root of the newly loaded page's content, and perform any element manipulations, state changes, event wiring and so on in the [Loaded](../windows.ui.xaml/frameworkelement_loaded.md) event handler.
     * @param {NavigationEventArgs} e Event data that can be examined by overriding code. The event data is representative of the pending navigation that will load the current [Page](page.md). Usually the most relevant property to examine is [Parameter](../windows.ui.xaml.navigation/navigationeventargs_parameter.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.onnavigatedto
     */
    OnNavigatedTo(e) {
        if (!this.HasProp("__IPageOverrides")) {
            if ((queryResult := this.QueryInterface(IPageOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageOverrides := IPageOverrides(outPtr)
        }

        return this.__IPageOverrides.OnNavigatedTo(e)
    }

    /**
     * Invoked immediately before the [Page](page.md) is unloaded and is no longer the current source of a parent [Frame](frame.md).
     * @param {NavigatingCancelEventArgs} e Event data that can be examined by overriding code. The event data is representative of the navigation that will unload the current [Page](page.md) unless canceled. The navigation can potentially be canceled by setting [Cancel](../windows.ui.xaml.navigation/navigatingcanceleventargs_cancel.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.page.onnavigatingfrom
     */
    OnNavigatingFrom(e) {
        if (!this.HasProp("__IPageOverrides")) {
            if ((queryResult := this.QueryInterface(IPageOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPageOverrides := IPageOverrides(outPtr)
        }

        return this.__IPageOverrides.OnNavigatingFrom(e)
    }

;@endregion Instance Methods
}
