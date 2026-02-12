#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemWatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemStatics3
     * @type {Guid}
     */
    static IID => Guid("{9995f16f-0b3c-5ac5-b325-cc73f437dfcd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWatcherForUser", "CreateWatcherWithFiltersForUser"]

    /**
     * 
     * @param {User} user_ 
     * @returns {RemoteSystemWatcher} 
     */
    CreateWatcherForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemWatcher(result_)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {IIterable<IRemoteSystemFilter>} filters 
     * @returns {RemoteSystemWatcher} 
     */
    CreateWatcherWithFiltersForUser(user_, filters) {
        result := ComCall(7, this, "ptr", user_, "ptr", filters, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemWatcher(result_)
    }
}
