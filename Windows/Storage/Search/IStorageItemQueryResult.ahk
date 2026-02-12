#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\IStorageItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageItemQueryResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemQueryResult
     * @type {Guid}
     */
    static IID => Guid("{e8948079-9d58-47b8-b2b2-41b07f4795f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemsAsync", "GetItemsAsyncDefaultStartAndCount"]

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     */
    GetItemsAsync(startIndex, maxNumberOfItems) {
        result := ComCall(6, this, "uint", startIndex, "uint", maxNumberOfItems, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IStorageItem), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     */
    GetItemsAsyncDefaultStartAndCount() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IStorageItem), operation)
    }
}
