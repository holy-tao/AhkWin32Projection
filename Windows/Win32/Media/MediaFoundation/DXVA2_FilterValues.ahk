#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_Fixed32.ahk" { DXVA2_Fixed32 }

/**
 * Contains parameters for a DirectX Video Acceleration (DXVA) image filter.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_filtervalues
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_FilterValues {
    #StructPack 4

    /**
     * Filter level.
     */
    Level : DXVA2_Fixed32

    /**
     * Filter threshold.
     */
    Threshold : DXVA2_Fixed32

    /**
     * Filter radius.
     */
    Radius : DXVA2_Fixed32

}
