#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGameInputReading.ahk
#Include .\GameInputDeviceStatus.ahk
#Include .\IGameInputDevice.ahk
#Include .\GameInputKind.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\IGameInputDispatcher.ahk
#Include .\GameInputFocusPolicy.ahk
#Include ..\..\..\Foundation\APP_LOCAL_DEVICE_ID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Foundation\HRESULT.ahk
#Include .\GameInputEnumerationKind.ahk
#Include .\GameInputSystemButtons.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class IGameInput extends IUnknown {

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
     * @param {GameInputKind} inputKind 
     * @param {IGameInputDevice} device 
     * @returns {IGameInputReading} 
     */
    GetCurrentReading(inputKind, device) {
        result := ComCall(4, this, "int", inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
        return IGameInputReading(reading)
    }

    /**
     * 
     * @param {IGameInputReading} referenceReading 
     * @param {GameInputKind} inputKind 
     * @param {IGameInputDevice} device 
     * @returns {IGameInputReading} 
     */
    GetNextReading(referenceReading, inputKind, device) {
        result := ComCall(5, this, "ptr", referenceReading, "int", inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
        return IGameInputReading(reading)
    }

    /**
     * 
     * @param {IGameInputReading} referenceReading 
     * @param {GameInputKind} inputKind 
     * @param {IGameInputDevice} device 
     * @returns {IGameInputReading} 
     */
    GetPreviousReading(referenceReading, inputKind, device) {
        result := ComCall(6, this, "ptr", referenceReading, "int", inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
        return IGameInputReading(reading)
    }

    /**
     * 
     * @param {Integer} _timestamp 
     * @param {IGameInputDevice} device 
     * @returns {IGameInputReading} 
     */
    GetTemporalReading(_timestamp, device) {
        result := ComCall(7, this, "uint", _timestamp, "ptr", device, "ptr*", &reading := 0, "HRESULT")
        return IGameInputReading(reading)
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {GameInputKind} inputKind 
     * @param {Float} analogThreshold 
     * @param {Pointer<Void>} _context 
     * @param {Pointer<GameInputReadingCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterReadingCallback(device, inputKind, analogThreshold, _context, callbackFunc) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", device, "int", inputKind, "float", analogThreshold, _contextMarshal, _context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {GameInputKind} inputKind 
     * @param {GameInputDeviceStatus} statusFilter 
     * @param {GameInputEnumerationKind} enumerationKind 
     * @param {Pointer<Void>} _context 
     * @param {Pointer<GameInputDeviceCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterDeviceCallback(device, inputKind, statusFilter, enumerationKind, _context, callbackFunc) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "ptr", device, "int", inputKind, "int", statusFilter, "int", enumerationKind, _contextMarshal, _context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {GameInputSystemButtons} buttonFilter 
     * @param {Pointer<Void>} _context 
     * @param {Pointer<GameInputSystemButtonCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterSystemButtonCallback(device, buttonFilter, _context, callbackFunc) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", device, "int", buttonFilter, _contextMarshal, _context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Pointer<Void>} _context 
     * @param {Pointer<GameInputKeyboardLayoutCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterKeyboardLayoutCallback(device, _context, callbackFunc) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", device, _contextMarshal, _context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
        return callbackToken
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
     * @returns {IGameInputDispatcher} 
     */
    CreateDispatcher() {
        result := ComCall(14, this, "ptr*", &dispatcher := 0, "HRESULT")
        return IGameInputDispatcher(dispatcher)
    }

    /**
     * 
     * @param {GameInputKind} inputKind 
     * @returns {IGameInputDevice} 
     */
    CreateAggregateDevice(inputKind) {
        result := ComCall(15, this, "int", inputKind, "ptr*", &device := 0, "HRESULT")
        return IGameInputDevice(device)
    }

    /**
     * 
     * @param {Pointer<APP_LOCAL_DEVICE_ID>} value 
     * @returns {IGameInputDevice} 
     */
    FindDeviceFromId(value) {
        result := ComCall(16, this, "ptr", value, "ptr*", &device := 0, "HRESULT")
        return IGameInputDevice(device)
    }

    /**
     * 
     * @param {IUnknown} value 
     * @returns {IGameInputDevice} 
     */
    FindDeviceFromObject(value) {
        result := ComCall(17, this, "ptr", value, "ptr*", &device := 0, "HRESULT")
        return IGameInputDevice(device)
    }

    /**
     * 
     * @param {HANDLE} value 
     * @returns {IGameInputDevice} 
     */
    FindDeviceFromPlatformHandle(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "ptr", value, "ptr*", &device := 0, "HRESULT")
        return IGameInputDevice(device)
    }

    /**
     * 
     * @param {PWSTR} value 
     * @returns {IGameInputDevice} 
     */
    FindDeviceFromPlatformString(value) {
        value := value is String ? StrPtr(value) : value

        result := ComCall(19, this, "ptr", value, "ptr*", &device := 0, "HRESULT")
        return IGameInputDevice(device)
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
     * @param {GameInputFocusPolicy} policy 
     * @returns {String} Nothing - always returns an empty string
     */
    SetFocusPolicy(policy) {
        ComCall(21, this, "int", policy)
    }
}
