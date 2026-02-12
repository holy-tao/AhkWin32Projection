#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowCloseRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the AppWindow.CloseRequested event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowcloserequestedeventargs
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowCloseRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowCloseRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowCloseRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the close operation should be canceled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowcloserequestedeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
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
    get_Cancel() {
        if (!this.HasProp("__IAppWindowCloseRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowCloseRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowCloseRequestedEventArgs := IAppWindowCloseRequestedEventArgs(outPtr)
        }

        return this.__IAppWindowCloseRequestedEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IAppWindowCloseRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowCloseRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowCloseRequestedEventArgs := IAppWindowCloseRequestedEventArgs(outPtr)
        }

        return this.__IAppWindowCloseRequestedEventArgs.put_Cancel(value)
    }

    /**
     * Gets a deferral object for managing asynchronous work done in the CloseRequested event handler.
     * @remarks
     * A deferral should be used if any asynchronous work is being done in the CloseRequested event handler, so that the next event in the sequence isn't raised until this work is completed.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowcloserequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppWindowCloseRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowCloseRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowCloseRequestedEventArgs := IAppWindowCloseRequestedEventArgs(outPtr)
        }

        return this.__IAppWindowCloseRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
