#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used to specify whether transfers can occur on metered networks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercostpolicy
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferCostPolicy extends Win32Enum{

    /**
     * Allow transfers on metered networks.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Do not allow transfers on metered networks.
     * @type {Integer (Int32)}
     */
    static UnrestrictedOnly => 1

    /**
     * Always download regardless of network cost. (for example, even while a user is roaming)
     * 
     * > [!NOTE]
     * > This behavior is based only on network cost policy, and doesn't affect other app scenarios, like system suspension.
     * @type {Integer (Int32)}
     */
    static Always => 2
}
