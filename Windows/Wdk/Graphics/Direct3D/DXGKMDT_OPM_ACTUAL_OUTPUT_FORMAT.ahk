#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGKMDT_OPM_INTERLEAVE_FORMAT.ahk" { DXGKMDT_OPM_INTERLEAVE_FORMAT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_ACTUAL_OUTPUT_FORMAT {
    #StructPack 8

    rnRandomNumber : IntPtr

    ulStatusFlags : UInt32

    ulDisplayWidth : UInt32

    ulDisplayHeight : UInt32

    ifInterleaveFormat : DXGKMDT_OPM_INTERLEAVE_FORMAT

    d3dFormat : UInt32

    ulFrequencyNumerator : UInt32

    ulFrequencyDenominator : UInt32

}
