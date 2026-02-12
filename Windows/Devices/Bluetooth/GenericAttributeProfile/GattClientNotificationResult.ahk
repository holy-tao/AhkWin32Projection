#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattClientNotificationResult.ahk
#Include .\IGattClientNotificationResult2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The result of [NotifyValueAsync](gattlocalcharacteristic_notifyvalueasync_483273373.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattclientnotificationresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattClientNotificationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattClientNotificationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattClientNotificationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the subscribed client.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattclientnotificationresult.subscribedclient
     * @type {GattSubscribedClient} 
     */
    SubscribedClient {
        get => this.get_SubscribedClient()
    }

    /**
     * Gets the GATT communication status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattclientnotificationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the protocol error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattclientnotificationresult.protocolerror
     * @type {IReference<Integer>} 
     */
    ProtocolError {
        get => this.get_ProtocolError()
    }

    /**
     * Gets the bytes that were sent.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattclientnotificationresult.bytessent
     * @type {Integer} 
     */
    BytesSent {
        get => this.get_BytesSent()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GattSubscribedClient} 
     */
    get_SubscribedClient() {
        if (!this.HasProp("__IGattClientNotificationResult")) {
            if ((queryResult := this.QueryInterface(IGattClientNotificationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattClientNotificationResult := IGattClientNotificationResult(outPtr)
        }

        return this.__IGattClientNotificationResult.get_SubscribedClient()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IGattClientNotificationResult")) {
            if ((queryResult := this.QueryInterface(IGattClientNotificationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattClientNotificationResult := IGattClientNotificationResult(outPtr)
        }

        return this.__IGattClientNotificationResult.get_Status()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        if (!this.HasProp("__IGattClientNotificationResult")) {
            if ((queryResult := this.QueryInterface(IGattClientNotificationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattClientNotificationResult := IGattClientNotificationResult(outPtr)
        }

        return this.__IGattClientNotificationResult.get_ProtocolError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesSent() {
        if (!this.HasProp("__IGattClientNotificationResult2")) {
            if ((queryResult := this.QueryInterface(IGattClientNotificationResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattClientNotificationResult2 := IGattClientNotificationResult2(outPtr)
        }

        return this.__IGattClientNotificationResult2.get_BytesSent()
    }

;@endregion Instance Methods
}
