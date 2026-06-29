#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGameInputDevice.ahk" { IGameInputDevice }
#Import ".\GameInputSystemButtons.ahk" { GameInputSystemButtons }
#Import ".\GameInputEnumerationKind.ahk" { GameInputEnumerationKind }
#Import "..\..\..\Foundation\APP_LOCAL_DEVICE_ID.ahk" { APP_LOCAL_DEVICE_ID }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IGameInputReading.ahk" { IGameInputReading }
#Import ".\GameInputKind.ahk" { GameInputKind }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IGameInputDispatcher.ahk" { IGameInputDispatcher }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\GameInputFocusPolicy.ahk" { GameInputFocusPolicy }
#Import ".\GameInputDeviceStatus.ahk" { GameInputDeviceStatus }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct IGameInput extends IUnknown {
    /**
     * The interface identifier for IGameInput
     * @type {Guid}
     */
    static IID := Guid("{11be2a7e-4254-445a-9c09-ffc40f006918}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameInput interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentTimestamp            : IntPtr
        GetCurrentReading              : IntPtr
        GetNextReading                 : IntPtr
        GetPreviousReading             : IntPtr
        GetTemporalReading             : IntPtr
        RegisterReadingCallback        : IntPtr
        RegisterDeviceCallback         : IntPtr
        RegisterSystemButtonCallback   : IntPtr
        RegisterKeyboardLayoutCallback : IntPtr
        StopCallback                   : IntPtr
        UnregisterCallback             : IntPtr
        CreateDispatcher               : IntPtr
        CreateAggregateDevice          : IntPtr
        FindDeviceFromId               : IntPtr
        FindDeviceFromObject           : IntPtr
        FindDeviceFromPlatformHandle   : IntPtr
        FindDeviceFromPlatformString   : IntPtr
        EnableOemDeviceSupport         : IntPtr
        SetFocusPolicy                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameInput.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentTimestamp() {
        result := ComCall(3, this, Int64)
        return result
    }

    /**
     * 
     * @param {GameInputKind} inputKind 
     * @param {IGameInputDevice} device 
     * @returns {IGameInputReading} 
     */
    GetCurrentReading(inputKind, device) {
        result := ComCall(4, this, GameInputKind, inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
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
        result := ComCall(5, this, "ptr", referenceReading, GameInputKind, inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
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
        result := ComCall(6, this, "ptr", referenceReading, GameInputKind, inputKind, "ptr", device, "ptr*", &reading := 0, "HRESULT")
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

        result := ComCall(8, this, "ptr", device, GameInputKind, inputKind, "float", analogThreshold, _contextMarshal, _context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
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

        result := ComCall(9, this, "ptr", device, GameInputKind, inputKind, GameInputDeviceStatus, statusFilter, GameInputEnumerationKind, enumerationKind, _contextMarshal, _context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
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

        result := ComCall(10, this, "ptr", device, GameInputSystemButtons, buttonFilter, _contextMarshal, _context, "ptr", callbackFunc, "uint*", &callbackToken := 0, "HRESULT")
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
        result := ComCall(13, this, "uint", callbackToken, "uint", timeoutInMicroseconds, Int32)
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
        result := ComCall(15, this, GameInputKind, inputKind, "ptr*", &device := 0, "HRESULT")
        return IGameInputDevice(device)
    }

    /**
     * 
     * @param {Pointer<APP_LOCAL_DEVICE_ID>} value 
     * @returns {IGameInputDevice} 
     */
    FindDeviceFromId(value) {
        result := ComCall(16, this, APP_LOCAL_DEVICE_ID.Ptr, value, "ptr*", &device := 0, "HRESULT")
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
        result := ComCall(18, this, HANDLE, value, "ptr*", &device := 0, "HRESULT")
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
        ComCall(21, this, GameInputFocusPolicy, policy)
    }

    Query(iid) {
        if (IGameInput.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentTimestamp := CallbackCreate(GetMethod(implObj, "GetCurrentTimestamp"), flags, 1)
        this.vtbl.GetCurrentReading := CallbackCreate(GetMethod(implObj, "GetCurrentReading"), flags, 4)
        this.vtbl.GetNextReading := CallbackCreate(GetMethod(implObj, "GetNextReading"), flags, 5)
        this.vtbl.GetPreviousReading := CallbackCreate(GetMethod(implObj, "GetPreviousReading"), flags, 5)
        this.vtbl.GetTemporalReading := CallbackCreate(GetMethod(implObj, "GetTemporalReading"), flags, 4)
        this.vtbl.RegisterReadingCallback := CallbackCreate(GetMethod(implObj, "RegisterReadingCallback"), flags, 7)
        this.vtbl.RegisterDeviceCallback := CallbackCreate(GetMethod(implObj, "RegisterDeviceCallback"), flags, 8)
        this.vtbl.RegisterSystemButtonCallback := CallbackCreate(GetMethod(implObj, "RegisterSystemButtonCallback"), flags, 6)
        this.vtbl.RegisterKeyboardLayoutCallback := CallbackCreate(GetMethod(implObj, "RegisterKeyboardLayoutCallback"), flags, 5)
        this.vtbl.StopCallback := CallbackCreate(GetMethod(implObj, "StopCallback"), flags, 2)
        this.vtbl.UnregisterCallback := CallbackCreate(GetMethod(implObj, "UnregisterCallback"), flags, 3)
        this.vtbl.CreateDispatcher := CallbackCreate(GetMethod(implObj, "CreateDispatcher"), flags, 2)
        this.vtbl.CreateAggregateDevice := CallbackCreate(GetMethod(implObj, "CreateAggregateDevice"), flags, 3)
        this.vtbl.FindDeviceFromId := CallbackCreate(GetMethod(implObj, "FindDeviceFromId"), flags, 3)
        this.vtbl.FindDeviceFromObject := CallbackCreate(GetMethod(implObj, "FindDeviceFromObject"), flags, 3)
        this.vtbl.FindDeviceFromPlatformHandle := CallbackCreate(GetMethod(implObj, "FindDeviceFromPlatformHandle"), flags, 3)
        this.vtbl.FindDeviceFromPlatformString := CallbackCreate(GetMethod(implObj, "FindDeviceFromPlatformString"), flags, 3)
        this.vtbl.EnableOemDeviceSupport := CallbackCreate(GetMethod(implObj, "EnableOemDeviceSupport"), flags, 5)
        this.vtbl.SetFocusPolicy := CallbackCreate(GetMethod(implObj, "SetFocusPolicy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentTimestamp)
        CallbackFree(this.vtbl.GetCurrentReading)
        CallbackFree(this.vtbl.GetNextReading)
        CallbackFree(this.vtbl.GetPreviousReading)
        CallbackFree(this.vtbl.GetTemporalReading)
        CallbackFree(this.vtbl.RegisterReadingCallback)
        CallbackFree(this.vtbl.RegisterDeviceCallback)
        CallbackFree(this.vtbl.RegisterSystemButtonCallback)
        CallbackFree(this.vtbl.RegisterKeyboardLayoutCallback)
        CallbackFree(this.vtbl.StopCallback)
        CallbackFree(this.vtbl.UnregisterCallback)
        CallbackFree(this.vtbl.CreateDispatcher)
        CallbackFree(this.vtbl.CreateAggregateDevice)
        CallbackFree(this.vtbl.FindDeviceFromId)
        CallbackFree(this.vtbl.FindDeviceFromObject)
        CallbackFree(this.vtbl.FindDeviceFromPlatformHandle)
        CallbackFree(this.vtbl.FindDeviceFromPlatformString)
        CallbackFree(this.vtbl.EnableOemDeviceSupport)
        CallbackFree(this.vtbl.SetFocusPolicy)
    }
}
