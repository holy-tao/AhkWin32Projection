#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS2.ahk" { DDSCAPS2 }
#Import ".\DDOSCAPS.ahk" { DDOSCAPS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDOPTSURFACEDESC {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    ddSCaps : DDSCAPS2

    ddOSCaps : DDOSCAPS

    guid : Guid

    dwCompressionRatio : UInt32

}
