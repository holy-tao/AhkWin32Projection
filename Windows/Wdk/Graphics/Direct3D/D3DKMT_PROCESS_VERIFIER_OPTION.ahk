#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DKMT_VERIFIER_OPTION_MODE.ahk" { D3DKMT_VERIFIER_OPTION_MODE }
#Import ".\D3DKMT_PROCESS_VERIFIER_OPTION_TYPE.ahk" { D3DKMT_PROCESS_VERIFIER_OPTION_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PROCESS_VERIFIER_OPTION {
    #StructPack 8

    hProcess : HANDLE

    Type : D3DKMT_PROCESS_VERIFIER_OPTION_TYPE

    Mode : D3DKMT_VERIFIER_OPTION_MODE

    Data : IntPtr

}
