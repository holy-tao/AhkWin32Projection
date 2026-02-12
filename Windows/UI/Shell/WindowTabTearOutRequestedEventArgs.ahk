#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowTabTearOutRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the `WindowTabManager.TabTearOutRequested` event.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabtearoutrequestedeventargs
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTabTearOutRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTabTearOutRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTabTearOutRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the window tab that should be moved to a new window.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabtearoutrequestedeventargs.tab
     * @type {WindowTab} 
     */
    Tab {
        get => this.get_Tab()
    }

    /**
     * Gets or sets the identifier for the new window that the tab is moved to.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabtearoutrequestedeventargs.windowid
     * @type {Integer} 
     */
    WindowId {
        get => this.get_WindowId()
        set => this.put_WindowId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowTab} 
     */
    get_Tab() {
        if (!this.HasProp("__IWindowTabTearOutRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabTearOutRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabTearOutRequestedEventArgs := IWindowTabTearOutRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabTearOutRequestedEventArgs.get_Tab()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WindowId() {
        if (!this.HasProp("__IWindowTabTearOutRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabTearOutRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabTearOutRequestedEventArgs := IWindowTabTearOutRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabTearOutRequestedEventArgs.get_WindowId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WindowId(value) {
        if (!this.HasProp("__IWindowTabTearOutRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabTearOutRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabTearOutRequestedEventArgs := IWindowTabTearOutRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabTearOutRequestedEventArgs.put_WindowId(value)
    }

    /**
     * Gets a deferral object that delays the completion of the event until a new window is created for the tab.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabtearoutrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IWindowTabTearOutRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabTearOutRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabTearOutRequestedEventArgs := IWindowTabTearOutRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabTearOutRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
