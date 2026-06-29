#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RFX_GFX_MSG_HEADER.ahk" { RFX_GFX_MSG_HEADER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\RFX_GFX_MONITOR_INFO.ahk" { RFX_GFX_MONITOR_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct RFX_GFX_MSG_CLIENT_DESKTOP_INFO_RESPONSE {
    #StructPack 4

    channelHdr : RFX_GFX_MSG_HEADER

    reserved : UInt32

    monitorCount : UInt32

    MonitorData : RFX_GFX_MONITOR_INFO[16]

    clientUniqueId : WCHAR[32]

}
