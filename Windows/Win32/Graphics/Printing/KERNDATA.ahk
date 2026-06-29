#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Devices\Display\FD_KERNINGPAIR.ahk" { FD_KERNINGPAIR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct KERNDATA {
    #StructPack 4

    dwSize : UInt32

    dwKernPairNum : UInt32

    KernPair : FD_KERNINGPAIR[1]

}
