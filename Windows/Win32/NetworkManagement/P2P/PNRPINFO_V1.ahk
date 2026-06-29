#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PNRP_REGISTERED_ID_STATE.ahk" { PNRP_REGISTERED_ID_STATE }
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }
#Import "..\..\Networking\WinSock\SOCKET_ADDRESS.ahk" { SOCKET_ADDRESS }
#Import ".\PNRP_RESOLVE_CRITERIA.ahk" { PNRP_RESOLVE_CRITERIA }

/**
 * The PNRPINFO_V1 structure is pointed to by the lpBlob member of the WSAQUERYSET structure. (PNRPINFO_V1)
 * @remarks
 * Starting with Windows Vista, please use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa371671(v=vs.85)">PNRPINFO_V2</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpns/ns-pnrpns-pnrpinfo_v1
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PNRPINFO_V1 {
    #StructPack 8

    /**
     * Specifies the size of this structure.
     */
    dwSize : UInt32

    /**
     * Points  to the Unicode string that contains the identity.
     */
    lpwszIdentity : PWSTR

    /**
     * Specifies the requested number of resolutions.
     */
    nMaxResolve : UInt32

    /**
     * Specifies the time, in seconds, to wait for a response.
     */
    dwTimeout : UInt32

    /**
     * Specifies the number of seconds between refresh operations. Must be   86400 (24 * 60 * 60 seconds).
     */
    dwLifetime : UInt32

    /**
     * Specifies the criteria used to resolve matches.  PNRP can look for the first matching name, or attempt to find a name that is numerically close to the service location. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ne-pnrpdef-pnrp_resolve_criteria">PNRP_RESOLVE_CRITERIA</a>.
     */
    enResolveCriteria : PNRP_RESOLVE_CRITERIA

    /**
     * Specifies the flags to use for the resolve operation. The valid value is:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>PNRPINFO_HINT</td>
     * <td>Indicates that the <b>saHint</b> member is used. The hint influences how the service location portion of the PNRP ID is generated; it also influences how names are resolved, and specifies how to select between multiple peer names.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Specifies the IPv6 address to  use for the location. The  <b>dwFlags</b> member must be PNRPINFO_HINT.
     */
    saHint : SOCKET_ADDRESS

    /**
     * Specifies the state of the registered ID.  This value is reserved and must be set to zero (0).
     */
    enNameState : PNRP_REGISTERED_ID_STATE

}
