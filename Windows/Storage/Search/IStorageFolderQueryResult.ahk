#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\StorageFolder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageFolderQueryResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFolderQueryResult
     * @type {Guid}
     */
    static IID => Guid("{6654c911-7d66-46fa-aecf-e4a4baa93ab8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFoldersAsync", "GetFoldersAsyncDefaultStartAndCount"]

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     */
    GetFoldersAsync(startIndex, maxNumberOfItems) {
        result := ComCall(6, this, "uint", startIndex, "uint", maxNumberOfItems, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFolder), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     */
    GetFoldersAsyncDefaultStartAndCount() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFolder), operation)
    }
}
