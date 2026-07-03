#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DDVIDEOPORTCONNECT.ahk" { DDVIDEOPORTCONNECT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVIDEOPORTSTATUS {
    #StructPack 8

    dwSize : UInt32

    bInUse : BOOL

    dwFlags : UInt32

    dwReserved1 : UInt32

    VideoPortType : DDVIDEOPORTCONNECT

    dwReserved2 : IntPtr

    dwReserved3 : IntPtr

}
