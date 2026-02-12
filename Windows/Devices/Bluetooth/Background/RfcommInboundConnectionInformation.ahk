#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommInboundConnectionInformation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about incoming RFCOMM connections. If an app wants the system to listen for incoming connections on behalf of an [RfcommConnectionTrigger](../windows.applicationmodel.background/rfcommconnectiontrigger.md), the app must create this object and attach it to the RfcommConnectionTrigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcomminboundconnectioninformation
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class RfcommInboundConnectionInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommInboundConnectionInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommInboundConnectionInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the Bluetooth SDP record that the system will advertise on behalf of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcomminboundconnectioninformation.sdprecord
     * @type {IBuffer} 
     */
    SdpRecord {
        get => this.get_SdpRecord()
        set => this.put_SdpRecord(value)
    }

    /**
     * Gets or sets the service UUID that will be advertised in the SDP record.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcomminboundconnectioninformation.localserviceid
     * @type {RfcommServiceId} 
     */
    LocalServiceId {
        get => this.get_LocalServiceId()
        set => this.put_LocalServiceId(value)
    }

    /**
     * Gets or sets the service capabilities that will be advertised.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcomminboundconnectioninformation.servicecapabilities
     * @type {Integer} 
     */
    ServiceCapabilities {
        get => this.get_ServiceCapabilities()
        set => this.put_ServiceCapabilities(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SdpRecord() {
        if (!this.HasProp("__IRfcommInboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommInboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommInboundConnectionInformation := IRfcommInboundConnectionInformation(outPtr)
        }

        return this.__IRfcommInboundConnectionInformation.get_SdpRecord()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_SdpRecord(value) {
        if (!this.HasProp("__IRfcommInboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommInboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommInboundConnectionInformation := IRfcommInboundConnectionInformation(outPtr)
        }

        return this.__IRfcommInboundConnectionInformation.put_SdpRecord(value)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_LocalServiceId() {
        if (!this.HasProp("__IRfcommInboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommInboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommInboundConnectionInformation := IRfcommInboundConnectionInformation(outPtr)
        }

        return this.__IRfcommInboundConnectionInformation.get_LocalServiceId()
    }

    /**
     * 
     * @param {RfcommServiceId} value 
     * @returns {HRESULT} 
     */
    put_LocalServiceId(value) {
        if (!this.HasProp("__IRfcommInboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommInboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommInboundConnectionInformation := IRfcommInboundConnectionInformation(outPtr)
        }

        return this.__IRfcommInboundConnectionInformation.put_LocalServiceId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceCapabilities() {
        if (!this.HasProp("__IRfcommInboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommInboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommInboundConnectionInformation := IRfcommInboundConnectionInformation(outPtr)
        }

        return this.__IRfcommInboundConnectionInformation.get_ServiceCapabilities()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ServiceCapabilities(value) {
        if (!this.HasProp("__IRfcommInboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommInboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommInboundConnectionInformation := IRfcommInboundConnectionInformation(outPtr)
        }

        return this.__IRfcommInboundConnectionInformation.put_ServiceCapabilities(value)
    }

;@endregion Instance Methods
}
