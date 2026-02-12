#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletItemSystemStore.ahk
#Include .\IWalletItemSystemStore2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\WalletItemSystemStore.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Defines a set of asynchronous actions and operations that manage the wallet items in the system wallet database. These can be used to read the existing items, or to add and remove items.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
  * 
  * Call the [WalletManagerSystem.RequestStoreAsync](walletmanagersystem_requeststoreasync_428591920.md)method to obtain an instance of this class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletitemsystemstore
 * @namespace Windows.ApplicationModel.Wallet.System
 * @version WindowsRuntime 1.4
 */
class WalletItemSystemStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletItemSystemStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletItemSystemStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemsChangedToken")) {
            this.remove_ItemsChanged(this.__OnItemsChangedToken)
            this.__OnItemsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Returns the collection of all system wallet items owned by this app.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncOperation<IVectorView<WalletItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletitemsystemstore.getitemsasync
     */
    GetItemsAsync() {
        if (!this.HasProp("__IWalletItemSystemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemSystemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemSystemStore := IWalletItemSystemStore(outPtr)
        }

        return this.__IWalletItemSystemStore.GetItemsAsync()
    }

    /**
     * Asynchronously removes a specific wallet item with the given ID from the wallet system data store.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {WalletItem} item The ID of the wallet item to remove from the system data store.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletitemsystemstore.deleteasync
     */
    DeleteAsync(item) {
        if (!this.HasProp("__IWalletItemSystemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemSystemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemSystemStore := IWalletItemSystemStore(outPtr)
        }

        return this.__IWalletItemSystemStore.DeleteAsync(item)
    }

    /**
     * Imports data from a ".mswallet" XML file into the system wallet store.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {IRandomAccessStreamReference} stream The ".mswallet" file to import.
     * @returns {IAsyncOperation<WalletItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletitemsystemstore.importitemasync
     */
    ImportItemAsync(stream) {
        if (!this.HasProp("__IWalletItemSystemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemSystemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemSystemStore := IWalletItemSystemStore(outPtr)
        }

        return this.__IWalletItemSystemStore.ImportItemAsync(stream)
    }

    /**
     * Gets a [WalletItemAppAssociation](walletitemappassociation.md) value indicating if an app is installed for the specified [WalletItem](../windows.applicationmodel.wallet/walletitem.md).
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {WalletItem} item The item for which to retrieve the status.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletitemsystemstore.getappstatusforitem
     */
    GetAppStatusForItem(item) {
        if (!this.HasProp("__IWalletItemSystemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemSystemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemSystemStore := IWalletItemSystemStore(outPtr)
        }

        return this.__IWalletItemSystemStore.GetAppStatusForItem(item)
    }

    /**
     * Launches the app that is associated with the given wallet item.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {WalletItem} item The wallet item to launch an app for.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletitemsystemstore.launchappforitemasync
     */
    LaunchAppForItemAsync(item) {
        if (!this.HasProp("__IWalletItemSystemStore")) {
            if ((queryResult := this.QueryInterface(IWalletItemSystemStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemSystemStore := IWalletItemSystemStore(outPtr)
        }

        return this.__IWalletItemSystemStore.LaunchAppForItemAsync(item)
    }

    /**
     * 
     * @param {TypedEventHandler<WalletItemSystemStore, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemsChanged(handler) {
        if (!this.HasProp("__IWalletItemSystemStore2")) {
            if ((queryResult := this.QueryInterface(IWalletItemSystemStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemSystemStore2 := IWalletItemSystemStore2(outPtr)
        }

        return this.__IWalletItemSystemStore2.add_ItemsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ItemsChanged(cookie) {
        if (!this.HasProp("__IWalletItemSystemStore2")) {
            if ((queryResult := this.QueryInterface(IWalletItemSystemStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemSystemStore2 := IWalletItemSystemStore2(outPtr)
        }

        return this.__IWalletItemSystemStore2.remove_ItemsChanged(cookie)
    }

;@endregion Instance Methods
}
