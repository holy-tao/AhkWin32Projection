#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UpdateOperationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IAreRebootsPendingResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAreRebootsPendingResult
     * @type {Guid}
     */
    static IID => Guid("{a0c93ffd-8409-5fe1-876b-d59d5d9951b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result", "get_IsRebootPending"]

    /**
     * @type {UpdateOperationResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {Boolean} 
     */
    IsRebootPending {
        get => this.get_IsRebootPending()
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    get_Result() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateOperationResult(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRebootPending() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
