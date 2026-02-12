#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\ContactListSyncConstraints.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactList2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactList2
     * @type {Guid}
     */
    static IID => Guid("{cb3943b4-4550-4dcb-9229-40ff91fb0203}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterSyncManagerAsync", "put_SupportsServerSearch", "get_SyncConstraints"]

    /**
     * @type {HRESULT} 
     */
    SupportsServerSearch {
        set => this.put_SupportsServerSearch(value)
    }

    /**
     * @type {ContactListSyncConstraints} 
     */
    SyncConstraints {
        get => this.get_SyncConstraints()
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    RegisterSyncManagerAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsServerSearch(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ContactListSyncConstraints} 
     */
    get_SyncConstraints() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactListSyncConstraints(value)
    }
}
