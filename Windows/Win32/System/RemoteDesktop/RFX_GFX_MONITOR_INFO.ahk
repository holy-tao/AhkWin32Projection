#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct RFX_GFX_MONITOR_INFO {
    #StructPack 4

    left : Int32

    top : Int32

    right : Int32

    bottom : Int32

    physicalWidth : UInt32

    physicalHeight : UInt32

    orientation : UInt32

    primary : BOOL

}
