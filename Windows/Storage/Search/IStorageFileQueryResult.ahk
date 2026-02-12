#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageFileQueryResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFileQueryResult
     * @type {Guid}
     */
    static IID => Guid("{52fda447-2baa-412c-b29f-d4b1778efa1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilesAsync", "GetFilesAsyncDefaultStartAndCount"]

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     */
    GetFilesAsync(startIndex, maxNumberOfItems) {
        result := ComCall(6, this, "uint", startIndex, "uint", maxNumberOfItems, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFile), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     */
    GetFilesAsyncDefaultStartAndCount() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFile), operation)
    }
}
