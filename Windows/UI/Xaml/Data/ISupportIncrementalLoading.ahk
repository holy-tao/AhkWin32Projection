#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Specifies a calling contract for collection views that support incremental loading.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.isupportincrementalloading
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ISupportIncrementalLoading extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportIncrementalLoading
     * @type {Guid}
     */
    static IID => Guid("{7f5ee992-7694-4e6c-a51b-e34bf43de743}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadMoreItemsAsync", "get_HasMoreItems"]

    /**
     * Gets a sentinel value that supports incremental loading implementations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.isupportincrementalloading.hasmoreitems
     * @type {Boolean} 
     */
    HasMoreItems {
        get => this.get_HasMoreItems()
    }

    /**
     * Initializes incremental loading from the view.
     * @param {Integer} count The number of items to load.
     * @returns {IAsyncOperation<LoadMoreItemsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.isupportincrementalloading.loadmoreitemsasync
     */
    LoadMoreItemsAsync(count) {
        result := ComCall(6, this, "uint", count, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetLoadMoreItemsResult(), operation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreItems() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
