#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UpdateOperationResult.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdatePendingOperationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdatePendingOperationResult
     * @type {Guid}
     */
    static IID => Guid("{0f83b557-e96a-5f19-9492-99fc8bd83c5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result", "get_SuggestedRecheckInterval"]

    /**
     * @type {UpdateOperationResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {TimeSpan} 
     */
    SuggestedRecheckInterval {
        get => this.get_SuggestedRecheckInterval()
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
     * @returns {TimeSpan} 
     */
    get_SuggestedRecheckInterval() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
