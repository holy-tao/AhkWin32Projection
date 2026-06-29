#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DRECT.ahk" { D3DRECT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSTATUS {
    #StructPack 4

    dwFlags : UInt32

    dwStatus : UInt32

    drExtent : D3DRECT

}
