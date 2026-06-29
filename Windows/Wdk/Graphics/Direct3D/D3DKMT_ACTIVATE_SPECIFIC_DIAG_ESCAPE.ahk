#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE.ahk" { D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ACTIVATE_SPECIFIC_DIAG_ESCAPE {
    #StructPack 4

    Type : D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE

    Activate : BOOL

}
