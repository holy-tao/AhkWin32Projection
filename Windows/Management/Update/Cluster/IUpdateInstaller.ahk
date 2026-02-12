#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ScanUpdateTaskResult.ahk
#Include .\StageUpdateTaskResult.ahk
#Include .\InstallUpdateTaskResult.ahk
#Include .\RollbackUpdateTaskResult.ahk
#Include .\UpdateTaskResult.ahk
#Include .\ValidateAllNodesUpdateRecipeResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Installs or uninstalls updates from or onto a computer.
 * @remarks
 * This interface can be instantiated by using the UpdateInstaller coclass. Use the Microsoft.Update.Installer program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iupdateinstaller
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateInstaller extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateInstaller
     * @type {Guid}
     */
    static IID => Guid("{c8cfe973-daaf-57d3-8d3b-59eec0b082ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Scan", "Stage", "Install", "Rollback", "ShouldUsePluginSpecificReboot", "RebootNode", "AcquireUpdateListValidationInfo", "ValidateAllNodesUpdateRecipe"]

    /**
     * Scan:Started Event Class
     * @returns {ScanUpdateTaskResult} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/event-classes/scan-started-event-class
     */
    Scan() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScanUpdateTaskResult(result_)
    }

    /**
     * Creates a new instance of the [StagePackageOptions](stagepackageoptions.md) class.
     * @param {IVectorView<UpdateScanRecord>} updatesToStage 
     * @returns {StageUpdateTaskResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.#ctor
     */
    Stage(updatesToStage) {
        result := ComCall(7, this, "ptr", updatesToStage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StageUpdateTaskResult(result_)
    }

    /**
     * Starts a synchronous installation of the updates.
     * @remarks
     * This method returns WU_E_NO_UPDATE if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_updates">Updates</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> is not set. This method also returns WU_E_NO_UPDATE if the  <b>Updates</b> property is set to an empty collection.
     * @param {IVectorView<UpdateScanRecord>} updatesToInstall 
     * @returns {InstallUpdateTaskResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdateinstaller-install
     */
    Install(updatesToInstall) {
        result := ComCall(8, this, "ptr", updatesToInstall, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InstallUpdateTaskResult(result_)
    }

    /**
     * Indicates that the resource manager (RM) has successfully completed rolling back a transaction.
     * @remarks
     * If the RM was not able to successfully roll back a transaction, the RM should request a full rollback by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-rollbacktransaction">RollbackTransaction</a> function.
     * @param {IVectorView<UpdateScanRecord>} updatesToRollback 
     * @returns {RollbackUpdateTaskResult} 
     * @see https://learn.microsoft.com/windows/win32/api//content/ktmw32/nf-ktmw32-rollbackcomplete
     */
    Rollback(updatesToRollback) {
        result := ComCall(9, this, "ptr", updatesToRollback, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RollbackUpdateTaskResult(result_)
    }

    /**
     * 
     * @param {Pointer<Boolean>} usePluginReboot 
     * @returns {UpdateTaskResult} 
     */
    ShouldUsePluginSpecificReboot(usePluginReboot) {
        result := ComCall(10, this, "ptr", usePluginReboot, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateTaskResult(result_)
    }

    /**
     * 
     * @returns {UpdateTaskResult} 
     */
    RebootNode() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateTaskResult(result_)
    }

    /**
     * 
     * @param {Pointer<HSTRING>} recipeValidationInfo 
     * @returns {UpdateTaskResult} 
     */
    AcquireUpdateListValidationInfo(recipeValidationInfo) {
        result := ComCall(12, this, "ptr", recipeValidationInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateTaskResult(result_)
    }

    /**
     * 
     * @param {IVectorView<UpdateRecipeNodeValidationInfoRecord>} allNodesRecipeValidationInfo 
     * @returns {ValidateAllNodesUpdateRecipeResult} 
     */
    ValidateAllNodesUpdateRecipe(allNodesRecipeValidationInfo) {
        result := ComCall(13, this, "ptr", allNodesRecipeValidationInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValidateAllNodesUpdateRecipeResult(result_)
    }
}
