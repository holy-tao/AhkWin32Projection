#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Various statistics specific to the keying module (IKE, Authip, and IKEv2) and IP version.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_keymodule_statistics1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * Current number of active Main Mode SAs.
     * @type {Integer}
     */
    currentActiveMainModes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Total number of Main Mode negotiations.
     * @type {Integer}
     */
    totalMainModesStarted {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Total number of successful Main Mode negotiations.
     * @type {Integer}
     */
    totalSuccessfulMainModes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Total number of failed Main Mode negotiations.
     * @type {Integer}
     */
    totalFailedMainModes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Total number of Main Mode negotiations that were externally initiated by a peer.
     * @type {Integer}
     */
    totalResponderMainModes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Current number of newly created responder Main Modes that are still in the initial state.
     * @type {Integer}
     */
    currentNewResponderMainModes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Current number of active Quick Mode SAs.
     * @type {Integer}
     */
    currentActiveQuickModes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Total number of Quick Mode negotiations.
     * @type {Integer}
     */
    totalQuickModesStarted {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Total number of successful Quick Mode negotiations.
     * @type {Integer}
     */
    totalSuccessfulQuickModes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Total number of failed Quick Mode negotiations.
     * @type {Integer}
     */
    totalFailedQuickModes {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Total number of acquires received from BFE.
     * @type {Integer}
     */
    totalAcquires {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Total number of acquires that were internally reinitiated.
     * @type {Integer}
     */
    totalReinitAcquires {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Current number of active extended mode SAs.
     * @type {Integer}
     */
    currentActiveExtendedModes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Total number of extended mode negotiations.
     * @type {Integer}
     */
    totalExtendedModesStarted {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Total number of successful extended mode negotiations.
     * @type {Integer}
     */
    totalSuccessfulExtendedModes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Total number of failed extended mode negotiations.
     * @type {Integer}
     */
    totalFailedExtendedModes {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Total number of successful extended mode negotiations that used impersonation.
     * @type {Integer}
     */
    totalImpersonationExtendedModes {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Total number of successful Main Mode mode negotiations that used impersonation.
     * @type {Integer}
     */
    totalImpersonationMainModes {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
