#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherStatics3
     * @type {Guid}
     */
    static IID => Guid("{234261a8-9db3-4683-aa42-dc6f51d33847}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchFolderAsync", "LaunchFolderWithOptionsAsync"]

    /**
     * 
     * @param {IStorageFolder} folder_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFolderAsync(folder_) {
        result := ComCall(6, this, "ptr", folder_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {IStorageFolder} folder_ 
     * @param {FolderLauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFolderWithOptionsAsync(folder_, options) {
        result := ComCall(7, this, "ptr", folder_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
