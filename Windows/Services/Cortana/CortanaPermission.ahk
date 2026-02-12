#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the Cortana permissions available to a [CortanaPermissionManager](cortanapermissionsmanager.md) object.
 * @remarks
 * The [CortanaPermissionManager](cortanapermissionsmanager.md) class requires the following be added to the Package.appmanifest:
 * 
 * - To \<Package\>
 *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *   - `IgnorableNamespaces="rescap"`
 * - Under \<Capabilities\>
 *   - `<rescap:capability name="cortanaPermissions"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermission
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class CortanaPermission extends Win32Enum{

    /**
     * Cortana can access the user's web browsing history.
     * @type {Integer (Int32)}
     */
    static BrowsingHistory => 0

    /**
     * Cortana can access the user's calendar.
     * @type {Integer (Int32)}
     */
    static Calendar => 1

    /**
     * Cortana can access the user's call history.
     * @type {Integer (Int32)}
     */
    static CallHistory => 2

    /**
     * Cortana can access the user's contacts.
     * @type {Integer (Int32)}
     */
    static Contacts => 3

    /**
     * Cortana can send email.
     * @type {Integer (Int32)}
     */
    static Email => 4

    /**
     * Cortana can access input personalization settings.
     * @type {Integer (Int32)}
     */
    static InputPersonalization => 5

    /**
     * Cortana can access the user's location.
     * @type {Integer (Int32)}
     */
    static Location => 6

    /**
     * Cortana can send text messages.
     * @type {Integer (Int32)}
     */
    static Messaging => 7

    /**
     * Cortana can access the microphone.
     * @type {Integer (Int32)}
     */
    static Microphone => 8

    /**
     * Cortana personalization settings are exposed.
     * @type {Integer (Int32)}
     */
    static Personalization => 9

    /**
     * Cortana can make phone calls.
     * @type {Integer (Int32)}
     */
    static PhoneCall => 10
}
