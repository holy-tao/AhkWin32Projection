#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDNTCORECAPS.ahk" { DDNTCORECAPS }
#Import ".\VIDEOMEMORYINFO.ahk" { VIDEOMEMORYINFO }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\PDD_GETDRIVERINFO.ahk" { PDD_GETDRIVERINFO }
#Import ".\DDSCAPS.ahk" { DDSCAPS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_HALINFO_V4 {
    #StructPack 8

    dwSize : UInt32

    vmiData : VIDEOMEMORYINFO

    ddCaps : DDNTCORECAPS

    GetDriverInfo : PDD_GETDRIVERINFO

    dwFlags : UInt32

}
