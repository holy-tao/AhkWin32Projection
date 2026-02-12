#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IFileRevocationManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileRevocationManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{256bbc3d-1c5d-4260-8c75-9144cfb78ba9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProtectAsync", "CopyProtectionAsync", "Revoke", "GetStatusAsync"]

    /**
     * 
     * @param {IStorageItem} storageItem 
     * @param {HSTRING} enterpriseIdentity 
     * @returns {IAsyncOperation<Integer>} 
     */
    ProtectAsync(storageItem, enterpriseIdentity) {
        if(enterpriseIdentity is String) {
            pin := HSTRING.Create(enterpriseIdentity)
            enterpriseIdentity := pin.Value
        }
        enterpriseIdentity := enterpriseIdentity is Win32Handle ? NumGet(enterpriseIdentity, "ptr") : enterpriseIdentity

        result := ComCall(6, this, "ptr", storageItem, "ptr", enterpriseIdentity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IStorageItem} sourceStorageItem 
     * @param {IStorageItem} targetStorageItem 
     * @returns {IAsyncOperation<Boolean>} 
     */
    CopyProtectionAsync(sourceStorageItem, targetStorageItem) {
        result := ComCall(7, this, "ptr", sourceStorageItem, "ptr", targetStorageItem, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * Ends an object's status as active.
     * @param {HSTRING} enterpriseIdentity 
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleauto/nf-oleauto-revokeactiveobject
     */
    Revoke(enterpriseIdentity) {
        if(enterpriseIdentity is String) {
            pin := HSTRING.Create(enterpriseIdentity)
            enterpriseIdentity := pin.Value
        }
        enterpriseIdentity := enterpriseIdentity is Win32Handle ? NumGet(enterpriseIdentity, "ptr") : enterpriseIdentity

        result := ComCall(8, this, "ptr", enterpriseIdentity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStorageItem} storageItem 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetStatusAsync(storageItem) {
        result := ComCall(9, this, "ptr", storageItem, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
