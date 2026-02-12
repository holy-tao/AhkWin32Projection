#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\ILeavingBackgroundEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is about to stop running in the background.
 * @remarks
 * This object is accessed when you implement [WebUIApplication.LeavingBackgroundEventHandler](leavingbackgroundeventhandler.md) to respond to [WebUIApplication.leavingbackground](webuiapplication_leavingbackground.md) events.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.leavingbackgroundeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class LeavingBackgroundEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILeavingBackgroundEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILeavingBackgroundEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Requests a delay before the app stops running in the background.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.leavingbackgroundeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ILeavingBackgroundEventArgs")) {
            if ((queryResult := this.QueryInterface(ILeavingBackgroundEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILeavingBackgroundEventArgs := ILeavingBackgroundEventArgs(outPtr)
        }

        return this.__ILeavingBackgroundEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
