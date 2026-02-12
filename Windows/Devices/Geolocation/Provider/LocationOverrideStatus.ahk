#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of a call to the location override API.
  * 
  * > [!NOTE]
  * > To call location-override APIs, an app must declare the `runFullTrust`
  * > [restricted capability](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
  * 
  * > [!IMPORTANT]
  * > The [Windows.Devices.Geolocation.Provider](/uwp/api/windows.devices.geolocation.provider.geolocationprovider) APIs are
  * > part of a Limited Access Feature (see
  * > [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to
  * > request an unlock token, please use the
  * > [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * LocationOverrideStatus values are returned by
 * [SetOverridePosition](geolocationprovider_setoverrideposition_807670976.md) operations to indicate whether the location
 * override was established successfully.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.provider.locationoverridestatus
 * @namespace Windows.Devices.Geolocation.Provider
 * @version WindowsRuntime 1.4
 */
class LocationOverrideStatus extends Win32Enum{

    /**
     * Specifies that the override API succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Specifies that the override API failed due to access denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 1

    /**
     * Specifies that an override instance is already acquired by other application.
     * @type {Integer (Int32)}
     */
    static AlreadyStarted => 2

    /**
     * Specifies an unknown status.
     * @type {Integer (Int32)}
     */
    static Other => 3
}
