#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletItemStore.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Defines a set of asynchronous actions and operations that manage the wallet items in the wallet database. These can be used to read the existing items, or to add and remove items.
 * @remarks
 * Call the [WalletManager.RequestStoreAsync](walletmanager_requeststoreasync_428591920.md) method to obtain an instance of this class.
 * 
 * Most of the APIs for this class can be seen in example usages in the [Quickstart: Using the   APIs](/previous-versions/windows/apps/dn631257(v=win.10)) topic.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletItemStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletItemStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletItemStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Adds a new wallet item to the wallet.
     * @remarks
     * If the *id* value passed in to this method is not unique, or if the item has already been added to the wallet, an exception is thrown. How to handle errors/exceptions varies by programming language, particularly so when calling asynchronous methods. See [Asynchronous programming](/windows/uwp/threading-async/asynchronous-programming-universal-windows-platform-apps).
     * 
     * Remember that when you call this method, the item is added to the wallet item store, which is owned by the device not the app. While you're still developing, the store persists across app sessions, and so attempting to add the same item again when running another debug session can throw an exception because the item's already there. Consider adding a call to [ClearAsync](walletitemstore_clearasync_1031039026.md) before you attempt to add any items and you've run your code more than once, at least while you're still developing and testing your code.
     * @param {HSTRING} id The identifier of the wallet item. This value must be unique. This sets the initial [WalletItem.Id](walletitem_id.md) value (the identifier is for the [WalletItemStore](walletitemstore.md) store, and isn't part of the initialization of a [WalletItem](walletitem.md) object.
     * @param {WalletItem} item The wallet item to add to the wallet.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.addasync
     */
    AddAsync(id, item) {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.AddAsync(id, item)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Clears all app-owned wallet items from the wallet data store.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.clearasync
     */
    ClearAsync() {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.ClearAsync()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets an individual wallet item with the given ID from the wallet database. The item requested must be owned by this app.
     * @param {HSTRING} id The ID of the wallet item.
     * @returns {IAsyncOperation<WalletItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.getwalletitemasync
     */
    GetWalletItemAsync(id) {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.GetWalletItemAsync(id)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Returns the collection of wallet items of the given type that are owned by this app.
     * @returns {IAsyncOperation<IVectorView<WalletItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.getitemsasync
     */
    GetItemsAsync() {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.GetItemsAsync()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Returns the collection of all wallet items owned by this app.
     * @param {Integer} kind 
     * @returns {IAsyncOperation<IVectorView<WalletItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.getitemsasync
     */
    GetItemsWithKindAsync(kind) {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.GetItemsWithKindAsync(kind)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Imports data from a ".mswallet" XML file into the wallet store.".mswallet" is an XML serialization format for wallet item info. For a guide to the ".mswallet" format (and a link to schema in XSD), see [Quickstart: Creating and distributing .mswallet files](/previous-versions/windows/apps/dn631256(v=win.10)).
     * @param {IRandomAccessStreamReference} stream The ".mswallet" file to import.
     * @returns {IAsyncOperation<WalletItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.importitemasync
     */
    ImportItemAsync(stream) {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.ImportItemAsync(stream)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Removes a specific wallet item with the given ID from the wallet data store.
     * @param {HSTRING} id The ID of the wallet item to remove from the data store.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.deleteasync
     */
    DeleteAsync(id) {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.DeleteAsync(id)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Displays the item with the given ID in the Wallet UI.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.showasync
     */
    ShowAsync() {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.ShowAsync()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Displays the Wallet UI.
     * @param {HSTRING} id 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.showasync
     */
    ShowItemAsync(id) {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.ShowItemAsync(id)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Updates a wallet item in the shared store, based on the changed values in the [WalletItem](walletitem.md) object provided.
     * @remarks
     * An exception is thrown if the item doesn't already exist in the wallet. How to handle errors/exceptions varies by programming language, particularly so when calling asynchronous methods. See [Asynchronous programming](/windows/uwp/threading-async/asynchronous-programming-universal-windows-platform-apps).
     * 
     * Most of the APIs for this class can be seen in example usages in the [Quickstart: Using the   APIs](/previous-versions/windows/apps/dn631257(v=win.10)) topic.
     * @param {WalletItem} item The updated data for the wallet item.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemstore.updateasync
     */
    UpdateAsync(item) {
        if (!this.HasProp("__IWalletItemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemStore := IWalletItemStore(outPtr)
        }

        return this.__IWalletItemStore.UpdateAsync(item)
    }

;@endregion Instance Methods
}
