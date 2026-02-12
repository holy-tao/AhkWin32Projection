#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\System\User.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GameSaveContainer.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GameSaveOperationResult.ahk
#Include .\GameSaveContainerInfoQuery.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class IGameSaveProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameSaveProvider
     * @type {Guid}
     */
    static IID => Guid("{90a60394-80fe-4211-97f8-a5de14dd95d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "CreateContainer", "DeleteContainerAsync", "CreateContainerInfoQuery", "CreateContainerInfoQueryWithName", "GetRemainingBytesInQuotaAsync", "get_ContainersChangedSinceLastSync"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    ContainersChangedSinceLastSync {
        get => this.get_ContainersChangedSinceLastSync()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {GameSaveContainer} 
     */
    CreateContainer(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameSaveContainer(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     */
    DeleteContainerAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveOperationResult, action)
    }

    /**
     * 
     * @returns {GameSaveContainerInfoQuery} 
     */
    CreateContainerInfoQuery() {
        result := ComCall(9, this, "ptr*", &query := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameSaveContainerInfoQuery(query)
    }

    /**
     * 
     * @param {HSTRING} containerNamePrefix 
     * @returns {GameSaveContainerInfoQuery} 
     */
    CreateContainerInfoQueryWithName(containerNamePrefix) {
        if(containerNamePrefix is String) {
            pin := HSTRING.Create(containerNamePrefix)
            containerNamePrefix := pin.Value
        }
        containerNamePrefix := containerNamePrefix is Win32Handle ? NumGet(containerNamePrefix, "ptr") : containerNamePrefix

        result := ComCall(10, this, "ptr", containerNamePrefix, "ptr*", &query := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameSaveContainerInfoQuery(query)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetRemainingBytesInQuotaAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt64(), operation)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ContainersChangedSinceLastSync() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
