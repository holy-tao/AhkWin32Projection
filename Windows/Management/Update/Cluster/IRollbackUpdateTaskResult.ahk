#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UpdateTaskResult.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\UpdateInstallRecord.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IRollbackUpdateTaskResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRollbackUpdateTaskResult
     * @type {Guid}
     */
    static IID => Guid("{477e2a95-bcb6-5044-ad3d-e4180efcf1be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result", "get_InstallRecords"]

    /**
     * @type {UpdateTaskResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {IVectorView<UpdateInstallRecord>} 
     */
    InstallRecords {
        get => this.get_InstallRecords()
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
     * @returns {IVectorView<UpdateInstallRecord>} 
     */
    get_InstallRecords() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UpdateInstallRecord, value)
    }
}
