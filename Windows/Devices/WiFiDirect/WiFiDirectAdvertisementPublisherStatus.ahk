#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the possible states of the [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisherstatus
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectAdvertisementPublisherStatus extends Win32Enum{

    /**
     * The initial status of the publisher.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The publisher is started and advertisements are being published.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The publisher is stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 2

    /**
     * The publisher is aborted due to error.
     * @type {Integer (Int32)}
     */
    static Aborted => 3
}
