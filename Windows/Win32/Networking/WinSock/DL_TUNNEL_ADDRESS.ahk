#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Kernel\COMPARTMENT_ID.ahk" { COMPARTMENT_ID }
#Import ".\SCOPE_ID.ahk" { SCOPE_ID }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct DL_TUNNEL_ADDRESS {
    #StructPack 4

    CompartmentId : COMPARTMENT_ID

    ScopeId : SCOPE_ID

    IpAddress : Int8[1]

}
