#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILeavingBackgroundEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Gets the deferral object when the app is leaving the background state.
 * @remarks
 * This object is passed to the app's leaving background event handler.
 * 
 * > [!TIP]
 * > This event is raised before any UI is shown and is a good place to ensure that any assets that you load programmatically are ready so that the UI will be presented correctly.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.leavingbackgroundeventargs
 * @namespace Windows.ApplicationModel
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
