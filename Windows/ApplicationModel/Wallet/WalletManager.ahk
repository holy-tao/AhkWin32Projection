#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Provides a static method to get an instance of the default wallet store for this app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletmanager
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletManager extends IInspectable {
;@region Static Methods
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Requests an instance of the default wallet store for the app.
     * @returns {IAsyncOperation<WalletItemStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletmanager.requeststoreasync
     */
    static RequestStoreAsync() {
        if (!WalletManager.HasProp("__IWalletManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWalletManagerStatics.IID)
            WalletManager.__IWalletManagerStatics := IWalletManagerStatics(factoryPtr)
        }

        return WalletManager.__IWalletManagerStatics.RequestStoreAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
