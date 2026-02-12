#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowTabManager.ahk
#Include .\IWindowTabManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WindowTabManager.ahk
#Include .\WindowTabSwitchRequestedEventArgs.ahk
#Include .\WindowTabCloseRequestedEventArgs.ahk
#Include .\WindowTabTearOutRequestedEventArgs.ahk
#Include .\WindowTabThumbnailRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Lets an app manage the relationship between its in-app UI tabs and representations of the tabs in the system shell UI.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * 
 * If your app uses visual tabs to organize and separate content, you can use `WindowTabManager` to expose those tabs in system shell UI for easier access.
 * 
 * The `WindowTabManager` lets an app share information about its in-app tab views to the Windows shell. How the shell chooses to respond to the information, if at all, is at the shell's discretion. (In other words, the implementation may be inert on some shells.)
 * 
 * `WindowsTabManager` stores the list of tabs the app wants the Windows shell to know about and lets the app indicate which one is the currently active tab. The app can also provide information about the tab's title, icon, grouping, and if they are associated with an alternative application id.
 * 
 * `WindowsTabManager` also provides events that the app can subscribe to in order to react to Windows shell-triggered interactions with its tabs; for example, switching to a different tab, closing a tab, or knowing that a preview of a tab is displayed.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabmanager
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTabManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTabManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTabManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves an instance of `WindowTabManager` associated with the specified window.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {WindowId} id The `WindowId` of the window to retrieve the `WindowTabManager` for.
     * @returns {WindowTabManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabmanager.getforwindow
     */
    static GetForWindow(id) {
        if (!WindowTabManager.HasProp("__IWindowTabManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTabManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowTabManagerStatics.IID)
            WindowTabManager.__IWindowTabManagerStatics := IWindowTabManagerStatics(factoryPtr)
        }

        return WindowTabManager.__IWindowTabManagerStatics.GetForWindow(id)
    }

    /**
     * Gets a value that indicates whether tab management is supported by the current system shell.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * Call `IsSupported` to ensure that tab management is supported by the current system shell before you call [GetForWindow](windowtabmanager_issupported_930300905.md) to request an instance of `WindowTabManager`.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabmanager.issupported
     */
    static IsSupported() {
        if (!WindowTabManager.HasProp("__IWindowTabManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTabManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowTabManagerStatics.IID)
            WindowTabManager.__IWindowTabManagerStatics := IWindowTabManagerStatics(factoryPtr)
        }

        return WindowTabManager.__IWindowTabManagerStatics.IsSupported()
    }

    /**
     * Gets a value that indicates whether the current system shell supports tearing a tab out into a separate window.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * Call `IsTabTearOutSupported` before subscribing to the [TabTearOutRequested](windowtabmanager_tabtearoutrequested.md) event and subscribe only if it returns `true`.
     * 
     * This method indicates only whether the system supports surfaces that can request tab tear out, such as Snap Assist. If your app does not support tab tear out, its tabs will not show in Snap Assist.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabmanager.istabtearoutsupported
     */
    static IsTabTearOutSupported() {
        if (!WindowTabManager.HasProp("__IWindowTabManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTabManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowTabManagerStatics.IID)
            WindowTabManager.__IWindowTabManagerStatics := IWindowTabManagerStatics(factoryPtr)
        }

        return WindowTabManager.__IWindowTabManagerStatics.IsTabTearOutSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of tabs managed by this tab manager.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabmanager.tabs
     * @type {WindowTabCollection} 
     */
    Tabs {
        get => this.get_Tabs()
    }

    /**
     * Occurs when a tab is switched to from a system shell surface.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * Handle this event to make the tab that has been switched to the active tab in your app.
     * @type {TypedEventHandler<WindowTabManager, WindowTabSwitchRequestedEventArgs>}
    */
    OnTabSwitchRequested {
        get {
            if(!this.HasProp("__OnTabSwitchRequested")){
                this.__OnTabSwitchRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{92487ba4-93a1-5258-83a0-8bc055e89a25}"),
                    WindowTabManager,
                    WindowTabSwitchRequestedEventArgs
                )
                this.__OnTabSwitchRequestedToken := this.add_TabSwitchRequested(this.__OnTabSwitchRequested.iface)
            }
            return this.__OnTabSwitchRequested
        }
    }

    /**
     * Occurs when a tab is closed from a system shell surface.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * Handle this event to close the tab in your app.
     * @type {TypedEventHandler<WindowTabManager, WindowTabCloseRequestedEventArgs>}
    */
    OnTabCloseRequested {
        get {
            if(!this.HasProp("__OnTabCloseRequested")){
                this.__OnTabCloseRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{963aec04-63d6-5d5f-b18d-785ca3d6850b}"),
                    WindowTabManager,
                    WindowTabCloseRequestedEventArgs
                )
                this.__OnTabCloseRequestedToken := this.add_TabCloseRequested(this.__OnTabCloseRequested.iface)
            }
            return this.__OnTabCloseRequested
        }
    }

    /**
     * Occurs when the system shell requests a separate window for a specific tab.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * A tab tear out request can happen when tabs show in the Snap Assist tool and the user chooses to have a specific tab snapped in a different window.
     * 
     * Not all versions of Windows support the scenarios that raise this event, so call [IsTabTearOutSupported](windowtabmanager_istabtearoutsupported_716001682.md) before subscribing to the `TabTearOutRequested` event and subscribe only if it returns `true`.
     * 
     * If your app does not support tab tear out, its tabs will not show in Snap Assist.
     * @type {TypedEventHandler<WindowTabManager, WindowTabTearOutRequestedEventArgs>}
    */
    OnTabTearOutRequested {
        get {
            if(!this.HasProp("__OnTabTearOutRequested")){
                this.__OnTabTearOutRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9771fcc2-90a8-5353-8a7f-fc1ce40923cb}"),
                    WindowTabManager,
                    WindowTabTearOutRequestedEventArgs
                )
                this.__OnTabTearOutRequestedToken := this.add_TabTearOutRequested(this.__OnTabTearOutRequested.iface)
            }
            return this.__OnTabTearOutRequested
        }
    }

    /**
     * Occurs when the system shows a tab in a shell surface that displays a thumbnail view, as a signal to the app to generate a current thumbnail.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * The thumbnail generated in response to this event should be set as the value of the [WindowTabThumbnailRequestedEventArgs.Image](windowtabthumbnailrequestedeventargs_image.md) property. Call [WindowTab.ReportThumbnailAvailable](windowtab_reportthumbnailavailable_1990248161.md) to notify the system that the new thumbnail image is ready.
     * @type {TypedEventHandler<WindowTabManager, WindowTabThumbnailRequestedEventArgs>}
    */
    OnTabThumbnailRequested {
        get {
            if(!this.HasProp("__OnTabThumbnailRequested")){
                this.__OnTabThumbnailRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f07b88f9-f897-5ce5-9d2a-54778447fbdb}"),
                    WindowTabManager,
                    WindowTabThumbnailRequestedEventArgs
                )
                this.__OnTabThumbnailRequestedToken := this.add_TabThumbnailRequested(this.__OnTabThumbnailRequested.iface)
            }
            return this.__OnTabThumbnailRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTabSwitchRequestedToken")) {
            this.remove_TabSwitchRequested(this.__OnTabSwitchRequestedToken)
            this.__OnTabSwitchRequested.iface.Dispose()
        }

        if(this.HasProp("__OnTabCloseRequestedToken")) {
            this.remove_TabCloseRequested(this.__OnTabCloseRequestedToken)
            this.__OnTabCloseRequested.iface.Dispose()
        }

        if(this.HasProp("__OnTabTearOutRequestedToken")) {
            this.remove_TabTearOutRequested(this.__OnTabTearOutRequestedToken)
            this.__OnTabTearOutRequested.iface.Dispose()
        }

        if(this.HasProp("__OnTabThumbnailRequestedToken")) {
            this.remove_TabThumbnailRequested(this.__OnTabThumbnailRequestedToken)
            this.__OnTabThumbnailRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {WindowTabCollection} 
     */
    get_Tabs() {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.get_Tabs()
    }

    /**
     * Notifies the system to make the specified tab the active tab.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {WindowTab} tab The window tab to make active.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabmanager.setactivetab
     */
    SetActiveTab(tab) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.SetActiveTab(tab)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabSwitchRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabSwitchRequested(handler) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.add_TabSwitchRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TabSwitchRequested(token) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.remove_TabSwitchRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabCloseRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabCloseRequested(handler) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.add_TabCloseRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TabCloseRequested(token) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.remove_TabCloseRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabTearOutRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabTearOutRequested(handler) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.add_TabTearOutRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TabTearOutRequested(token) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.remove_TabTearOutRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabThumbnailRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabThumbnailRequested(handler) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.add_TabThumbnailRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TabThumbnailRequested(token) {
        if (!this.HasProp("__IWindowTabManager")) {
            if ((queryResult := this.QueryInterface(IWindowTabManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabManager := IWindowTabManager(outPtr)
        }

        return this.__IWindowTabManager.remove_TabThumbnailRequested(token)
    }

;@endregion Instance Methods
}
