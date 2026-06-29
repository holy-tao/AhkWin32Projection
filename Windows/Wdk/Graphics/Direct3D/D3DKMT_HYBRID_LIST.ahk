#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_GPU_PREFERENCE_QUERY_STATE.ahk" { D3DKMT_GPU_PREFERENCE_QUERY_STATE }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DKMT_GPU_PREFERENCE_QUERY_TYPE.ahk" { D3DKMT_GPU_PREFERENCE_QUERY_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_HYBRID_LIST {
    #StructPack 8

    State : D3DKMT_GPU_PREFERENCE_QUERY_STATE

    AdapterLuid : IntPtr

    bUserPreferenceQuery : BOOL

    QueryType : D3DKMT_GPU_PREFERENCE_QUERY_TYPE

}
