#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the AppWindow.Changed event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the available window presentations changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.didavailablewindowpresentationschange
     * @type {Boolean} 
     */
    DidAvailableWindowPresentationsChange {
        get => this.get_DidAvailableWindowPresentationsChange()
    }

    /**
     * Gets a value that indicates whether the display regions changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.diddisplayregionschange
     * @type {Boolean} 
     */
    DidDisplayRegionsChange {
        get => this.get_DidDisplayRegionsChange()
    }

    /**
     * Gets a value that indicates whether one or more properties of the AppWindow.Frame has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.didframechange
     * @type {Boolean} 
     */
    DidFrameChange {
        get => this.get_DidFrameChange()
    }

    /**
     * Gets a value that indicates whether the size of the app window changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.didsizechange
     * @type {Boolean} 
     */
    DidSizeChange {
        get => this.get_DidSizeChange()
    }

    /**
     * Gets a value that indicates whether one or more properties of the AppWindow.TitleBar has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.didtitlebarchange
     * @type {Boolean} 
     */
    DidTitleBarChange {
        get => this.get_DidTitleBarChange()
    }

    /**
     * Gets a value that indicates whether the AppWindow.IsVisible property changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.didvisibilitychange
     * @type {Boolean} 
     */
    DidVisibilityChange {
        get => this.get_DidVisibilityChange()
    }

    /**
     * Gets a value that indicates whether the AppWindow.WindowingEnvironment property changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.didwindowingenvironmentchange
     * @type {Boolean} 
     */
    DidWindowingEnvironmentChange {
        get => this.get_DidWindowingEnvironmentChange()
    }

    /**
     * Gets a value that indicates whether the applied window presentation has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowchangedeventargs.didwindowpresentationchange
     * @type {Boolean} 
     */
    DidWindowPresentationChange {
        get => this.get_DidWindowPresentationChange()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidAvailableWindowPresentationsChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidAvailableWindowPresentationsChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidDisplayRegionsChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidDisplayRegionsChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidFrameChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidFrameChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidSizeChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidSizeChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidTitleBarChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidTitleBarChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidVisibilityChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidVisibilityChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidWindowingEnvironmentChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidWindowingEnvironmentChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidWindowPresentationChange() {
        if (!this.HasProp("__IAppWindowChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowChangedEventArgs := IAppWindowChangedEventArgs(outPtr)
        }

        return this.__IAppWindowChangedEventArgs.get_DidWindowPresentationChange()
    }

;@endregion Instance Methods
}
