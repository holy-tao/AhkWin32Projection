#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DSOP_UPLEVEL_FILTER_FLAGS structure contains flags that indicate the filters to use for an up-level scope.
 * @remarks
 * For more information about domain modes, see <a href="https://docs.microsoft.com/windows/desktop/AD/detecting-the-operation-mode-of-a-domain">Detecting the Operation Mode of a Domain</a>.
 * 
 * For more information about group types and scope, see <a href="https://docs.microsoft.com/windows/desktop/AD/group-objects">Group Objects</a>.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-dsop_uplevel_filter_flags
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSOP_UPLEVEL_FILTER_FLAGS {
    #StructPack 4

    /**
     * Filter flags to use for an up-level scope, regardless of whether it is a mixed or native mode domain. This member can be a combination of one or more of the following flags.
     */
    flBothModes : UInt32

    /**
     * Filter flags to use for an up-level domain in mixed mode. Mixed mode refers to an up-level domain that may have Windows NT 4.0 Backup Domain Controllers present. This member can be a combination of the flags listed in the <b>flBothModes</b> flags. The <b>DSOP_FILTER_UNIVERSAL_GROUPS_SE</b> flag has no effect in a mixed-mode domain because universal security groups do not exist in mixed mode domains.
     */
    flMixedModeOnly : UInt32

    /**
     * Filter flags to use for an up-level domain in native mode. Native mode refers to an up-level domain in which an administrator has enabled native mode operation. This member can be a combination of the flags listed in the <b>flBothModes</b> flags.
     */
    flNativeModeOnly : UInt32

}
