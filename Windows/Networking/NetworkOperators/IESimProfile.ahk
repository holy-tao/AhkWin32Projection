#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ESimProfilePolicy.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ESimOperationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimProfile
     * @type {Guid}
     */
    static IID => Guid("{ee1e7880-06a9-4027-b4f8-ddb23d7810e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Class", "get_Nickname", "get_Policy", "get_Id", "get_ProviderIcon", "get_ProviderId", "get_ProviderName", "get_State", "DisableAsync", "EnableAsync", "SetNicknameAsync"]

    /**
     * @type {Integer} 
     */
    Class {
        get => this.get_Class()
    }

    /**
     * @type {HSTRING} 
     */
    Nickname {
        get => this.get_Nickname()
    }

    /**
     * @type {ESimProfilePolicy} 
     */
    Policy {
        get => this.get_Policy()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    ProviderIcon {
        get => this.get_ProviderIcon()
    }

    /**
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * @type {HSTRING} 
     */
    ProviderName {
        get => this.get_ProviderName()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Class() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Nickname() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ESimProfilePolicy} 
     */
    get_Policy() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimProfilePolicy(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_ProviderIcon() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<ESimOperationResult>} 
     */
    DisableAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimOperationResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<ESimOperationResult>} 
     */
    EnableAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimOperationResult, operation)
    }

    /**
     * 
     * @param {HSTRING} newNickname 
     * @returns {IAsyncOperation<ESimOperationResult>} 
     */
    SetNicknameAsync(newNickname) {
        if(newNickname is String) {
            pin := HSTRING.Create(newNickname)
            newNickname := pin.Value
        }
        newNickname := newNickname is Win32Handle ? NumGet(newNickname, "ptr") : newNickname

        result := ComCall(16, this, "ptr", newNickname, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimOperationResult, operation)
    }
}
