#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class ICortanaPermissionsManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICortanaPermissionsManager
     * @type {Guid}
     */
    static IID => Guid("{191330e0-8695-438a-9545-3da4e822ddb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupported", "ArePermissionsGrantedAsync", "GrantPermissionsAsync", "RevokePermissionsAsync"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsSupported() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IIterable<Integer>} permissions 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ArePermissionsGrantedAsync(permissions) {
        result := ComCall(7, this, "ptr", permissions, "ptr*", &getGrantedPermissionsOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), getGrantedPermissionsOperation)
    }

    /**
     * 
     * @param {IIterable<Integer>} permissions 
     * @returns {IAsyncOperation<Integer>} 
     */
    GrantPermissionsAsync(permissions) {
        result := ComCall(8, this, "ptr", permissions, "ptr*", &grantOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), grantOperation)
    }

    /**
     * 
     * @param {IIterable<Integer>} permissions 
     * @returns {IAsyncOperation<Integer>} 
     */
    RevokePermissionsAsync(permissions) {
        result := ComCall(9, this, "ptr", permissions, "ptr*", &revokeOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), revokeOperation)
    }
}
