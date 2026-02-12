#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreApplicationViewTitleBar.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreApplicationViewTitleBar.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables an app to define a custom title bar that displays in the app's window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationviewtitlebar
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class CoreApplicationViewTitleBar extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreApplicationViewTitleBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreApplicationViewTitleBar.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies whether this title bar should replace the default window title bar.
     * @remarks
     * The first time the app runs, and for secondary views, the default value is **false**. For the main view of an app, this value persists between application runs.
     * 
     * When **ExtendViewIntoTitleBar** is true, the view's content will extend by **CoreApplicationViewTitleBar.Height** into the title bar region. The region will still be treated like a title bar, meaning you can still drag the window with it, double-click to maximize, and right-click to bring up the system menu. For this reason, you should avoid putting pointer-interactive content in the region. However, if you call Window.SetTitleBar to set a Xaml element as the title bar, the unclickable region is removed and it is no longer necessary to avoid putting pointer-interactive content in the region.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationviewtitlebar.extendviewintotitlebar
     * @type {Boolean} 
     */
    ExtendViewIntoTitleBar {
        get => this.get_ExtendViewIntoTitleBar()
        set => this.put_ExtendViewIntoTitleBar(value)
    }

    /**
     * Gets the width of the system-reserved region of the upper-left corner of the app window. This region is reserved when the current language is a right-to-left language.
     * @remarks
     * For applications with custom title bars, the system reserves the option to have system UI drawn in the upper-left or upper-right corner of the app window. The system draws caption buttons in the upper-right for left-to-right languages and the upper-left for right-to-left languages. The width of the reserved region on each side is given by SystemOverlayLeftInset or [SystemOverlayRightInset](coreapplicationviewtitlebar_systemoverlayrightinset.md), and its height is given by [CoreApplicationViewTitleBar.Height](coreapplicationviewtitlebar_height.md). In the areas described by these regions, apps should not put any UI which they expect the user to be able to interact with.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationviewtitlebar.systemoverlayleftinset
     * @type {Float} 
     */
    SystemOverlayLeftInset {
        get => this.get_SystemOverlayLeftInset()
    }

    /**
     * Gets the width of the system-reserved region of the upper-right corner of the app window. This region is reserved when the current language is a left-to-right language.
     * @remarks
     * For applications with custom title bars, the system reserves the option to have system UI drawn in the upper-left or upper-right corner of the app window. The system draws caption buttons in the upper-right for left-to-right languages and the upper-left for right-to-left languages. The width of the reserved region on each side is given by [SystemOverlayLeftInset](coreapplicationviewtitlebar_systemoverlayleftinset.md) or SystemOverlayRightInset, and its height is given by [CoreApplicationViewTitleBar.Height](coreapplicationviewtitlebar_height.md). In the areas described by these regions, apps should not put any UI which they expect the user to be able to interact with.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationviewtitlebar.systemoverlayrightinset
     * @type {Float} 
     */
    SystemOverlayRightInset {
        get => this.get_SystemOverlayRightInset()
    }

    /**
     * Gets the height of the title bar.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationviewtitlebar.height
     * @type {Float} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets a value that specifies whether this title bar is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplicationviewtitlebar.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

    /**
     * Occurs when the title bar needs to respond to size changes. The most common trigger for this event is when the app window moves to a screen that has a different DPI. Use this event to verify and update the positioning of UI elements that depend on the title bar's size.
     * @type {TypedEventHandler<CoreApplicationViewTitleBar, IInspectable>}
    */
    OnLayoutMetricsChanged {
        get {
            if(!this.HasProp("__OnLayoutMetricsChanged")){
                this.__OnLayoutMetricsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{28342e21-dad3-5e32-bae1-afe7b26c66fb}"),
                    CoreApplicationViewTitleBar,
                    IInspectable
                )
                this.__OnLayoutMetricsChangedToken := this.add_LayoutMetricsChanged(this.__OnLayoutMetricsChanged.iface)
            }
            return this.__OnLayoutMetricsChanged
        }
    }

    /**
     * Occurs when the visibility of the title bar (indicated by the [IsVisible](coreapplicationviewtitlebar_isvisible.md) property) changes.
     * @type {TypedEventHandler<CoreApplicationViewTitleBar, IInspectable>}
    */
    OnIsVisibleChanged {
        get {
            if(!this.HasProp("__OnIsVisibleChanged")){
                this.__OnIsVisibleChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{28342e21-dad3-5e32-bae1-afe7b26c66fb}"),
                    CoreApplicationViewTitleBar,
                    IInspectable
                )
                this.__OnIsVisibleChangedToken := this.add_IsVisibleChanged(this.__OnIsVisibleChanged.iface)
            }
            return this.__OnIsVisibleChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLayoutMetricsChangedToken")) {
            this.remove_LayoutMetricsChanged(this.__OnLayoutMetricsChangedToken)
            this.__OnLayoutMetricsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnIsVisibleChangedToken")) {
            this.remove_IsVisibleChanged(this.__OnIsVisibleChangedToken)
            this.__OnIsVisibleChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExtendViewIntoTitleBar(value) {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.put_ExtendViewIntoTitleBar(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExtendViewIntoTitleBar() {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.get_ExtendViewIntoTitleBar()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SystemOverlayLeftInset() {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.get_SystemOverlayLeftInset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SystemOverlayRightInset() {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.get_SystemOverlayRightInset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Height() {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.get_Height()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationViewTitleBar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LayoutMetricsChanged(handler) {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.add_LayoutMetricsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LayoutMetricsChanged(token) {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.remove_LayoutMetricsChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.get_IsVisible()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationViewTitleBar, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsVisibleChanged(handler) {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.add_IsVisibleChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsVisibleChanged(token) {
        if (!this.HasProp("__ICoreApplicationViewTitleBar")) {
            if ((queryResult := this.QueryInterface(ICoreApplicationViewTitleBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreApplicationViewTitleBar := ICoreApplicationViewTitleBar(outPtr)
        }

        return this.__ICoreApplicationViewTitleBar.remove_IsVisibleChanged(token)
    }

;@endregion Instance Methods
}
