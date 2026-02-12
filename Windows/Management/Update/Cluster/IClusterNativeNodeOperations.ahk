#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AreRebootsPendingResult.ahk
#Include .\UpdateOperationResult.ahk
#Include .\UpdatePendingOperationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IClusterNativeNodeOperations extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClusterNativeNodeOperations
     * @type {Guid}
     */
    static IID => Guid("{ce23db69-b72b-5204-9d1c-c53d0b2d803d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AreAdditionalRebootsPending", "StartPreRebootOperation", "IsPreRebootOperationComplete", "StartPostRebootOperation", "IsPostRebootOperationComplete", "StartPreDrainOperation", "IsPreDrainOperationComplete", "StartPostResumeOperation", "IsPostResumeOperationComplete", "StartPreUpdateRunOperation", "IsPreUpdateRunOperationComplete", "StartPostUpdateRunOperation", "IsPostUpdateRunOperationComplete"]

    /**
     * 
     * @returns {AreRebootsPendingResult} 
     */
    AreAdditionalRebootsPending() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AreRebootsPendingResult(result_)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    StartPreRebootOperation() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdatePendingOperationResult} 
     */
    IsPreRebootOperationComplete() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePendingOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    StartPostRebootOperation() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdatePendingOperationResult} 
     */
    IsPostRebootOperationComplete() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePendingOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    StartPreDrainOperation() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdatePendingOperationResult} 
     */
    IsPreDrainOperationComplete() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePendingOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    StartPostResumeOperation() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdatePendingOperationResult} 
     */
    IsPostResumeOperationComplete() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePendingOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    StartPreUpdateRunOperation() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdatePendingOperationResult} 
     */
    IsPreUpdateRunOperationComplete() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePendingOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    StartPostUpdateRunOperation() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateOperationResult(result_)
    }

    /**
     * 
     * @returns {UpdatePendingOperationResult} 
     */
    IsPostUpdateRunOperationComplete() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePendingOperationResult(result_)
    }
}
