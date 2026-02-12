#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ChatSyncConfiguration.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatSyncManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatSyncManager
     * @type {Guid}
     */
    static IID => Guid("{7ba52c63-2650-486f-b4b4-6bd9d3d63c84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration", "AssociateAccountAsync", "UnassociateAccountAsync", "IsAccountAssociated", "StartSync", "SetConfigurationAsync"]

    /**
     * @type {ChatSyncConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * 
     * @returns {ChatSyncConfiguration} 
     */
    get_Configuration() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatSyncConfiguration(result_)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {IAsyncAction} 
     */
    AssociateAccountAsync(webAccount_) {
        result := ComCall(7, this, "ptr", webAccount_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    UnassociateAccountAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @returns {Boolean} 
     */
    IsAccountAssociated(webAccount_) {
        result := ComCall(9, this, "ptr", webAccount_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartSync() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ChatSyncConfiguration} configuration 
     * @returns {IAsyncAction} 
     */
    SetConfigurationAsync(configuration) {
        result := ComCall(11, this, "ptr", configuration, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
