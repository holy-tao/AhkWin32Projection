#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Specifies alpha blending parameters for video processing.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_process_alpha_blending
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_ALPHA_BLENDING extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A boolean value specifying whether alpha blending is enabled.
     * @type {BOOL}
     */
    Enable{
        get {
            if(!this.HasProp("__Enable"))
                this.__Enable := BOOL(this.ptr + 0)
            return this.__Enable
        }
    }

    /**
     * The planar alpha value. The value can range from 0.0 (transparent) to 1.0 (opaque). If *Enable* is FALSe, this parameter is ignored.
     * @type {Float}
     */
    Alpha {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
