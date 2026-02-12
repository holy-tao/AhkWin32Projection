#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletManagerSystemStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a static method to get an instance of the system wallet store for this app.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletmanagersystem
 * @namespace Windows.ApplicationModel.Wallet.System
 * @version WindowsRuntime 1.4
 */
class WalletManagerSystem extends IInspectable {
;@region Static Methods
    /**
     * Requests an instance of the system wallet store for the app.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncOperation<WalletItemSystemStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletmanagersystem.requeststoreasync
     */
    static RequestStoreAsync() {
        if (!WalletManagerSystem.HasProp("__IWalletManagerSystemStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.System.WalletManagerSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWalletManagerSystemStatics.IID)
            WalletManagerSystem.__IWalletManagerSystemStatics := IWalletManagerSystemStatics(factoryPtr)
        }

        return WalletManagerSystem.__IWalletManagerSystemStatics.RequestStoreAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
