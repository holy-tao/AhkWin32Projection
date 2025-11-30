#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Allows a sync provider to control how placeholder directories and files should be created by the platform. This is the primary policy.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_population_policy_primary
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_POPULATION_POLICY_PRIMARY extends Win32Enum{

    /**
     * With <b>CF_POPULATION_POLICY_PARTIAL</b> population policy, when the platform detects access on a not fully populated directory, it will request only the entries required by the user application from the sync provider. This policy is not currently supported by the platform.
     * @type {Integer (UInt16)}
     */
    static CF_POPULATION_POLICY_PARTIAL => 0

    /**
     * With <b>CF_POPULATION_POLICY_FULL</b> population policy, when the platform detects access on a not fully populated directory, it will request the sync provider return all entries under the directory before completing the user request.
     * @type {Integer (UInt16)}
     */
    static CF_POPULATION_POLICY_FULL => 2

    /**
     * When <b>CF_POPULATION_POLICY_ALWAYS_FULL</b> is selected, the platform assumes that the full name space is always available locally. It will never forward any directory enumeration request to the sync provider.
     * @type {Integer (UInt16)}
     */
    static CF_POPULATION_POLICY_ALWAYS_FULL => 3
}
