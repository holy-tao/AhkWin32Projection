#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastingStatus.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows an app to determine if it can currently begin broadcasting and, if not, obtain details about the reason that broadcasting can't be initiated.
 * @remarks
 * Can an instance of this class by calling the [GetStatus](appbroadcastingui_getstatus_169641651.md) method of the [AppBroadcastingUI](appbroadcastingui.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatus
 * @namespace Windows.Media.AppBroadcasting
 * @version WindowsRuntime 1.4
 */
class AppBroadcastingStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastingStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastingStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the current app can begin broadcasting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatus.canstartbroadcast
     * @type {Boolean} 
     */
    CanStartBroadcast {
        get => this.get_CanStartBroadcast()
    }

    /**
     * Gets an [AppBroadcastingStatusDetails](appbroadcastingstatusdetails.md) object that provides detailed information indicating why the current app can't currently begin broadcasting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatus.details
     * @type {AppBroadcastingStatusDetails} 
     */
    Details {
        get => this.get_Details()
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
    get_CanStartBroadcast() {
        if (!this.HasProp("__IAppBroadcastingStatus")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatus := IAppBroadcastingStatus(outPtr)
        }

        return this.__IAppBroadcastingStatus.get_CanStartBroadcast()
    }

    /**
     * 
     * @returns {AppBroadcastingStatusDetails} 
     */
    get_Details() {
        if (!this.HasProp("__IAppBroadcastingStatus")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatus := IAppBroadcastingStatus(outPtr)
        }

        return this.__IAppBroadcastingStatus.get_Details()
    }

;@endregion Instance Methods
}
