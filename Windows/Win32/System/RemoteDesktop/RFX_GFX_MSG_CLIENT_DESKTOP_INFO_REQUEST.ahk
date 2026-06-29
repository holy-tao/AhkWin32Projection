#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RFX_GFX_MSG_HEADER.ahk" { RFX_GFX_MSG_HEADER }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct RFX_GFX_MSG_CLIENT_DESKTOP_INFO_REQUEST {
    #StructPack 2

    channelHdr : RFX_GFX_MSG_HEADER

}
