#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents the kinds (classifications) of wallet items supported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemkind
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletItemKind extends Win32Enum{

    /**
     * The item is invalid.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * A deal.
     * @type {Integer (Int32)}
     */
    static Deal => 1

    /**
     * A general item.
     * @type {Integer (Int32)}
     */
    static General => 2

    /**
     * A payment instrument.
     * @type {Integer (Int32)}
     */
    static PaymentInstrument => 3

    /**
     * A ticket.
     * @type {Integer (Int32)}
     */
    static Ticket => 4

    /**
     * A boarding pass.
     * @type {Integer (Int32)}
     */
    static BoardingPass => 5

    /**
     * A membership card.
     * @type {Integer (Int32)}
     */
    static MembershipCard => 6
}
