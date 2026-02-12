#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used for [WiFiDirectServiceAdvertiser.AdvertisementStatus](wifidirectserviceadvertiser_advertisementstatus.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceadvertisementstatus
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceAdvertisementStatus extends Win32Enum{

    /**
     * Advertiser has been created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * Advertiser has been started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * Advertiser has been stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 2

    /**
     * Advertiser has been aborted. The advertiser object's [ServiceError](wifidirectserviceadvertiser_serviceerror.md) property has a specific error code describing the reason.
     * @type {Integer (Int32)}
     */
    static Aborted => 3
}
