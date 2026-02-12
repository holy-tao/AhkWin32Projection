#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\WalletItem.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class IWalletItemStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletItemStore
     * @type {Guid}
     */
    static IID => Guid("{7160484b-6d49-48f8-91a9-40a1d0f13ef4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAsync", "ClearAsync", "GetWalletItemAsync", "GetItemsAsync", "GetItemsWithKindAsync", "ImportItemAsync", "DeleteAsync", "ShowAsync", "ShowItemAsync", "UpdateAsync"]

    /**
     * 
     * @param {HSTRING} id 
     * @param {WalletItem} item 
     * @returns {IAsyncAction} 
     */
    AddAsync(id, item) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "ptr", id, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<WalletItem>} 
     */
    GetWalletItemAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(8, this, "ptr", id, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WalletItem, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<WalletItem>>} 
     */
    GetItemsAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WalletItem), operation)
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {IAsyncOperation<IVectorView<WalletItem>>} 
     */
    GetItemsWithKindAsync(kind) {
        result := ComCall(10, this, "int", kind, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WalletItem), operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} stream 
     * @returns {IAsyncOperation<WalletItem>} 
     */
    ImportItemAsync(stream) {
        result := ComCall(11, this, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WalletItem, operation)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncAction} 
     */
    DeleteAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(12, this, "ptr", id, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ShowAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncAction} 
     */
    ShowItemAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(14, this, "ptr", id, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {WalletItem} item 
     * @returns {IAsyncAction} 
     */
    UpdateAsync(item) {
        result := ComCall(15, this, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
