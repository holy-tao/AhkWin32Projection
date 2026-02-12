#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible results from setting permissions using the [CortanaPermissionsManager](cortanapermissionsmanager.md).
 * @remarks
 * The [CortanaPermissionManager](cortanapermissionsmanager.md) class requires the following be added to the Package.appmanifest:
 * 
 * - To \<Package\>
 *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *   - `IgnorableNamespaces="rescap"`
 * - Under \<Capabilities\>
 *   - `<rescap:capability name="cortanaPermissions"/>`
 * 
 * - "iot" to the list of **IgnorableNamespaces**
 *   - `<iot:Capability Name="systemManagement"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermissionschangeresult
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class CortanaPermissionsChangeResult extends Win32Enum{

    /**
     * Setting all permissions succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Setting one or more permissions failed.
     * @type {Integer (Int32)}
     */
    static Unavailable => 1

    /**
     * Changes to settings are not permitted.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 2
}
