#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Various statistics specific to the keying module and IP version.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_keymodule_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0 {
    #StructPack 4

    /**
     * Current number of active Main Mode SAs.
     */
    currentActiveMainModes : UInt32

    /**
     * Total number of Main Mode negotiations.
     */
    totalMainModesStarted : UInt32

    /**
     * Total number of successful Main Mode negotiations.
     */
    totalSuccessfulMainModes : UInt32

    /**
     * Total number of failed Main Mode negotiations.
     */
    totalFailedMainModes : UInt32

    /**
     * Total number of Main Mode negotiations that were externally initiated by a peer.
     */
    totalResponderMainModes : UInt32

    /**
     * Current number of newly created responder Main Modes that are still in the initial state.
     */
    currentNewResponderMainModes : UInt32

    /**
     * Current number of active Quick Mode SAs.
     */
    currentActiveQuickModes : UInt32

    /**
     * Total number of Quick Mode negotiations.
     */
    totalQuickModesStarted : UInt32

    /**
     * Total number of successful Quick Mode negotiations.
     */
    totalSuccessfulQuickModes : UInt32

    /**
     * Total number of failed Quick Mode negotiations.
     */
    totalFailedQuickModes : UInt32

    /**
     * Total number of acquires received from BFE.
     */
    totalAcquires : UInt32

    /**
     * Total number of acquires that were internally reinitiated.
     */
    totalReinitAcquires : UInt32

    /**
     * Current number of active extended mode SAs.
     */
    currentActiveExtendedModes : UInt32

    /**
     * Total number of extended mode negotiations.
     */
    totalExtendedModesStarted : UInt32

    /**
     * Total number of successful extended mode negotiations.
     */
    totalSuccessfulExtendedModes : UInt32

    /**
     * Total number of failed extended mode negotiations.
     */
    totalFailedExtendedModes : UInt32

    /**
     * Total number of successful extended mode negotiations that used impersonation.
     */
    totalImpersonationExtendedModes : UInt32

    /**
     * Total number of successful Main Mode mode negotiations that used impersonation.
     */
    totalImpersonationMainModes : UInt32

}
