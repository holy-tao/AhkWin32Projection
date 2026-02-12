#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageLibrary.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageLibraryStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibraryStatics2
     * @type {Guid}
     */
    static IID => Guid("{ffb08ddc-fa75-4695-b9d1-7f81f97832e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLibraryForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @param {Integer} libraryId 
     * @returns {IAsyncOperation<StorageLibrary>} 
     */
    GetLibraryForUserAsync(user_, libraryId) {
        result := ComCall(6, this, "ptr", user_, "int", libraryId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageLibrary, operation)
    }
}
