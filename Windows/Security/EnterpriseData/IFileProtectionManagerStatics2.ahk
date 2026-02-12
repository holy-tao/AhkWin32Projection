#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ProtectedContainerImportResult.ahk
#Include .\ProtectedContainerExportResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IFileProtectionManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileProtectionManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{83d2a745-0483-41ab-b2d5-bc7f23d74ebb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsContainerAsync", "LoadFileFromContainerWithTargetAndNameCollisionOptionAsync", "SaveFileAsContainerWithSharingAsync"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsContainerAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {IStorageFile} containerFile 
     * @param {IStorageItem} target 
     * @param {Integer} collisionOption 
     * @returns {IAsyncOperation<ProtectedContainerImportResult>} 
     */
    LoadFileFromContainerWithTargetAndNameCollisionOptionAsync(containerFile, target, collisionOption) {
        result := ComCall(7, this, "ptr", containerFile, "ptr", target, "int", collisionOption, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProtectedContainerImportResult, result_)
    }

    /**
     * 
     * @param {IStorageFile} protectedFile 
     * @param {IIterable<HSTRING>} sharedWithIdentities 
     * @returns {IAsyncOperation<ProtectedContainerExportResult>} 
     */
    SaveFileAsContainerWithSharingAsync(protectedFile, sharedWithIdentities) {
        result := ComCall(8, this, "ptr", protectedFile, "ptr", sharedWithIdentities, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProtectedContainerExportResult, result_)
    }
}
