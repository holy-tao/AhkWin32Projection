#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Status information about the Miracast Receiver's Wi-Fi functionality.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverwifistatus
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverWiFiStatus extends Win32Enum{

    /**
     * It has not been determined if the Wi-Fi adapter supports Miracast.
     * @type {Integer (Int32)}
     */
    static MiracastSupportUndetermined => 0

    /**
     * Miracast is not supported. Possible cause is a missing or incompatible Wi-Fi adapter.
     * @type {Integer (Int32)}
     */
    static MiracastNotSupported => 1

    /**
     * Miracast is supported but the Wi-Fi adapter was not designed for Miracast, which can result in compatibility problems.
     * @type {Integer (Int32)}
     */
    static MiracastSupportNotOptimized => 2

    /**
     * Miracast is supported.
     * @type {Integer (Int32)}
     */
    static MiracastSupported => 3
}
