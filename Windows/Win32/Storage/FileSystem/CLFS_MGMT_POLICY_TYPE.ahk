#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLFS_MGMT_POLICY_TYPE enumeration lists the valid policy types.
 * @see https://docs.microsoft.com/windows/win32/api//clfsmgmt/ne-clfsmgmt-clfs_mgmt_policy_type
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_MGMT_POLICY_TYPE extends Win32Enum{

    /**
     * Specifies the maximum size of the log.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyMaximumSize => 0

    /**
     * Specifies the minimum size of the log.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyMinimumSize => 1

    /**
     * Specifies the size of a new container.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyNewContainerSize => 2

    /**
     * Controls the rate of growth of the log.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyGrowthRate => 3

    /**
     * Controls the amount of space that   <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nc-clfsmgmtw32-plog_tail_advance_callback">LOG_TAIL_ADVANCE_CALLBACK</a> requests.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyLogTail => 4

    /**
     * Controls the percentage of containers that are removed if the log is set to autogrow.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyAutoShrink => 5

    /**
     * Indicates if the log should automatically shrink or grow.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyAutoGrow => 6

    /**
     * Controls the prefix given to a new container.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyNewContainerPrefix => 7

    /**
     * Controls the suffix given to a new container.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyNewContainerSuffix => 8

    /**
     * Controls the extension given to a new container.
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyNewContainerExtension => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ClfsMgmtPolicyInvalid => 10
}
