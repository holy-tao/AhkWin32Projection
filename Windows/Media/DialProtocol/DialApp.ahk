#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialApp.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a DIAL application running on a remote device.
 * @remarks
 * Get an instance of this class by accessing the [GetDialApp](dialdevice_getdialapp_1997105867.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapp
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialApp extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialApp

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialApp.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the application's registered DIAL name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapp.appname
     * @type {HSTRING} 
     */
    AppName {
        get => this.get_AppName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppName() {
        if (!this.HasProp("__IDialApp")) {
            if ((queryResult := this.QueryInterface(IDialApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialApp := IDialApp(outPtr)
        }

        return this.__IDialApp.get_AppName()
    }

    /**
     * Initiates the launching of the app on the remote device. When this method is called, the [DialDevice](dialdevice.md) is paired if necessary, the user is prompted to allow access to the device, connection is established, app existence is validated on the device, and finally the application is launched with the provided argument.
     * @remarks
     * This method must be called from the UI thread or an exception will be thrown. To dispatch the call to the UI thread from another thread, you can use [CoreDispatcher.RunAsync](../windows.ui.core/coredispatcher_runasync_447339746.md).
     * @param {HSTRING} appArgument Optional.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapp.requestlaunchasync
     */
    RequestLaunchAsync(appArgument) {
        if (!this.HasProp("__IDialApp")) {
            if ((queryResult := this.QueryInterface(IDialApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialApp := IDialApp(outPtr)
        }

        return this.__IDialApp.RequestLaunchAsync(appArgument)
    }

    /**
     * Stops the app on the remote device, if the remote device supports this functionality.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapp.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__IDialApp")) {
            if ((queryResult := this.QueryInterface(IDialApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialApp := IDialApp(outPtr)
        }

        return this.__IDialApp.StopAsync()
    }

    /**
     * Gets the current status of the application on the remote device.
     * @returns {IAsyncOperation<DialAppStateDetails>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapp.getappstateasync
     */
    GetAppStateAsync() {
        if (!this.HasProp("__IDialApp")) {
            if ((queryResult := this.QueryInterface(IDialApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialApp := IDialApp(outPtr)
        }

        return this.__IDialApp.GetAppStateAsync()
    }

;@endregion Instance Methods
}
