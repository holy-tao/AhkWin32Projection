#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UserDataTaskDataProviderConnection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskDataProviderTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskDataProviderTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{ae273202-b1c9-453e-afc5-b30af3bd217d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Connection"]

    /**
     * @type {UserDataTaskDataProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * 
     * @returns {UserDataTaskDataProviderConnection} 
     */
    get_Connection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataTaskDataProviderConnection(value)
    }
}
