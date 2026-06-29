#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_AUXILIARYPRESENTINFO_TYPE.ahk" { D3DKMT_AUXILIARYPRESENTINFO_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_AUXILIARYPRESENTINFO {
    #StructPack 4

    size : UInt32

    type : D3DKMT_AUXILIARYPRESENTINFO_TYPE

}
