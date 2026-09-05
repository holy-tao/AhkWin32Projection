#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLFS_MGMT_POLICY_TYPE enumeration lists the valid policy types.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmt/ne-clfsmgmt-clfs_mgmt_policy_type
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CLFS_MGMT_POLICY_TYPE extends Win32Enum {

    /**
     * Specifies the maximum size of the log.
     * Native name: ClfsMgmtPolicyMaximumSize
     * @type {Integer (Int32)}
     */
    static MaximumSize => 0

    /**
     * Specifies the minimum size of the log.
     * Native name: ClfsMgmtPolicyMinimumSize
     * @type {Integer (Int32)}
     */
    static MinimumSize => 1

    /**
     * Specifies the size of a new container.
     * Native name: ClfsMgmtPolicyNewContainerSize
     * @type {Integer (Int32)}
     */
    static NewContainerSize => 2

    /**
     * Controls the rate of growth of the log.
     * Native name: ClfsMgmtPolicyGrowthRate
     * @type {Integer (Int32)}
     */
    static GrowthRate => 3

    /**
     * Controls the amount of space that   <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nc-clfsmgmtw32-plog_tail_advance_callback">LOG_TAIL_ADVANCE_CALLBACK</a> requests.
     * Native name: ClfsMgmtPolicyLogTail
     * @type {Integer (Int32)}
     */
    static LogTail => 4

    /**
     * Controls the percentage of containers that are removed if the log is set to autogrow.
     * Native name: ClfsMgmtPolicyAutoShrink
     * @type {Integer (Int32)}
     */
    static AutoShrink => 5

    /**
     * Indicates if the log should automatically shrink or grow.
     * Native name: ClfsMgmtPolicyAutoGrow
     * @type {Integer (Int32)}
     */
    static AutoGrow => 6

    /**
     * Controls the prefix given to a new container.
     * Native name: ClfsMgmtPolicyNewContainerPrefix
     * @type {Integer (Int32)}
     */
    static NewContainerPrefix => 7

    /**
     * Controls the suffix given to a new container.
     * Native name: ClfsMgmtPolicyNewContainerSuffix
     * @type {Integer (Int32)}
     */
    static NewContainerSuffix => 8

    /**
     * Controls the extension given to a new container.
     * Native name: ClfsMgmtPolicyNewContainerExtension
     * @type {Integer (Int32)}
     */
    static NewContainerExtension => 9

    /**
     * Native name: ClfsMgmtPolicyInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 10
}
