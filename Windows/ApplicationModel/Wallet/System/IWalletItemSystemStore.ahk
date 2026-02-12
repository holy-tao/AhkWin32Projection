#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\WalletItem.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet.System
 * @version WindowsRuntime 1.4
 */
class IWalletItemSystemStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletItemSystemStore
     * @type {Guid}
     */
    static IID => Guid("{522e2bff-96a2-4a17-8d19-fe1d9f837561}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemsAsync", "DeleteAsync", "ImportItemAsync", "GetAppStatusForItem", "LaunchAppForItemAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<WalletItem>>} 
     */
    GetItemsAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WalletItem), operation)
    }

    /**
     * 
     * @param {WalletItem} item 
     * @returns {IAsyncAction} 
     */
    DeleteAsync(item) {
        result := ComCall(7, this, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} stream 
     * @returns {IAsyncOperation<WalletItem>} 
     */
    ImportItemAsync(stream) {
        result := ComCall(8, this, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WalletItem, operation)
    }

    /**
     * 
     * @param {WalletItem} item 
     * @returns {Integer} 
     */
    GetAppStatusForItem(item) {
        result := ComCall(9, this, "ptr", item, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {WalletItem} item 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchAppForItemAsync(item) {
        result := ComCall(10, this, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
