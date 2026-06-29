#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies alpha blending parameters for video processing.
 * @remarks
 * For each pixel, the destination color value is computed as follows:
 * 
 * `Cd = Cs * (As * Ap * Ae) + Cd * (1.0 - As * Ap * Ae)`
 * 
 * where:
 * 
 * - Cd = The color value of the destination pixel
 * - Cs = The color value of the source pixel
 * - As = The per-pixel source alpha
 * - Ap = The planar alpha value
 * - Ae = The palette-entry alpha value, or 1.0 (palette-entry alpha values apply only to palettized color formats)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_alpha_blending
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_ALPHA_BLENDING {
    #StructPack 4

    /**
     * A boolean value specifying whether alpha blending is enabled.
     */
    Enable : BOOL

    /**
     * The planar alpha value. The value can range from 0.0 (transparent) to 1.0 (opaque). If *Enable* is FALSe, this parameter is ignored.
     */
    Alpha : Float32

}
