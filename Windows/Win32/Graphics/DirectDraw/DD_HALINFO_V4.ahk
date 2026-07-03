#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDNTCORECAPS.ahk" { DDNTCORECAPS }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\VIDEOMEMORYINFO.ahk" { VIDEOMEMORYINFO }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_HALINFO_V4 {
    #StructPack 8

    dwSize : UInt32

    vmiData : VIDEOMEMORYINFO

    ddCaps : DDNTCORECAPS

    GetDriverInfo : IntPtr

    dwFlags : UInt32

}
