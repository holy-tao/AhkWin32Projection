#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents the action that was taken on the item that caused your app to launch.
 * @remarks
 * When your app is launched as a result of an action on an item in Wallet, the **OnActivated** event handler in your app is called. The [Kind](../windows.applicationmodel.activation/activationkind.md) value in the [IActivatedEventArgs](../windows.applicationmodel.activation/iactivatedeventargs.md) data is **WalletAction**. To access the information specific to wallet activation, cast the [IActivatedEventArgs](../windows.applicationmodel.activation/iactivatedeventargs.md) to [WalletActionActivatedEventArgs](../windows.applicationmodel.activation/walletactionactivatedeventargs.md).
 * 
 * > [!NOTE]
 * > JavaScript uses [Windows.UI.WebUI.IActivatedEventArgs](../windows.ui.webui/iactivatedeventargsdeferral.md) and [WebUIWalletActionActivatedEventArgs](../windows.ui.webui/webuiwalletactionactivatedeventargs.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletactionkind
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletActionKind extends Win32Enum{

    /**
     * The item was opened.
     * @type {Integer (Int32)}
     */
    static OpenItem => 0

    /**
     * A transaction was tapped.
     * @type {Integer (Int32)}
     */
    static Transaction => 1

    /**
     * The UI item "see more transactions" was tapped.
     * @type {Integer (Int32)}
     */
    static MoreTransactions => 2

    /**
     * A message was tapped.
     * @type {Integer (Int32)}
     */
    static Message => 3

    /**
     * A verb was tapped.
     * @type {Integer (Int32)}
     */
    static Verb => 4
}
