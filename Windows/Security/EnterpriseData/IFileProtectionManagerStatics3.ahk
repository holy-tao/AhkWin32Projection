#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\FileProtectionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IFileProtectionManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileProtectionManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{6918849a-624f-46d6-b241-e9cd5fdf3e3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnprotectAsync", "UnprotectWithOptionsAsync"]

    /**
     * 
     * @param {IStorageItem} target 
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     */
    UnprotectAsync(target) {
        result := ComCall(6, this, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FileProtectionInfo, result_)
    }

    /**
     * 
     * @param {IStorageItem} target 
     * @param {FileUnprotectOptions} options 
     * @returns {IAsyncOperation<FileProtectionInfo>} 
     */
    UnprotectWithOptionsAsync(target, options) {
        result := ComCall(7, this, "ptr", target, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FileProtectionInfo, result_)
    }
}
