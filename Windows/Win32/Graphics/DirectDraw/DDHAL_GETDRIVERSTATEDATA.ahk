#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETDRIVERSTATEDATA {
    #StructPack 8

    dwFlags : UInt32

    dwhContext : IntPtr

    lpdwStates : IntPtr

    dwLength : UInt32

    ddRVal : HRESULT

}
