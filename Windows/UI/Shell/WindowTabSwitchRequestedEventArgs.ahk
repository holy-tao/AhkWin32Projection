#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowTabSwitchRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the `WindowTabManager.TabSwitchRequested` event.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabswitchrequestedeventargs
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTabSwitchRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTabSwitchRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTabSwitchRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the window tab to switch to.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabswitchrequestedeventargs.tab
     * @type {WindowTab} 
     */
    Tab {
        get => this.get_Tab()
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
        if (!this.HasProp("__IWindowTabSwitchRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabSwitchRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabSwitchRequestedEventArgs := IWindowTabSwitchRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabSwitchRequestedEventArgs.get_Tab()
    }

;@endregion Instance Methods
}
