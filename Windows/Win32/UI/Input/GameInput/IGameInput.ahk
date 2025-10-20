#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInput extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInput
     * @type {Guid}
     */
    static IID => Guid("{11be2a7e-4254-445a-9c09-ffc40f006918}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentTimestamp", "GetCurrentReading", "GetNextReading", "GetPreviousReading", "GetTemporalReading", "RegisterReadingCallback", "RegisterDeviceCallback", "RegisterSystemButtonCallback", "RegisterKeyboardLayoutCallback", "StopCallback", "UnregisterCallback", "CreateDispatcher", "CreateAggregateDevice", "FindDeviceFromId", "FindDeviceFromObject", "FindDeviceFromPlatformHandle", "FindDeviceFromPlatformString", "EnableOemDeviceSupport", "SetFocusPolicy"]

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentTimestamp() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} inputKind 
     * @param {IGameInputDevice} device 
     * @param {Pointer<IGameInputReading>} reading 
     * @returns {HRESULT} 
     */
    GetCurrentReading(inputKind, device, reading) {
        result := ComCall(4, this, "int", inputKind, "ptr", device, "ptr*", reading, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputReading} referenceReading 
     * @param {Integer} inputKind 
     * @param {IGameInputDevice} device 
     * @param {Pointer<IGameInputReading>} reading 
     * @returns {HRESULT} 
     */
    GetNextReading(referenceReading, inputKind, device, reading) {
        result := ComCall(5, this, "ptr", referenceReading, "int", inputKind, "ptr", device, "ptr*", reading, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputReading} referenceReading 
     * @param {Integer} inputKind 
     * @param {IGameInputDevice} device 
     * @param {Pointer<IGameInputReading>} reading 
     * @returns {HRESULT} 
     */
    GetPreviousReading(referenceReading, inputKind, device, reading) {
        result := ComCall(6, this, "ptr", referenceReading, "int", inputKind, "ptr", device, "ptr*", reading, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @param {IGameInputDevice} device 
     * @param {Pointer<IGameInputReading>} reading 
     * @returns {HRESULT} 
     */
    GetTemporalReading(timestamp, device, reading) {
        result := ComCall(7, this, "uint", timestamp, "ptr", device, "ptr*", reading, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Integer} inputKind 
     * @param {Float} analogThreshold 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputReadingCallback>} callbackFunc 
     * @param {Pointer<Integer>} callbackToken 
     * @returns {HRESULT} 
     */
    RegisterReadingCallback(device, inputKind, analogThreshold, context, callbackFunc, callbackToken) {
        result := ComCall(8, this, "ptr", device, "int", inputKind, "float", analogThreshold, "ptr", context, "ptr", callbackFunc, "uint*", callbackToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Integer} inputKind 
     * @param {Integer} statusFilter 
     * @param {Integer} enumerationKind 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputDeviceCallback>} callbackFunc 
     * @param {Pointer<Integer>} callbackToken 
     * @returns {HRESULT} 
     */
    RegisterDeviceCallback(device, inputKind, statusFilter, enumerationKind, context, callbackFunc, callbackToken) {
        result := ComCall(9, this, "ptr", device, "int", inputKind, "int", statusFilter, "int", enumerationKind, "ptr", context, "ptr", callbackFunc, "uint*", callbackToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Integer} buttonFilter 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputSystemButtonCallback>} callbackFunc 
     * @param {Pointer<Integer>} callbackToken 
     * @returns {HRESULT} 
     */
    RegisterSystemButtonCallback(device, buttonFilter, context, callbackFunc, callbackToken) {
        result := ComCall(10, this, "ptr", device, "int", buttonFilter, "ptr", context, "ptr", callbackFunc, "uint*", callbackToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputKeyboardLayoutCallback>} callbackFunc 
     * @param {Pointer<Integer>} callbackToken 
     * @returns {HRESULT} 
     */
    RegisterKeyboardLayoutCallback(device, context, callbackFunc, callbackToken) {
        result := ComCall(11, this, "ptr", device, "ptr", context, "ptr", callbackFunc, "uint*", callbackToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} callbackToken 
     * @returns {String} Nothing - always returns an empty string
     */
    StopCallback(callbackToken) {
        ComCall(12, this, "uint", callbackToken)
    }

    /**
     * 
     * @param {Integer} callbackToken 
     * @param {Integer} timeoutInMicroseconds 
     * @returns {Boolean} 
     */
    UnregisterCallback(callbackToken, timeoutInMicroseconds) {
        result := ComCall(13, this, "uint", callbackToken, "uint", timeoutInMicroseconds, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IGameInputDispatcher>} dispatcher 
     * @returns {HRESULT} 
     */
    CreateDispatcher(dispatcher) {
        result := ComCall(14, this, "ptr*", dispatcher, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} inputKind 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {HRESULT} 
     */
    CreateAggregateDevice(inputKind, device) {
        result := ComCall(15, this, "int", inputKind, "ptr*", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<APP_LOCAL_DEVICE_ID>} value 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {HRESULT} 
     */
    FindDeviceFromId(value, device) {
        result := ComCall(16, this, "ptr", value, "ptr*", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} value 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {HRESULT} 
     */
    FindDeviceFromObject(value, device) {
        result := ComCall(17, this, "ptr", value, "ptr*", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} value 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {HRESULT} 
     */
    FindDeviceFromPlatformHandle(value, device) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "ptr", value, "ptr*", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} value 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {HRESULT} 
     */
    FindDeviceFromPlatformString(value, device) {
        value := value is String ? StrPtr(value) : value

        result := ComCall(19, this, "ptr", value, "ptr*", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vendorId 
     * @param {Integer} productId 
     * @param {Integer} interfaceNumber 
     * @param {Integer} collectionNumber 
     * @returns {HRESULT} 
     */
    EnableOemDeviceSupport(vendorId, productId, interfaceNumber, collectionNumber) {
        result := ComCall(20, this, "ushort", vendorId, "ushort", productId, "char", interfaceNumber, "char", collectionNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} policy 
     * @returns {String} Nothing - always returns an empty string
     */
    SetFocusPolicy(policy) {
        ComCall(21, this, "int", policy)
    }
}
