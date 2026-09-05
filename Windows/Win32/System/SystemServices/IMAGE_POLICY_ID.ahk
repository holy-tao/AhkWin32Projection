#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_POLICY_ID extends Win32Enum {

    /**
     * Native name: ImagePolicyIdNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ImagePolicyIdEtw
     * @type {Integer (Int32)}
     */
    static Etw => 1

    /**
     * Native name: ImagePolicyIdDebug
     * @type {Integer (Int32)}
     */
    static Debug => 2

    /**
     * Native name: ImagePolicyIdCrashDump
     * @type {Integer (Int32)}
     */
    static CrashDump => 3

    /**
     * Native name: ImagePolicyIdCrashDumpKey
     * @type {Integer (Int32)}
     */
    static CrashDumpKey => 4

    /**
     * Native name: ImagePolicyIdCrashDumpKeyGuid
     * @type {Integer (Int32)}
     */
    static CrashDumpKeyGuid => 5

    /**
     * Native name: ImagePolicyIdParentSd
     * @type {Integer (Int32)}
     */
    static ParentSd => 6

    /**
     * Native name: ImagePolicyIdParentSdRev
     * @type {Integer (Int32)}
     */
    static ParentSdRev => 7

    /**
     * Native name: ImagePolicyIdSvn
     * @type {Integer (Int32)}
     */
    static Svn => 8

    /**
     * Native name: ImagePolicyIdDeviceId
     * @type {Integer (Int32)}
     */
    static DeviceId => 9

    /**
     * Native name: ImagePolicyIdCapability
     * @type {Integer (Int32)}
     */
    static Capability => 10

    /**
     * Native name: ImagePolicyIdScenarioId
     * @type {Integer (Int32)}
     */
    static ScenarioId => 11

    /**
     * Native name: ImagePolicyIdCapabilityOverridable
     * @type {Integer (Int32)}
     */
    static CapabilityOverridable => 12

    /**
     * Native name: ImagePolicyIdTrustletIdOverridable
     * @type {Integer (Int32)}
     */
    static TrustletIdOverridable => 13

    /**
     * Native name: ImagePolicyIdMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 14
}
