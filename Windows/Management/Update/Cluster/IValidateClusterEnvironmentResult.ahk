#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UpdateTaskResult.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\UpdateValidationLogMessage.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IValidateClusterEnvironmentResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValidateClusterEnvironmentResult
     * @type {Guid}
     */
    static IID => Guid("{4df22928-9fde-5c16-961c-aab26f4a7780}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result", "get_ApprovalStatus", "get_ValidationMessages"]

    /**
     * @type {UpdateTaskResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {Integer} 
     */
    ApprovalStatus {
        get => this.get_ApprovalStatus()
    }

    /**
     * @type {IVectorView<UpdateValidationLogMessage>} 
     */
    ValidationMessages {
        get => this.get_ValidationMessages()
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
     * @returns {Integer} 
     */
    get_ApprovalStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<UpdateValidationLogMessage>} 
     */
    get_ValidationMessages() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UpdateValidationLogMessage, value)
    }
}
