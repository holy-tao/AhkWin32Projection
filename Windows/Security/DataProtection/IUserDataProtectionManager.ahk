#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\UserDataStorageItemProtectionInfo.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\UserDataBufferUnprotectResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class IUserDataProtectionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataProtectionManager
     * @type {Guid}
     */
    static IID => Guid("{1f13237d-b42e-4a88-9480-0f240924c876}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProtectStorageItemAsync", "GetStorageItemProtectionInfoAsync", "ProtectBufferAsync", "UnprotectBufferAsync", "IsContinuedDataAvailabilityExpected", "add_DataAvailabilityStateChanged", "remove_DataAvailabilityStateChanged"]

    /**
     * 
     * @param {IStorageItem} storageItem 
     * @param {Integer} availability 
     * @returns {IAsyncOperation<Integer>} 
     */
    ProtectStorageItemAsync(storageItem, availability) {
        result := ComCall(6, this, "ptr", storageItem, "int", availability, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IStorageItem} storageItem 
     * @returns {IAsyncOperation<UserDataStorageItemProtectionInfo>} 
     */
    GetStorageItemProtectionInfoAsync(storageItem) {
        result := ComCall(7, this, "ptr", storageItem, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataStorageItemProtectionInfo, result_)
    }

    /**
     * 
     * @param {IBuffer} unprotectedBuffer 
     * @param {Integer} availability 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    ProtectBufferAsync(unprotectedBuffer, availability) {
        result := ComCall(8, this, "ptr", unprotectedBuffer, "int", availability, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, result_)
    }

    /**
     * 
     * @param {IBuffer} protectedBuffer 
     * @returns {IAsyncOperation<UserDataBufferUnprotectResult>} 
     */
    UnprotectBufferAsync(protectedBuffer) {
        result := ComCall(9, this, "ptr", protectedBuffer, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataBufferUnprotectResult, result_)
    }

    /**
     * 
     * @param {Integer} availability 
     * @returns {Boolean} 
     */
    IsContinuedDataAvailabilityExpected(availability) {
        result := ComCall(10, this, "int", availability, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataProtectionManager, UserDataAvailabilityStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataAvailabilityStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_DataAvailabilityStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
