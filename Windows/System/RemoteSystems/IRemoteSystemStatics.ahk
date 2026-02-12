#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\RemoteSystem.ahk
#Include .\RemoteSystemWatcher.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemStatics
     * @type {Guid}
     */
    static IID => Guid("{a485b392-ff2b-4b47-be62-743f2f140f30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindByHostNameAsync", "CreateWatcher", "CreateWatcherWithFilters", "RequestAccessAsync"]

    /**
     * 
     * @param {HostName} hostName_ 
     * @returns {IAsyncOperation<RemoteSystem>} 
     */
    FindByHostNameAsync(hostName_) {
        result := ComCall(6, this, "ptr", hostName_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RemoteSystem, operation)
    }

    /**
     * 
     * @returns {RemoteSystemWatcher} 
     */
    CreateWatcher() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemWatcher(result_)
    }

    /**
     * 
     * @param {IIterable<IRemoteSystemFilter>} filters 
     * @returns {RemoteSystemWatcher} 
     */
    CreateWatcherWithFilters(filters) {
        result := ComCall(8, this, "ptr", filters, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemWatcher(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
