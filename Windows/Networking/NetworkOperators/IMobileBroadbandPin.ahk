#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MobileBroadbandPinOperationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandPin extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandPin
     * @type {Guid}
     */
    static IID => Guid("{e661d709-e779-45bf-8281-75323df9e321}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_LockState", "get_Format", "get_Enabled", "get_MaxLength", "get_MinLength", "get_AttemptsRemaining", "EnableAsync", "DisableAsync", "EnterAsync", "ChangeAsync", "UnblockAsync"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    LockState {
        get => this.get_LockState()
    }

    /**
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
    }

    /**
     * @type {Integer} 
     */
    MinLength {
        get => this.get_MinLength()
    }

    /**
     * @type {Integer} 
     */
    AttemptsRemaining {
        get => this.get_AttemptsRemaining()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LockState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLength() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinLength() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttemptsRemaining() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} currentPin 
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     */
    EnableAsync(currentPin) {
        if(currentPin is String) {
            pin := HSTRING.Create(currentPin)
            currentPin := pin.Value
        }
        currentPin := currentPin is Win32Handle ? NumGet(currentPin, "ptr") : currentPin

        result := ComCall(13, this, "ptr", currentPin, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandPinOperationResult, asyncInfo)
    }

    /**
     * 
     * @param {HSTRING} currentPin 
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     */
    DisableAsync(currentPin) {
        if(currentPin is String) {
            pin := HSTRING.Create(currentPin)
            currentPin := pin.Value
        }
        currentPin := currentPin is Win32Handle ? NumGet(currentPin, "ptr") : currentPin

        result := ComCall(14, this, "ptr", currentPin, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandPinOperationResult, asyncInfo)
    }

    /**
     * 
     * @param {HSTRING} currentPin 
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     */
    EnterAsync(currentPin) {
        if(currentPin is String) {
            pin := HSTRING.Create(currentPin)
            currentPin := pin.Value
        }
        currentPin := currentPin is Win32Handle ? NumGet(currentPin, "ptr") : currentPin

        result := ComCall(15, this, "ptr", currentPin, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandPinOperationResult, asyncInfo)
    }

    /**
     * 
     * @param {HSTRING} currentPin 
     * @param {HSTRING} newPin 
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     */
    ChangeAsync(currentPin, newPin) {
        if(currentPin is String) {
            pin := HSTRING.Create(currentPin)
            currentPin := pin.Value
        }
        currentPin := currentPin is Win32Handle ? NumGet(currentPin, "ptr") : currentPin
        if(newPin is String) {
            pin := HSTRING.Create(newPin)
            newPin := pin.Value
        }
        newPin := newPin is Win32Handle ? NumGet(newPin, "ptr") : newPin

        result := ComCall(16, this, "ptr", currentPin, "ptr", newPin, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandPinOperationResult, asyncInfo)
    }

    /**
     * 
     * @param {HSTRING} pinUnblockKey 
     * @param {HSTRING} newPin 
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     */
    UnblockAsync(pinUnblockKey, newPin) {
        if(pinUnblockKey is String) {
            pin := HSTRING.Create(pinUnblockKey)
            pinUnblockKey := pin.Value
        }
        pinUnblockKey := pinUnblockKey is Win32Handle ? NumGet(pinUnblockKey, "ptr") : pinUnblockKey
        if(newPin is String) {
            pin := HSTRING.Create(newPin)
            newPin := pin.Value
        }
        newPin := newPin is Win32Handle ? NumGet(newPin, "ptr") : newPin

        result := ComCall(17, this, "ptr", pinUnblockKey, "ptr", newPin, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandPinOperationResult, asyncInfo)
    }
}
