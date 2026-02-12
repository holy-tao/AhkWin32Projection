#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AcquireEnvironmentInfoResult.ahk
#Include .\ValidateClusterEnvironmentResult.ahk
#Include .\UpdateOperationResult.ahk
#Include .\UpdatePendingOperationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IClusterNativeEnvironmentOperations extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClusterNativeEnvironmentOperations
     * @type {Guid}
     */
    static IID => Guid("{a6d3d05e-1cfe-5363-b745-c6981d0e6b25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireNodeEnvironmentInfo", "ValidateClusterEnvironment", "StartPreUpdateRunOperation", "IsPreUpdateRunOperationComplete", "StartPostUpdateRunOperation", "IsPostUpdateRunOperationComplete"]

    /**
     * 
     * @returns {AcquireEnvironmentInfoResult} 
     */
    AcquireNodeEnvironmentInfo() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AcquireEnvironmentInfoResult(result_)
    }

    /**
     * 
     * @param {IMapView<HSTRING, HSTRING>} nodeEnvironmentInfo 
     * @returns {ValidateClusterEnvironmentResult} 
     */
    ValidateClusterEnvironment(nodeEnvironmentInfo) {
        result := ComCall(7, this, "ptr", nodeEnvironmentInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValidateClusterEnvironmentResult(result_)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    StartPreUpdateRunOperation() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePendingOperationResult(result_)
    }
}
