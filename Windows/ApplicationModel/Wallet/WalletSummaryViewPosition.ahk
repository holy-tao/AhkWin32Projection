#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Describes the position in the summary view of a wallet item that a [WalletItemCustomProperty](walletitemcustomproperty.md) should be displayed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletsummaryviewposition
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletSummaryViewPosition extends Win32Enum{

    /**
     * The item is hidden in the summary view.
     * @type {Integer (Int32)}
     */
    static Hidden => 0

    /**
     * The first summary line.
     * @type {Integer (Int32)}
     */
    static Field1 => 1

    /**
     * The second summary line.
     * @type {Integer (Int32)}
     */
    static Field2 => 2
}
