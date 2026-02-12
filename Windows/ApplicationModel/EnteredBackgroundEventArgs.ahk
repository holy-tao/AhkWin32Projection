#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEnteredBackgroundEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Gets the deferral object when an app has entered the background state.
 * @remarks
 * This object is passed to the app's entered background event handler.
 * 
 * > [!TIP]
 * > By the time an app enters the background state, none of its UI is visible.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.enteredbackgroundeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class EnteredBackgroundEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEnteredBackgroundEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEnteredBackgroundEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Requests a delay before the app begins running in the background.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.enteredbackgroundeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEnteredBackgroundEventArgs")) {
            if ((queryResult := this.QueryInterface(IEnteredBackgroundEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnteredBackgroundEventArgs := IEnteredBackgroundEventArgs(outPtr)
        }

        return this.__IEnteredBackgroundEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
