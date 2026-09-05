#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class PROC_THREAD_ATTRIBUTE_NUM extends Win32Enum {

    /**
     * Native name: ProcThreadAttributeParentProcess
     * @type {Integer (UInt32)}
     */
    static ParentProcess => 0

    /**
     * Native name: ProcThreadAttributeHandleList
     * @type {Integer (UInt32)}
     */
    static HandleList => 2

    /**
     * Native name: ProcThreadAttributeGroupAffinity
     * @type {Integer (UInt32)}
     */
    static GroupAffinity => 3

    /**
     * Native name: ProcThreadAttributePreferredNode
     * @type {Integer (UInt32)}
     */
    static PreferredNode => 4

    /**
     * Native name: ProcThreadAttributeIdealProcessor
     * @type {Integer (UInt32)}
     */
    static IdealProcessor => 5

    /**
     * Native name: ProcThreadAttributeUmsThread
     * @type {Integer (UInt32)}
     */
    static UmsThread => 6

    /**
     * Native name: ProcThreadAttributeMitigationPolicy
     * @type {Integer (UInt32)}
     */
    static MitigationPolicy => 7

    /**
     * Native name: ProcThreadAttributeSecurityCapabilities
     * @type {Integer (UInt32)}
     */
    static SecurityCapabilities => 9

    /**
     * Native name: ProcThreadAttributeProtectionLevel
     * @type {Integer (UInt32)}
     */
    static ProtectionLevel => 11

    /**
     * Native name: ProcThreadAttributeJobList
     * @type {Integer (UInt32)}
     */
    static JobList => 13

    /**
     * Native name: ProcThreadAttributeChildProcessPolicy
     * @type {Integer (UInt32)}
     */
    static ChildProcessPolicy => 14

    /**
     * Native name: ProcThreadAttributeAllApplicationPackagesPolicy
     * @type {Integer (UInt32)}
     */
    static AllApplicationPackagesPolicy => 15

    /**
     * Native name: ProcThreadAttributeWin32kFilter
     * @type {Integer (UInt32)}
     */
    static Win32kFilter => 16

    /**
     * Native name: ProcThreadAttributeSafeOpenPromptOriginClaim
     * @type {Integer (UInt32)}
     */
    static SafeOpenPromptOriginClaim => 17

    /**
     * Native name: ProcThreadAttributeDesktopAppPolicy
     * @type {Integer (UInt32)}
     */
    static DesktopAppPolicy => 18

    /**
     * Native name: ProcThreadAttributePseudoConsole
     * @type {Integer (UInt32)}
     */
    static PseudoConsole => 22

    /**
     * Native name: ProcThreadAttributeMitigationAuditPolicy
     * @type {Integer (UInt32)}
     */
    static MitigationAuditPolicy => 24

    /**
     * Native name: ProcThreadAttributeMachineType
     * @type {Integer (UInt32)}
     */
    static MachineType => 25

    /**
     * Native name: ProcThreadAttributeComponentFilter
     * @type {Integer (UInt32)}
     */
    static ComponentFilter => 26

    /**
     * Native name: ProcThreadAttributeEnableOptionalXStateFeatures
     * @type {Integer (UInt32)}
     */
    static EnableOptionalXStateFeatures => 27

    /**
     * Native name: ProcThreadAttributeTrustedApp
     * @type {Integer (UInt32)}
     */
    static TrustedApp => 29

    /**
     * Native name: ProcThreadAttributeSveVectorLength
     * @type {Integer (UInt32)}
     */
    static SveVectorLength => 30
}
