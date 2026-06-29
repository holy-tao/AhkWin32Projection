#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import ".\RASAPIVERSION.ahk" { RASAPIVERSION }
#Import ".\RASPROJECTION_INFO_TYPE.ahk" { RASPROJECTION_INFO_TYPE }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL.ahk" { RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL }
#Import ".\RASIKEV_PROJECTION_INFO_FLAGS.ahk" { RASIKEV_PROJECTION_INFO_FLAGS }
#Import ".\RASPPP_PROJECTION_INFO.ahk" { RASPPP_PROJECTION_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA.ahk" { RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA }
#Import ".\RASIKEV2_PROJECTION_INFO.ahk" { RASIKEV2_PROJECTION_INFO }

/**
 * Contains the Point-to-Point (PPP) or Internet Key Exchange version 2 (IKEv2) projection information for a RAS connection.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ns-ras-ras_projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_PROJECTION_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd408102(v=vs.85)">RASAPIVERSION</a> value that specifies the structure version.
     */
    version : RASAPIVERSION

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ras/ne-ras-rasprojection_info_type">RASPROJECTION_INFO_TYPE</a> value that specifies the connection type in <b>union</b>.
     */
    type : RASPROJECTION_INFO_TYPE

    ppp : RASPPP_PROJECTION_INFO

    static __New() {
        DefineProp(this.Prototype, 'ikev2', { type: RASIKEV2_PROJECTION_INFO, offset: 8 })
        this.DeleteProp("__New")
    }
}
