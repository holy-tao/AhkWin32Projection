#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ESimProfilePolicy.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ESimOperationResult.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimProfileMetadata extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimProfileMetadata
     * @type {Guid}
     */
    static IID => Guid("{ed25831f-90db-498d-a7b4-ebce807d3c23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsConfirmationCodeRequired", "get_Policy", "get_Id", "get_ProviderIcon", "get_ProviderId", "get_ProviderName", "get_State", "DenyInstallAsync", "ConfirmInstallAsync", "ConfirmInstallWithConfirmationCodeAsync", "PostponeInstallAsync", "add_StateChanged", "remove_StateChanged"]

    /**
     * @type {Boolean} 
     */
    IsConfirmationCodeRequired {
        get => this.get_IsConfirmationCodeRequired()
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
     * @returns {Boolean} 
     */
    get_IsConfirmationCodeRequired() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
        result := ComCall(7, this, "ptr*", &value := 0, "int")
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
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "ptr*", &value := 0, "int")
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
        result := ComCall(10, this, "ptr", value, "int")
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
        result := ComCall(11, this, "ptr", value, "int")
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
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<ESimOperationResult>} 
     */
    DenyInstallAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimOperationResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<ESimOperationResult, ESimProfileInstallProgress>} 
     */
    ConfirmInstallAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(ESimOperationResult, (ptr) => IPropertyValue(ptr).GetESimProfileInstallProgress(), operation)
    }

    /**
     * 
     * @param {HSTRING} confirmationCode 
     * @returns {IAsyncOperationWithProgress<ESimOperationResult, ESimProfileInstallProgress>} 
     */
    ConfirmInstallWithConfirmationCodeAsync(confirmationCode) {
        if(confirmationCode is String) {
            pin := HSTRING.Create(confirmationCode)
            confirmationCode := pin.Value
        }
        confirmationCode := confirmationCode is Win32Handle ? NumGet(confirmationCode, "ptr") : confirmationCode

        result := ComCall(15, this, "ptr", confirmationCode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(ESimOperationResult, (ptr) => IPropertyValue(ptr).GetESimProfileInstallProgress(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<ESimOperationResult>} 
     */
    PostponeInstallAsync() {
        result := ComCall(16, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimOperationResult, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<ESimProfileMetadata, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
