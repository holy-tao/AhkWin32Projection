#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values used by the [GetAppStatusForItem](walletitemsystemstore_getappstatusforitem_1214253302.md) method indicating if an app is installed for the specified [WalletItem](../windows.applicationmodel.wallet/walletitem.md).
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.system.walletitemappassociation
 * @namespace Windows.ApplicationModel.Wallet.System
 * @version WindowsRuntime 1.4
 */
class WalletItemAppAssociation extends Win32Enum{

    /**
     * There is no app associated with the wallet item.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The app for the wallet item is installed on this device.
     * @type {Integer (Int32)}
     */
    static AppInstalled => 1

    /**
     * An app exists for the wallet item, but it is not installed on the device.
     * @type {Integer (Int32)}
     */
    static AppNotInstalled => 2
}
