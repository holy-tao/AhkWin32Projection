#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFolderStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFolderStatics2
     * @type {Guid}
     */
    static IID => Guid("{b4656dc3-71d2-467d-8b29-371f0f62bf6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFolderFromPathForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} path_ 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    GetFolderFromPathForUserAsync(user_, path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(6, this, "ptr", user_, "ptr", path_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }
}
