#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastingUI.ahk
#Include .\IAppBroadcastingUIStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables an app to launch the app broadcasting system setup UI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingui
 * @namespace Windows.Media.AppBroadcasting
 * @version WindowsRuntime 1.4
 */
class AppBroadcastingUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastingUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastingUI.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of the **AppBroadcastingUI** class that is associated with the user currently signed in to the device.
     * @remarks
     * Use this method platforms where there is a single user associated with a single session, such as a Windows PC.
     * @returns {AppBroadcastingUI} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingui.getdefault
     */
    static GetDefault() {
        if (!AppBroadcastingUI.HasProp("__IAppBroadcastingUIStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.AppBroadcasting.AppBroadcastingUI")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastingUIStatics.IID)
            AppBroadcastingUI.__IAppBroadcastingUIStatics := IAppBroadcastingUIStatics(factoryPtr)
        }

        return AppBroadcastingUI.__IAppBroadcastingUIStatics.GetDefault()
    }

    /**
     * Gets an instance of the **AppBroadcastingUI** class that is associated with the specified user.
     * @remarks
     * Use this method platforms where there a multiple users associated with a single session, such as XBox.
     * @param {User} user_ The user for which the **AppBroadcastingUI** instance is created.
     * @returns {AppBroadcastingUI} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingui.getforuser
     */
    static GetForUser(user_) {
        if (!AppBroadcastingUI.HasProp("__IAppBroadcastingUIStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.AppBroadcasting.AppBroadcastingUI")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastingUIStatics.IID)
            AppBroadcastingUI.__IAppBroadcastingUIStatics := IAppBroadcastingUIStatics(factoryPtr)
        }

        return AppBroadcastingUI.__IAppBroadcastingUIStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets an object that allows an app to determine if it can currently begin broadcasting and, if not, obtain details about the reason that broadcasting can't be initiated.
     * @returns {AppBroadcastingStatus} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingui.getstatus
     */
    GetStatus() {
        if (!this.HasProp("__IAppBroadcastingUI")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingUI := IAppBroadcastingUI(outPtr)
        }

        return this.__IAppBroadcastingUI.GetStatus()
    }

    /**
     * Shows the app broadcasting system setup UI.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingui.showbroadcastui
     */
    ShowBroadcastUI() {
        if (!this.HasProp("__IAppBroadcastingUI")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingUI := IAppBroadcastingUI(outPtr)
        }

        return this.__IAppBroadcastingUI.ShowBroadcastUI()
    }

;@endregion Instance Methods
}
