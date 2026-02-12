#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include .\ApplicationDataContainer.ahk
#Include .\StorageFolder.ahk
#Include ..\Foundation\EventRegistrationToken.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IApplicationData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationData
     * @type {Guid}
     */
    static IID => Guid("{c3da6fb7-b744-4b45-b0b8-223a0938d0dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Version", "SetVersionAsync", "ClearAllAsync", "ClearAsync1", "get_LocalSettings", "get_RoamingSettings", "get_LocalFolder", "get_RoamingFolder", "get_TemporaryFolder", "add_DataChanged", "remove_DataChanged", "SignalDataChanged", "get_RoamingStorageQuota"]

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {ApplicationDataContainer} 
     */
    LocalSettings {
        get => this.get_LocalSettings()
    }

    /**
     * @type {ApplicationDataContainer} 
     */
    RoamingSettings {
        get => this.get_RoamingSettings()
    }

    /**
     * @type {StorageFolder} 
     */
    LocalFolder {
        get => this.get_LocalFolder()
    }

    /**
     * @type {StorageFolder} 
     */
    RoamingFolder {
        get => this.get_RoamingFolder()
    }

    /**
     * @type {StorageFolder} 
     */
    TemporaryFolder {
        get => this.get_TemporaryFolder()
    }

    /**
     * @type {Integer} 
     */
    RoamingStorageQuota {
        get => this.get_RoamingStorageQuota()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} desiredVersion 
     * @param {ApplicationDataSetVersionHandler} handler 
     * @returns {IAsyncAction} 
     */
    SetVersionAsync(desiredVersion, handler) {
        result := ComCall(7, this, "uint", desiredVersion, "ptr", handler, "ptr*", &setVersionOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(setVersionOperation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearAllAsync() {
        result := ComCall(8, this, "ptr*", &clearOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(clearOperation)
    }

    /**
     * 
     * @param {Integer} locality 
     * @returns {IAsyncAction} 
     */
    ClearAsync1(locality) {
        result := ComCall(9, this, "int", locality, "ptr*", &clearOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(clearOperation)
    }

    /**
     * 
     * @returns {ApplicationDataContainer} 
     */
    get_LocalSettings() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ApplicationDataContainer(value)
    }

    /**
     * 
     * @returns {ApplicationDataContainer} 
     */
    get_RoamingSettings() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ApplicationDataContainer(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_LocalFolder() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_RoamingFolder() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_TemporaryFolder() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ApplicationData, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_DataChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SignalDataChanged() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoamingStorageQuota() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
