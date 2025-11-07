#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Returns information for the cloud files platform. This is intended for sync providers running on multiple versions of Windows.
 * @remarks
 * 
 * The platform is a combination of the cloud filter and the placeholder files API library, which are always kept in sync with each other. This API is intended for sync providers that need to make decisions based on the platform capabilities of multiple versions of Windows.
 * 
 * If you are building an app that uses or is aware of placeholder files, this may be useful to you.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_platform_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLATFORM_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The build number of the Windows platform version. Changes when the platform is serviced by a Windows update.
     * @type {Integer}
     */
    BuildNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The revision number of the Windows platform version. Changes when the platform is serviced by a Windows update.
     * @type {Integer}
     */
    RevisionNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The integration number of the Windows platform version. This is indicative of the platform capabilities, both in terms of API contracts and availability of bug fixes.
     * @type {Integer}
     */
    IntegrationNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
