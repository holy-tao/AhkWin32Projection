#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_WdsTransportClientReceiveContents.ahk" { PFN_WdsTransportClientReceiveContents }
#Import ".\PFN_WdsTransportClientReceiveMetadata.ahk" { PFN_WdsTransportClientReceiveMetadata }
#Import ".\PFN_WdsTransportClientSessionComplete.ahk" { PFN_WdsTransportClientSessionComplete }
#Import ".\PFN_WdsTransportClientSessionNegotiate.ahk" { PFN_WdsTransportClientSessionNegotiate }
#Import ".\PFN_WdsTransportClientSessionStart.ahk" { PFN_WdsTransportClientSessionStart }
#Import ".\PFN_WdsTransportClientSessionStartEx.ahk" { PFN_WdsTransportClientSessionStartEx }

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_TRANSPORTCLIENT_CALLBACKS {
    #StructPack 8

    SessionStart : PFN_WdsTransportClientSessionStart

    SessionStartEx : PFN_WdsTransportClientSessionStartEx

    ReceiveContents : PFN_WdsTransportClientReceiveContents

    ReceiveMetadata : PFN_WdsTransportClientReceiveMetadata

    SessionComplete : PFN_WdsTransportClientSessionComplete

    SessionNegotiate : PFN_WdsTransportClientSessionNegotiate

}
