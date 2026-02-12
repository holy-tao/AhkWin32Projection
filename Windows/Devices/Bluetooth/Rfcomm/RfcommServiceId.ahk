#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommServiceId.ahk
#Include .\IRfcommServiceIdStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an RFCOMM service ID.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class RfcommServiceId extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommServiceId

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommServiceId.IID

    /**
     * Creates a RfcommServiceId object corresponding to the service id for the standardized Serial Port service (with short id 0x1101).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.serialport
     * @type {RfcommServiceId} 
     */
    static SerialPort {
        get => RfcommServiceId.get_SerialPort()
    }

    /**
     * Creates a RfcommServiceId object corresponding to the service id for the standardized OBEX Object Push service (with short id 0x1105).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.obexobjectpush
     * @type {RfcommServiceId} 
     */
    static ObexObjectPush {
        get => RfcommServiceId.get_ObexObjectPush()
    }

    /**
     * Creates a RfcommServiceId object corresponding to the service id for the standardized OBEX File Transfer service (with short id 0x1106).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.obexfiletransfer
     * @type {RfcommServiceId} 
     */
    static ObexFileTransfer {
        get => RfcommServiceId.get_ObexFileTransfer()
    }

    /**
     * Creates a RfcommServiceId object corresponding to the service id for the standardized Phone Book Access (PCE) service (with short id 0x112E).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.phonebookaccesspce
     * @type {RfcommServiceId} 
     */
    static PhoneBookAccessPce {
        get => RfcommServiceId.get_PhoneBookAccessPce()
    }

    /**
     * Creates a RfcommServiceId object corresponding to the service id for the standardized Phone Book Access (PSE) service (with short id 0x112F).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.phonebookaccesspse
     * @type {RfcommServiceId} 
     */
    static PhoneBookAccessPse {
        get => RfcommServiceId.get_PhoneBookAccessPse()
    }

    /**
     * Creates a RfcommServiceId object corresponding to the service id for the standardized Generic File Transfer service (with short id 0x1202).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.genericfiletransfer
     * @type {RfcommServiceId} 
     */
    static GenericFileTransfer {
        get => RfcommServiceId.get_GenericFileTransfer()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a RfcommServiceId object from a 128-bit service id.
     * @param {Guid} uuid The 128-bit service id.
     * @returns {RfcommServiceId} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.fromuuid
     */
    static FromUuid(uuid) {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.FromUuid(uuid)
    }

    /**
     * Creates a RfcommServiceId object from a 32-bit service id.
     * @param {Integer} shortId The 32-bit service id.
     * @returns {RfcommServiceId} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.fromshortid
     */
    static FromShortId(shortId) {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.FromShortId(shortId)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    static get_SerialPort() {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.get_SerialPort()
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    static get_ObexObjectPush() {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.get_ObexObjectPush()
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    static get_ObexFileTransfer() {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.get_ObexFileTransfer()
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    static get_PhoneBookAccessPce() {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.get_PhoneBookAccessPce()
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    static get_PhoneBookAccessPse() {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.get_PhoneBookAccessPse()
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    static get_GenericFileTransfer() {
        if (!RfcommServiceId.HasProp("__IRfcommServiceIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceIdStatics.IID)
            RfcommServiceId.__IRfcommServiceIdStatics := IRfcommServiceIdStatics(factoryPtr)
        }

        return RfcommServiceId.__IRfcommServiceIdStatics.get_GenericFileTransfer()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Retrieves the 128-bit service id.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.uuid
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        if (!this.HasProp("__IRfcommServiceId")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceId := IRfcommServiceId(outPtr)
        }

        return this.__IRfcommServiceId.get_Uuid()
    }

    /**
     * Converts the RfcommServiceId to a 32-bit service id if possible.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.asshortid
     */
    AsShortId() {
        if (!this.HasProp("__IRfcommServiceId")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceId := IRfcommServiceId(outPtr)
        }

        return this.__IRfcommServiceId.AsShortId()
    }

    /**
     * Converts the RfcommServiceId to a string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceid.asstring
     */
    AsString() {
        if (!this.HasProp("__IRfcommServiceId")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceId := IRfcommServiceId(outPtr)
        }

        return this.__IRfcommServiceId.AsString()
    }

;@endregion Instance Methods
}
