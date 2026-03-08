#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGameInputReading.ahk
#Include .\IGameInputDispatcher.ahk
#Include .\IGameInputDevice.ahk
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
     * @returns {IGameInputReading} 
     */
    GetCurrentReading(inputKind, device) {
        result := ComCall(4, this, "int", inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
        return IGameInputReading(reading)
    }

    /**
     * 
     * @param {IGameInputReading} referenceReading 
     * @param {Integer} inputKind 
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
     * @param {Integer} inputKind 
     * @param {IGameInputDevice} device 
     * @returns {IGameInputReading} 
     */
    GetPreviousReading(referenceReading, inputKind, device) {
        result := ComCall(6, this, "ptr", referenceReading, "int", inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
        return IGameInputReading(reading)
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @param {IGameInputDevice} device 
     * @returns {IGameInputReading} 
     */
    GetTemporalReading(timestamp, device) {
        result := ComCall(7, this, "uint", timestamp, "ptr", device, "ptr*", &reading := 0, "HRESULT")
        return IGameInputReading(reading)
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Integer} inputKind 
     * @param {Float} analogThreshold 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputReadingCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterReadingCallback(device, inputKind, analogThreshold, context, callbackFunc) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", device, "int", inputKind, "float", analogThreshold, contextMarshal, context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Integer} inputKind 
     * @param {Integer} statusFilter 
     * @param {Integer} enumerationKind 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputDeviceCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterDeviceCallback(device, inputKind, statusFilter, enumerationKind, context, callbackFunc) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "ptr", device, "int", inputKind, "int", statusFilter, "int", enumerationKind, contextMarshal, context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Integer} buttonFilter 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputSystemButtonCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterSystemButtonCallback(device, buttonFilter, context, callbackFunc) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", device, "int", buttonFilter, contextMarshal, context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
        return callbackToken
    }

    /**
     * 
     * @param {IGameInputDevice} device 
     * @param {Pointer<Void>} context 
     * @param {Pointer<GameInputKeyboardLayoutCallback>} callbackFunc 
     * @returns {Integer} 
     */
    RegisterKeyboardLayoutCallback(device, context, callbackFunc) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", device, contextMarshal, context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
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
     * Creates a DispatcherQueueController on the caller's thread. Use the created DispatcherQueueController to create and manage the lifetime of a DispatcherQueue to run queued tasks in priority order on the Dispatcher queue's thread.
     * @remarks
     * Introduced in Windows 10, version 1709.
     * 
     *  If  <i>options.threadType</i> is <b>DQTYPE_THREAD_DEDICATED</b>, then this function  creates the dedicated thread and then creates the  <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> on that thread. The dispatcher queue event loop runs on the new dedicated thread.
     * 
     * An event loop runs asynchronously on a background thread to dispatch
     * queued task items to the new dedicated thread.
     * 
     *  If <i>options.threadType</i> is  <b>DQTYPE_THREAD_CURRENT</b>, then the <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> instance is created on the current thread. An error results if there is already 
     * a <b>IDispatcherQueueController</b> on the current thread. If you create a dispatcher queue on the current thread, ensure that there is a message pump running on the current thread so that the dispatcher queue can use it to dispatch tasks.
     * 
     * This call does not return until the new thread and <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> are created. The new thread will be initialized using the specified COM apartment.
     * 
     * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a>, and its associated <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueue">DispatcherQueue</a>, are WinRT objects. See their documentation for usage details.</div>
     * <div> </div>
     * @returns {IGameInputDispatcher} 
     * @see https://learn.microsoft.com/windows/win32/api/dispatcherqueue/nf-dispatcherqueue-createdispatcherqueuecontroller
     */
    CreateDispatcher() {
        result := ComCall(14, this, "ptr*", &dispatcher := 0, "HRESULT")
        return IGameInputDispatcher(dispatcher)
    }

    /**
     * 
     * @param {Integer} inputKind 
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
     * @param {Integer} policy 
     * @returns {String} Nothing - always returns an empty string
     */
    SetFocusPolicy(policy) {
        ComCall(21, this, "int", policy)
    }
}
