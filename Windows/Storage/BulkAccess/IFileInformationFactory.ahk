#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\IStorageItemInformation.ahk
#Include .\FileInformation.ahk
#Include .\FolderInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.BulkAccess
 * @version WindowsRuntime 1.4
 */
class IFileInformationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileInformationFactory
     * @type {Guid}
     */
    static IID => Guid("{401d88be-960f-4d6d-a7d0-1a3861e76c83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemsAsync", "GetItemsAsyncDefaultStartAndCount", "GetFilesAsync", "GetFilesAsyncDefaultStartAndCount", "GetFoldersAsync", "GetFoldersAsyncDefaultStartAndCount", "GetVirtualizedItemsVector", "GetVirtualizedFilesVector", "GetVirtualizedFoldersVector"]

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<IStorageItemInformation>>} 
     */
    GetItemsAsync(startIndex, maxItemsToRetrieve) {
        result := ComCall(6, this, "uint", startIndex, "uint", maxItemsToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IStorageItemInformation), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<IStorageItemInformation>>} 
     */
    GetItemsAsyncDefaultStartAndCount() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IStorageItemInformation), operation)
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<FileInformation>>} 
     */
    GetFilesAsync(startIndex, maxItemsToRetrieve) {
        result := ComCall(8, this, "uint", startIndex, "uint", maxItemsToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, FileInformation), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<FileInformation>>} 
     */
    GetFilesAsyncDefaultStartAndCount() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, FileInformation), operation)
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxItemsToRetrieve 
     * @returns {IAsyncOperation<IVectorView<FolderInformation>>} 
     */
    GetFoldersAsync(startIndex, maxItemsToRetrieve) {
        result := ComCall(10, this, "uint", startIndex, "uint", maxItemsToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, FolderInformation), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<FolderInformation>>} 
     */
    GetFoldersAsyncDefaultStartAndCount() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, FolderInformation), operation)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    GetVirtualizedItemsVector() {
        result := ComCall(12, this, "ptr*", &vector := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(vector)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    GetVirtualizedFilesVector() {
        result := ComCall(13, this, "ptr*", &vector := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(vector)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    GetVirtualizedFoldersVector() {
        result := ComCall(14, this, "ptr*", &vector := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(vector)
    }
}
