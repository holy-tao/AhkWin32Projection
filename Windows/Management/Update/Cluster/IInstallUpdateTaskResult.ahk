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
class IInstallUpdateTaskResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallUpdateTaskResult
     * @type {Guid}
     */
    static IID => Guid("{d519090a-4e93-5916-92bb-9356da52344b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result", "get_InstallRecords", "get_ShouldRollback"]

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
     * @type {Boolean} 
     */
    ShouldRollback {
        get => this.get_ShouldRollback()
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

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldRollback() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
