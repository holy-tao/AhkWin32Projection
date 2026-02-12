#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattSubscribedClient.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattSubscribedClient.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class represents a subscribed client of a GATT session.
 * @remarks
 * Also see [Send notifications to subscribed clients](/windows/uwp/devices-sensors/gatt-server#send-notifications-to-subscribed-clients).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsubscribedclient
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattSubscribedClient extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattSubscribedClient

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattSubscribedClient.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the session of the subscribed client.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsubscribedclient.session
     * @type {GattSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets the max notification size.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsubscribedclient.maxnotificationsize
     * @type {Integer} 
     */
    MaxNotificationSize {
        get => this.get_MaxNotificationSize()
    }

    /**
     * An event that is triggered when the max notification size has changed.
     * @type {TypedEventHandler<GattSubscribedClient, IInspectable>}
    */
    OnMaxNotificationSizeChanged {
        get {
            if(!this.HasProp("__OnMaxNotificationSizeChanged")){
                this.__OnMaxNotificationSizeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9c17a110-806d-594b-b33d-ed280bbf27e5}"),
                    GattSubscribedClient,
                    IInspectable
                )
                this.__OnMaxNotificationSizeChangedToken := this.add_MaxNotificationSizeChanged(this.__OnMaxNotificationSizeChanged.iface)
            }
            return this.__OnMaxNotificationSizeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMaxNotificationSizeChangedToken")) {
            this.remove_MaxNotificationSizeChanged(this.__OnMaxNotificationSizeChangedToken)
            this.__OnMaxNotificationSizeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {GattSession} 
     */
    get_Session() {
        if (!this.HasProp("__IGattSubscribedClient")) {
            if ((queryResult := this.QueryInterface(IGattSubscribedClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSubscribedClient := IGattSubscribedClient(outPtr)
        }

        return this.__IGattSubscribedClient.get_Session()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxNotificationSize() {
        if (!this.HasProp("__IGattSubscribedClient")) {
            if ((queryResult := this.QueryInterface(IGattSubscribedClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSubscribedClient := IGattSubscribedClient(outPtr)
        }

        return this.__IGattSubscribedClient.get_MaxNotificationSize()
    }

    /**
     * 
     * @param {TypedEventHandler<GattSubscribedClient, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MaxNotificationSizeChanged(handler) {
        if (!this.HasProp("__IGattSubscribedClient")) {
            if ((queryResult := this.QueryInterface(IGattSubscribedClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSubscribedClient := IGattSubscribedClient(outPtr)
        }

        return this.__IGattSubscribedClient.add_MaxNotificationSizeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MaxNotificationSizeChanged(token) {
        if (!this.HasProp("__IGattSubscribedClient")) {
            if ((queryResult := this.QueryInterface(IGattSubscribedClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSubscribedClient := IGattSubscribedClient(outPtr)
        }

        return this.__IGattSubscribedClient.remove_MaxNotificationSizeChanged(token)
    }

;@endregion Instance Methods
}
