#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_VERIFIER_OPTION_MODE.ahk" { D3DKMT_VERIFIER_OPTION_MODE }
#Import ".\D3DKMT_ADAPTER_VERIFIER_OPTION_TYPE.ahk" { D3DKMT_ADAPTER_VERIFIER_OPTION_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ADAPTER_VERIFIER_OPTION {
    #StructPack 8

    Type : D3DKMT_ADAPTER_VERIFIER_OPTION_TYPE

    Mode : D3DKMT_VERIFIER_OPTION_MODE

    Data : IntPtr

}
