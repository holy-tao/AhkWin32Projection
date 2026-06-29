#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_Fixed32.ahk" { DXVA2_Fixed32 }

/**
 * Contains values for DirectX Video Acceleration (DXVA) video processing operations.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_procampvalues
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_ProcAmpValues {
    #StructPack 4

    /**
     * Brightness value.
     */
    Brightness : DXVA2_Fixed32

    /**
     * Contrast value.
     */
    Contrast : DXVA2_Fixed32

    /**
     * Hue value.
     */
    Hue : DXVA2_Fixed32

    /**
     * Saturation value.
     */
    Saturation : DXVA2_Fixed32

}
