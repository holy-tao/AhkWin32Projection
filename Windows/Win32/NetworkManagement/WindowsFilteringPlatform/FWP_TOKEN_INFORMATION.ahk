#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }

/**
 * The FWP_TOKEN_INFORMATION structure defines a set of security identifiers that are used for user-mode classification.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_token_information
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_TOKEN_INFORMATION {
    #StructPack 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures stored in the <b>sids</b> array.
     */
    sidCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures containing user and group security information.
     */
    sids : SID_AND_ATTRIBUTES.Ptr

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures stored in the <b>restrictedSids</b> array.
     */
    restrictedSidCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures containing restricted SIDs security information.
     */
    restrictedSids : SID_AND_ATTRIBUTES.Ptr

}
