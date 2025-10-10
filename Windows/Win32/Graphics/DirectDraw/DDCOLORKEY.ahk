#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a color key as a range of values.
 * @remarks
 * 
  * This structure is used by the Video Mixing Renderer (VMR) filter. The VMR uses this structure to support the DirectDraw capability of specifying a range of values for a color key by using two <b>DWORD</b>s. The VMR and the graphics card automatically determine whether the two <b>DWORD</b>s are interpreted as RGB or YUV color space values. Not all hardware may support this capability. To ensure compatibility with all hardware, set <b>dw1</b> and <b>dw2</b> to the same value.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-ddcolorkey
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDCOLORKEY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwColorSpaceLowValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwColorSpaceHighValue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
