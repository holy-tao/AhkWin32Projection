#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IDataPlanUsage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPlanUsage
     * @type {Guid}
     */
    static IID => Guid("{b921492d-3b44-47ff-b361-be59e69ed1b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MegabytesUsed", "get_LastSyncTime"]

    /**
     * @type {Integer} 
     */
    MegabytesUsed {
        get => this.get_MegabytesUsed()
    }

    /**
     * @type {DateTime} 
     */
    LastSyncTime {
        get => this.get_LastSyncTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MegabytesUsed() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSyncTime() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
