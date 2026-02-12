#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\UserDataTasks\UserDataTaskList.ahk
#Include ..\Contacts\ContactGroup.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class IUserDataAccount4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccount4
     * @type {Guid}
     */
    static IID => Guid("{c4315210-eae5-4f0a-a8b2-1cca115e008f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanShowCreateContactGroup", "put_CanShowCreateContactGroup", "get_ProviderProperties", "FindUserDataTaskListsAsync", "FindContactGroupsAsync", "TryShowCreateContactGroupAsync", "put_IsProtectedUnderLock", "put_Icon"]

    /**
     * @type {Boolean} 
     */
    CanShowCreateContactGroup {
        get => this.get_CanShowCreateContactGroup()
        set => this.put_CanShowCreateContactGroup(value)
    }

    /**
     * @type {IPropertySet} 
     */
    ProviderProperties {
        get => this.get_ProviderProperties()
    }

    /**
     * @type {HRESULT} 
     */
    IsProtectedUnderLock {
        set => this.put_IsProtectedUnderLock(value)
    }

    /**
     * @type {HRESULT} 
     */
    Icon {
        set => this.put_Icon(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanShowCreateContactGroup() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanShowCreateContactGroup(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ProviderProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<UserDataTaskList>>} 
     */
    FindUserDataTaskListsAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UserDataTaskList), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ContactGroup>>} 
     */
    FindContactGroupsAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactGroup), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    TryShowCreateContactGroupAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsProtectedUnderLock(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
