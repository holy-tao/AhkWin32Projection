#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Returns information for the cloud files platform. This is intended for sync providers running on multiple versions of Windows.
 * @remarks
 * The platform is a combination of the cloud filter and the placeholder files API library, which are always kept in sync with each other. This API is intended for sync providers that need to make decisions based on the platform capabilities of multiple versions of Windows.
 * 
 * If you are building an app that uses or is aware of placeholder files, this may be useful to you.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_platform_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_PLATFORM_INFO {
    #StructPack 4

    /**
     * The build number of the Windows platform version. Changes when the platform is serviced by a Windows update.
     */
    BuildNumber : UInt32

    /**
     * The revision number of the Windows platform version. Changes when the platform is serviced by a Windows update.
     */
    RevisionNumber : UInt32

    /**
     * The integration number of the Windows platform version. This is indicative of the platform capabilities, both in terms of API contracts and availability of bug fixes.
     */
    IntegrationNumber : UInt32

}
