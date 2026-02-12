#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Describes the position in the detail view of a wallet item that a [WalletItemCustomProperty](walletitemcustomproperty.md) record should be displayed at.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletdetailviewposition
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletDetailViewPosition extends Win32Enum{

    /**
     * This property is hidden from the detail view of the wallet item, but will be displayed on the back-of-card view of the item.
     * @type {Integer (Int32)}
     */
    static Hidden => 0

    /**
     * The first header slot in UI.
     * @type {Integer (Int32)}
     */
    static HeaderField1 => 1

    /**
     * The second header slot in UI.
     * @type {Integer (Int32)}
     */
    static HeaderField2 => 2

    /**
     * The first content slot in UI.
     * @type {Integer (Int32)}
     */
    static PrimaryField1 => 3

    /**
     * The second content slot in UI.
     * @type {Integer (Int32)}
     */
    static PrimaryField2 => 4

    /**
     * The first content slot in UI under Header2.
     * @type {Integer (Int32)}
     */
    static SecondaryField1 => 5

    /**
     * The second content slot in UI under Header2.
     * @type {Integer (Int32)}
     */
    static SecondaryField2 => 6

    /**
     * The third content slot in UI under Header2.
     * @type {Integer (Int32)}
     */
    static SecondaryField3 => 7

    /**
     * The fourth content slot in UI under Header2.
     * @type {Integer (Int32)}
     */
    static SecondaryField4 => 8

    /**
     * The fifth content slot in UI under Header2.
     * @type {Integer (Int32)}
     */
    static SecondaryField5 => 9

    /**
     * If the value of the property at this position contains a URL (**http:// or https:///*), the data is displayed as a button that can navigate to that URL.
     * @type {Integer (Int32)}
     */
    static CenterField1 => 10

    /**
     * The first footer slot in UI.
     * @type {Integer (Int32)}
     */
    static FooterField1 => 11

    /**
     * The second footer slot in UI.
     * @type {Integer (Int32)}
     */
    static FooterField2 => 12

    /**
     * The third footer slot in UI.
     * @type {Integer (Int32)}
     */
    static FooterField3 => 13

    /**
     * The fourth footer slot in UI.
     * @type {Integer (Int32)}
     */
    static FooterField4 => 14
}
