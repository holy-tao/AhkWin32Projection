#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_TDRDBGCTRLTYPE.ahk" { D3DKMT_TDRDBGCTRLTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_TDRDBGCTRL_ESCAPE {
    #StructPack 4

    TdrControl : D3DKMT_TDRDBGCTRLTYPE

    NodeOrdinal : UInt32

}
