#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastingMonitor.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastingMonitor.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Allows an app to determine if it is currently being broadcast and to receive an event when the app starts or stops broadcasting.
 * @remarks
 * An app can use this class to show or hide UI elements that indicate that the app is currently broadcasting.
 * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingmonitor
 * @namespace Windows.Media.AppBroadcasting
 * @version WindowsRuntime 1.4
 */
class AppBroadcastingMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastingMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastingMonitor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the current app is currently broadcasting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingmonitor.iscurrentappbroadcasting
     * @type {Boolean} 
     */
    IsCurrentAppBroadcasting {
        get => this.get_IsCurrentAppBroadcasting()
    }

    /**
     * Occurs when the current broadcasting state of the current app changes.
     * @remarks
     * In the handler for this event, check the **IsCurrentAppBroadcasting** property of the **AppBroadcastingMonitor** object passed as the event sender to determine if the current app is currently broadcasting.
     * @type {TypedEventHandler<AppBroadcastingMonitor, IInspectable>}
    */
    OnIsCurrentAppBroadcastingChanged {
        get {
            if(!this.HasProp("__OnIsCurrentAppBroadcastingChanged")){
                this.__OnIsCurrentAppBroadcastingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{dc64118b-04f9-5161-a7c0-e6a96070a8d1}"),
                    AppBroadcastingMonitor,
                    IInspectable
                )
                this.__OnIsCurrentAppBroadcastingChangedToken := this.add_IsCurrentAppBroadcastingChanged(this.__OnIsCurrentAppBroadcastingChanged.iface)
            }
            return this.__OnIsCurrentAppBroadcastingChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **AppBroadcastingMonitor** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.AppBroadcasting.AppBroadcastingMonitor")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsCurrentAppBroadcastingChangedToken")) {
            this.remove_IsCurrentAppBroadcastingChanged(this.__OnIsCurrentAppBroadcastingChangedToken)
            this.__OnIsCurrentAppBroadcastingChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentAppBroadcasting() {
        if (!this.HasProp("__IAppBroadcastingMonitor")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingMonitor := IAppBroadcastingMonitor(outPtr)
        }

        return this.__IAppBroadcastingMonitor.get_IsCurrentAppBroadcasting()
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastingMonitor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsCurrentAppBroadcastingChanged(handler) {
        if (!this.HasProp("__IAppBroadcastingMonitor")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingMonitor := IAppBroadcastingMonitor(outPtr)
        }

        return this.__IAppBroadcastingMonitor.add_IsCurrentAppBroadcastingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsCurrentAppBroadcastingChanged(token) {
        if (!this.HasProp("__IAppBroadcastingMonitor")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingMonitor := IAppBroadcastingMonitor(outPtr)
        }

        return this.__IAppBroadcastingMonitor.remove_IsCurrentAppBroadcastingChanged(token)
    }

;@endregion Instance Methods
}
