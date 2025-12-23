#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Normal file/directory to placeholder file/directory conversion flags.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_convert_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CONVERT_FLAGS extends Win32BitflagEnum{

    /**
     * No conversion flags.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_NONE => 0

    /**
     * The platform marks the converted placeholder as in sync with cloud upon a successful conversion of the file.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_MARK_IN_SYNC => 1

    /**
     * Applicable to files only. When specified, the platform dehydrates the file after converting it to a placeholder successfully. The caller must acquire an exclusive handle when specifying this flag or data corruptions can occur. Note that the platform does not validate the exclusiveness of the handle.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_DEHYDRATE => 2

    /**
     * Applicable for directories only. When specified, it marks the converted placeholder directory as partially populated such that any future access to it will result in a **FETCH_PLACEHOLDERS** callback sent to the sync provider.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_ENABLE_ON_DEMAND_POPULATION => 4

    /**
     * When this flag is present, the newly created placeholder will be marked as always full. Once hydrated, any attempt to dehydrate such a (file) placeholder will fail with error code **ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED**. This flag is enforced on a placeholder file only. It can be set on a placeholder directory, but it has no effect.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_ALWAYS_FULL => 8

    /**
     * When specified, the platform allows a sync engine to atomically convert a non-cloud files placeholder (having another reparse tag/data) to a cloud files placeholder. Note that the API normally fails conversion of any non-placeholder file to a placeholder.
     * 
     * The combination **(CF_CONVERT_FLAG_FORCE_CONVERT_TO_CLOUD_FILE | CF_CONVERT_FLAG_DEHYDRATE)** is especially useful in migration scenarios when certain providers are migrating from another platform to cloud files platform and they intend to convert hydrated placeholders on the older platform to dehydrated placeholders on the cloud files platform atomically. Just this flag should be passed for converting full placeholders to cloud files placeholders. If the older platform implements full files as a regular, non-placeholder files, this flag is not needed. Passing this flag on a directory converts directories to cloud files as well, though the **DEHYDRATE** flag doesn’t apply to directories.
     * 
     * Even when the policy **CF_PLACEHOLDER_MANAGEMENT_POLICY_CONVERT_TO_UNRESTRICTED** was specified with [CfRegisterSyncRoot](nf-cfapi-cfregistersyncroot.md), only processes that have registered/connected to the cloud files sync root are allowed to specify this flag.
     * 
     * >[!NOTE]
     * >The flag is supported only if the `PlatformVersion.IntegrationNumber` obtained from [CfGetPlatformInfo](nf-cfapi-cfgetplatforminfo.md) is `0x500` or higher.
     * @type {Integer (Int32)}
     */
    static CF_CONVERT_FLAG_FORCE_CONVERT_TO_CLOUD_FILE => 16
}
