#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DDEVICEDESC.ahk" { D3DDEVICEDESC }
#Import ".\D3DLIGHTINGCAPS.ahk" { D3DLIGHTINGCAPS }
#Import ".\D3DPRIMCAPS.ahk" { D3DPRIMCAPS }
#Import ".\D3DTRANSFORMCAPS.ahk" { D3DTRANSFORMCAPS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DFINDDEVICERESULT {
    #StructPack 4

    dwSize : UInt32

    guid : Guid

    ddHwDesc : D3DDEVICEDESC

    ddSwDesc : D3DDEVICEDESC

}
