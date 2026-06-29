#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE.ahk" { D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE {
    #StructPack 4

    Type : D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE

    VidPnSourceId : UInt32

    ProcessBoostEligible : BOOLEAN

    VSyncMultiplier : UInt32

    BaseDesktopDuration : UInt32

    Reserved : Int8[16]

}
