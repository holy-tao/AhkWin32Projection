#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\FileProtectionInfo.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ProtectedContainerExportResult.ahk
#Include .\ProtectedContainerImportResult.ahk
#Include .\ProtectedFileCreateResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IFileProtectionManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileProtectionManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{5846fc9b-e613-426b-bb38-88cba1dc9adb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProtectAsync", "CopyProtectionAsync", "GetProtectionInfoAsync", "SaveFileAsContainerAsync", "LoadFileFromContainerAsync", "LoadFileFromContainerWithTargetAsync", "CreateProtectedAndOpenAsync"]

    /**
     * 
     * @param {IStorageItem} target 
     * @param {HSTRING} identity 
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     */
    ProtectAsync(target, identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(6, this, "ptr", target, "ptr", identity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FileProtectionInfo, result_)
    }

    /**
     * 
     * @param {IStorageItem} source 
     * @param {IStorageItem} target 
     * @returns {IAsyncOperation<Boolean>} 
     */
    CopyProtectionAsync(source, target) {
        result := ComCall(7, this, "ptr", source, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {IStorageItem} source 
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     */
    GetProtectionInfoAsync(source) {
        result := ComCall(8, this, "ptr", source, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FileProtectionInfo, result_)
    }

    /**
     * 
     * @param {IStorageFile} protectedFile 
     * @returns {IAsyncOperation<ProtectedContainerExportResult>} 
     */
    SaveFileAsContainerAsync(protectedFile) {
        result := ComCall(9, this, "ptr", protectedFile, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProtectedContainerExportResult, result_)
    }

    /**
     * 
     * @param {IStorageFile} containerFile 
     * @returns {IAsyncOperation<ProtectedContainerImportResult>} 
     */
    LoadFileFromContainerAsync(containerFile) {
        result := ComCall(10, this, "ptr", containerFile, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProtectedContainerImportResult, result_)
    }

    /**
     * 
     * @param {IStorageFile} containerFile 
     * @param {IStorageItem} target 
     * @returns {IAsyncOperation<ProtectedContainerImportResult>} 
     */
    LoadFileFromContainerWithTargetAsync(containerFile, target) {
        result := ComCall(11, this, "ptr", containerFile, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProtectedContainerImportResult, result_)
    }

    /**
     * 
     * @param {IStorageFolder} parentFolder 
     * @param {HSTRING} desiredName 
     * @param {HSTRING} identity 
     * @param {Integer} collisionOption 
     * @returns {IAsyncOperation<ProtectedFileCreateResult>} 
     */
    CreateProtectedAndOpenAsync(parentFolder, desiredName, identity, collisionOption) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(12, this, "ptr", parentFolder, "ptr", desiredName, "ptr", identity, "int", collisionOption, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProtectedFileCreateResult, result_)
    }
}
