#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_GETDRIVERINFODATA {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    guidInfo : Guid

    dwExpectedSize : UInt32

    lpvData : IntPtr

    dwActualSize : UInt32

    ddRVal : HRESULT

    dwContext : IntPtr

}
