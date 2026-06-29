#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROC_THREAD_ATTRIBUTE_NUM {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeParentProcess => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeHandleList => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeGroupAffinity => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributePreferredNode => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeIdealProcessor => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeUmsThread => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeMitigationPolicy => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeSecurityCapabilities => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeProtectionLevel => 11

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeJobList => 13

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeChildProcessPolicy => 14

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeAllApplicationPackagesPolicy => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeWin32kFilter => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeSafeOpenPromptOriginClaim => 17

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeDesktopAppPolicy => 18

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributePseudoConsole => 22

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeMitigationAuditPolicy => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeMachineType => 25

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeComponentFilter => 26

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeEnableOptionalXStateFeatures => 27

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeTrustedApp => 29

    /**
     * @type {Integer (UInt32)}
     */
    static ProcThreadAttributeSveVectorLength => 30
}
