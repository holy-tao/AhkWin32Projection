#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A ColorLUTParams structure contains members (color lookup tables) that specify color adjustments to a bitmap.
 * @remarks
 * 
  * A lookup table specifies how existing color channel values should be replaced by new values. A color channel value of j is replaced by the jth entry in the lookup table for that channel. For example, an existing blue channel value of 25 would be replaced by the value of lutB[25].
  * 
  * The ColorChannelLUT data type is defined in GdiplusColorMatrix.h as follows:
  * 
  * <c>typedef BYTE ColorChannelLUT[256];</c>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-colorlutparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorLUTParams extends Win32Struct
{
    static sizeof => 1024

    static packingSize => 1

    /**
     * Type: <b>ColorChannelLUT</b>
     * 
     * Array of 256 bytes that specifies the adjustment for the blue channel.
     * @type {Array<Byte>}
     */
    lutB{
        get {
            if(!this.HasProp("__lutBProxyArray"))
                this.__lutBProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "char")
            return this.__lutBProxyArray
        }
    }

    /**
     * Type: <b>ColorChannelLUT</b>
     * 
     * Array of 256 bytes that specifies the adjustment for the green channel.
     * @type {Array<Byte>}
     */
    lutG{
        get {
            if(!this.HasProp("__lutGProxyArray"))
                this.__lutGProxyArray := Win32FixedArray(this.ptr + 256, 256, Primitive, "char")
            return this.__lutGProxyArray
        }
    }

    /**
     * Type: <b>ColorChannelLUT</b>
     * 
     * Array of 256 bytes that specifies the adjustment for the red channel.
     * @type {Array<Byte>}
     */
    lutR{
        get {
            if(!this.HasProp("__lutRProxyArray"))
                this.__lutRProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "char")
            return this.__lutRProxyArray
        }
    }

    /**
     * Type: <b>ColorChannelLUT</b>
     * 
     * Array of 256 bytes that specifies the adjustment for the alpha channel.
     * @type {Array<Byte>}
     */
    lutA{
        get {
            if(!this.HasProp("__lutAProxyArray"))
                this.__lutAProxyArray := Win32FixedArray(this.ptr + 768, 256, Primitive, "char")
            return this.__lutAProxyArray
        }
    }
}
