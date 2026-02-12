#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UpdateTaskResult.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\UpdateStageRecord.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IStageUpdateTaskResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStageUpdateTaskResult
     * @type {Guid}
     */
    static IID => Guid("{c926add1-335c-57f7-8dac-1ce2fce65060}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result", "get_StageRecords"]

    /**
     * @type {UpdateTaskResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {IVectorView<UpdateStageRecord>} 
     */
    StageRecords {
        get => this.get_StageRecords()
    }

    /**
     * 
     * @returns {UpdateTaskResult} 
     */
    get_Result() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateTaskResult(value)
    }

    /**
     * 
     * @returns {IVectorView<UpdateStageRecord>} 
     */
    get_StageRecords() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UpdateStageRecord, value)
    }
}
