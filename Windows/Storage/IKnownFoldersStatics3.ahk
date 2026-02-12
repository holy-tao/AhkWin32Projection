#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IKnownFoldersStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownFoldersStatics3
     * @type {Guid}
     */
    static IID => Guid("{c5194341-9742-4ed5-823d-fc1401148764}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFolderForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @param {Integer} folderId 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    GetFolderForUserAsync(user_, folderId) {
        result := ComCall(6, this, "ptr", user_, "int", folderId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }
}
