#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_PUSH_NOTIFICATION_STATUS {
    #StructPack 4

    ChannelStatusValid : BOOL

    ChannelStatus : UInt32

}
