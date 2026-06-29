#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGKMDT_OPM_VIDEO_OUTPUT_SEMANTICS.ahk" { DXGKMDT_OPM_VIDEO_OUTPUT_SEMANTICS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_CREATE_VIDEO_OUTPUT_FOR_TARGET_PARAMETERS {
    #StructPack 8

    AdapterLuid : IntPtr

    TargetId : UInt32

    Vos : DXGKMDT_OPM_VIDEO_OUTPUT_SEMANTICS

}
