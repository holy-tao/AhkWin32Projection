#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used to indicate if downloads and uploads within a [BackgroundTransferGroup](backgroundtransfergroup.md) run in simultaneously or in serial.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransferbehavior
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferBehavior extends Win32Enum{

    /**
     * Background Transfer operations run simultaneously.
     * @type {Integer (Int32)}
     */
    static Parallel => 0

    /**
     * Background Transfer operations run in serial.
     * @type {Integer (Int32)}
     */
    static Serialized => 1
}
