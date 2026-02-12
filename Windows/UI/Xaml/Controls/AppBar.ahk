#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IAppBar.ahk
#Include .\IAppBar2.ahk
#Include .\IAppBar3.ahk
#Include .\IAppBar4.ahk
#Include .\IAppBarOverrides.ahk
#Include .\IAppBarOverrides3.ahk
#Include .\IAppBarFactory.ahk
#Include .\IAppBarStatics2.ahk
#Include .\IAppBarStatics.ahk
#Include .\IAppBarStatics4.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the container control that holds app UI components for commanding and experiences. For Windows 10, see Remarks.
 * @remarks
 * > [!IMPORTANT]
 * > You should use the AppBar only when you are upgrading a Universal Windows 8 app that uses the AppBar, and need to minimize changes. For new apps in Windows 10, we recommend using the [CommandBar](commandbar.md) control instead.
 * 
 * An app bar is a UI element that's typically used to present commands and tools to the user, but can also be used for navigation. An app bar can appear at the top of the page, at the bottom of the page, or both. By default, its shown in a minimal state. Its content is shown or hidden when the user presses the ellipsis [•••], or performs a right-click that is not otherwise handled by the app.
 * 
 * Here's an app bar in its minimal state.
 * 
 * <img alt="A closed app bar control" src="images/AppBar_Closed_10.png" />
 * 
 * Here's the app bar when it's open.
 * 
 * <img alt="An open app bar control" src="images/AppBar_Open_10.png" />
 * 
 * You can open and close the app bar programmatically by setting the [IsOpen](appbar_isopen.md) property. You can use the [Opening](appbar_opening.md), [Opened](appbar_opened.md), [Closing](appbar_closing.md), and [Closed](appbar_closed.md) events to respond to the app bar being opened or closed.
 * 
 * By default, the app bar is dismissed (closed) when the user interacts with the app anywhere outside of the app bar. Closing the app bar this way is called *light dismiss*. You can control how the app bar is dismissed by setting the [IsSticky](appbar_issticky.md) property. When the app bar is *sticky*, it's not closed by a *light dismiss* gesture. The app bar remains visible until the user right clicks or presses the ellipsis [•••].
 * 
 * To add an app bar in Extensible Application Markup Language (XAML), you assign an AppBar control to a [Page](page.md)'s [TopAppBar](page_topappbar.md) or [BottomAppBar](page_bottomappbar.md) property. A single app bar can be shared across multiple pages. You can add and remove commands programmatically based on the page context.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AppBar extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBar.IID

    /**
     * Identifies the [ClosedDisplayMode](appbar_closeddisplaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.closeddisplaymodeproperty
     * @type {DependencyProperty} 
     */
    static ClosedDisplayModeProperty {
        get => AppBar.get_ClosedDisplayModeProperty()
    }

    /**
     * Identifies the [IsOpen](appbar_isopen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.isopenproperty
     * @type {DependencyProperty} 
     */
    static IsOpenProperty {
        get => AppBar.get_IsOpenProperty()
    }

    /**
     * Identifies the [IsSticky](appbar_issticky.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.isstickyproperty
     * @type {DependencyProperty} 
     */
    static IsStickyProperty {
        get => AppBar.get_IsStickyProperty()
    }

    /**
     * Identifies the [LightDismissOverlayMode](appbar_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => AppBar.get_LightDismissOverlayModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AppBar} 
     */
    static CreateInstance() {
        if (!AppBar.HasProp("__IAppBarFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarFactory.IID)
            AppBar.__IAppBarFactory := IAppBarFactory(factoryPtr)
        }

        return AppBar.__IAppBarFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClosedDisplayModeProperty() {
        if (!AppBar.HasProp("__IAppBarStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarStatics2.IID)
            AppBar.__IAppBarStatics2 := IAppBarStatics2(factoryPtr)
        }

        return AppBar.__IAppBarStatics2.get_ClosedDisplayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOpenProperty() {
        if (!AppBar.HasProp("__IAppBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarStatics.IID)
            AppBar.__IAppBarStatics := IAppBarStatics(factoryPtr)
        }

        return AppBar.__IAppBarStatics.get_IsOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStickyProperty() {
        if (!AppBar.HasProp("__IAppBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarStatics.IID)
            AppBar.__IAppBarStatics := IAppBarStatics(factoryPtr)
        }

        return AppBar.__IAppBarStatics.get_IsStickyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!AppBar.HasProp("__IAppBarStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarStatics4.IID)
            AppBar.__IAppBarStatics4 := IAppBarStatics4(factoryPtr)
        }

        return AppBar.__IAppBarStatics4.get_LightDismissOverlayModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [AppBar](appbar.md) is open.
     * @remarks
     * How the app bar is displayed when it's open depends on the [ClosedDisplayMode](appbar_closeddisplaymode.md) property setting. For more info, see [App bar and command bar](/windows/uwp/controls-and-patterns/app-bars).
     * 
     * You can open and close the app bar programmatically by setting the IsOpen property. You can use the [Opening](appbar_opening.md), [Opened](appbar_opened.md), [Closing](appbar_closing.md), and [Closed](appbar_closed.md) events to respond to the app bar being opened or closed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.isopen
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
        set => this.put_IsOpen(value)
    }

    /**
     * Gets or sets a value that indicates whether the [AppBar](appbar.md) does not close on light dismiss.
     * @remarks
     * By default, app bars are dismissed when the user interacts with your app anywhere outside of the app bar. This is called *light dismiss*. To keep commands visible, you can change the dismissal mode by setting the IsSticky property to **true**. When an app bar is *sticky*, it's dismissed only when the user right-clicks, presses Windows+Z, or swipes from the top or bottom edge of the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.issticky
     * @type {Boolean} 
     */
    IsSticky {
        get => this.get_IsSticky()
        set => this.put_IsSticky(value)
    }

    /**
     * Gets or sets a value that indicates whether icon buttons are displayed when the app bar is not completely open.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.closeddisplaymode
     * @type {Integer} 
     */
    ClosedDisplayMode {
        get => this.get_ClosedDisplayMode()
        set => this.put_ClosedDisplayMode(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for an [AppBar](appbar.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.templatesettings
     * @type {AppBarTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as a [MenuFlyout](menuflyout.md) or secondary menu in a command bar, closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Occurs when the [AppBar](appbar.md) changes from hidden to visible.
     * @remarks
     * You can respond to the app bar being opened by handling the Opened event.
     * @type {EventHandler<IInspectable>}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

    /**
     * Occurs when the [AppBar](appbar.md) changes from visible to hidden.
     * @remarks
     * You can respond to the app bar being dismissed by handling the Closed event.
     * @type {EventHandler<IInspectable>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs when the [AppBar](appbar.md) starts to change from hidden to visible.
     * @type {EventHandler<IInspectable>}
    */
    OnOpening {
        get {
            if(!this.HasProp("__OnOpening")){
                this.__OnOpening := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnOpeningToken := this.add_Opening(this.__OnOpening.iface)
            }
            return this.__OnOpening
        }
    }

    /**
     * Occurs when the [AppBar](appbar.md) starts to change from visible to hidden.
     * @type {EventHandler<IInspectable>}
    */
    OnClosing {
        get {
            if(!this.HasProp("__OnClosing")){
                this.__OnClosing := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnClosingToken := this.add_Closing(this.__OnClosing.iface)
            }
            return this.__OnClosing
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnOpeningToken")) {
            this.remove_Opening(this.__OnOpeningToken)
            this.__OnOpening.iface.Dispose()
        }

        if(this.HasProp("__OnClosingToken")) {
            this.remove_Closing(this.__OnClosingToken)
            this.__OnClosing.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.get_IsOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOpen(value) {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.put_IsOpen(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSticky() {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.get_IsSticky()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSticky(value) {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.put_IsSticky(value)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.remove_Opened(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IAppBar")) {
            if ((queryResult := this.QueryInterface(IAppBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar := IAppBar(outPtr)
        }

        return this.__IAppBar.remove_Closed(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClosedDisplayMode() {
        if (!this.HasProp("__IAppBar2")) {
            if ((queryResult := this.QueryInterface(IAppBar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar2 := IAppBar2(outPtr)
        }

        return this.__IAppBar2.get_ClosedDisplayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClosedDisplayMode(value) {
        if (!this.HasProp("__IAppBar2")) {
            if ((queryResult := this.QueryInterface(IAppBar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar2 := IAppBar2(outPtr)
        }

        return this.__IAppBar2.put_ClosedDisplayMode(value)
    }

    /**
     * 
     * @returns {AppBarTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IAppBar3")) {
            if ((queryResult := this.QueryInterface(IAppBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar3 := IAppBar3(outPtr)
        }

        return this.__IAppBar3.get_TemplateSettings()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opening(handler) {
        if (!this.HasProp("__IAppBar3")) {
            if ((queryResult := this.QueryInterface(IAppBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar3 := IAppBar3(outPtr)
        }

        return this.__IAppBar3.add_Opening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opening(token) {
        if (!this.HasProp("__IAppBar3")) {
            if ((queryResult := this.QueryInterface(IAppBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar3 := IAppBar3(outPtr)
        }

        return this.__IAppBar3.remove_Opening(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        if (!this.HasProp("__IAppBar3")) {
            if ((queryResult := this.QueryInterface(IAppBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar3 := IAppBar3(outPtr)
        }

        return this.__IAppBar3.add_Closing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closing(token) {
        if (!this.HasProp("__IAppBar3")) {
            if ((queryResult := this.QueryInterface(IAppBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar3 := IAppBar3(outPtr)
        }

        return this.__IAppBar3.remove_Closing(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__IAppBar4")) {
            if ((queryResult := this.QueryInterface(IAppBar4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar4 := IAppBar4(outPtr)
        }

        return this.__IAppBar4.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__IAppBar4")) {
            if ((queryResult := this.QueryInterface(IAppBar4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBar4 := IAppBar4(outPtr)
        }

        return this.__IAppBar4.put_LightDismissOverlayMode(value)
    }

    /**
     * Invoked when the [AppBar](appbar.md) changes from visible to hidden.
     * @param {IInspectable} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.onclosed
     */
    OnClosed(e) {
        if (!this.HasProp("__IAppBarOverrides")) {
            if ((queryResult := this.QueryInterface(IAppBarOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarOverrides := IAppBarOverrides(outPtr)
        }

        return this.__IAppBarOverrides.OnClosed(e)
    }

    /**
     * Invoked when the [AppBar](appbar.md) changes from hidden to visible, or is first displayed.
     * @param {IInspectable} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.onopened
     */
    OnOpened(e) {
        if (!this.HasProp("__IAppBarOverrides")) {
            if ((queryResult := this.QueryInterface(IAppBarOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarOverrides := IAppBarOverrides(outPtr)
        }

        return this.__IAppBarOverrides.OnOpened(e)
    }

    /**
     * Invoked when the [AppBar](appbar.md) starts to change from visible to hidden.
     * @param {IInspectable} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.onclosing
     */
    OnClosing(e) {
        if (!this.HasProp("__IAppBarOverrides3")) {
            if ((queryResult := this.QueryInterface(IAppBarOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarOverrides3 := IAppBarOverrides3(outPtr)
        }

        return this.__IAppBarOverrides3.OnClosing(e)
    }

    /**
     * Invoked when the [AppBar](appbar.md) starts to change from hidden to visible, or starts to be first displayed.
     * @param {IInspectable} e Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbar.onopening
     */
    OnOpening(e) {
        if (!this.HasProp("__IAppBarOverrides3")) {
            if ((queryResult := this.QueryInterface(IAppBarOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarOverrides3 := IAppBarOverrides3(outPtr)
        }

        return this.__IAppBarOverrides3.OnOpening(e)
    }

;@endregion Instance Methods
}
