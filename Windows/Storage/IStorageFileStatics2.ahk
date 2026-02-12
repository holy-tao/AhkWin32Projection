#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFile.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFileStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFileStatics2
     * @type {Guid}
     */
    static IID => Guid("{5c76a781-212e-4af9-8f04-740cae108974}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileFromPathForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} path_ 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    GetFileFromPathForUserAsync(user_, path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(6, this, "ptr", user_, "ptr", path_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }
}
