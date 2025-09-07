#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\RGBQUAD.ahk

/**
 * The TRUECOLORINFO structure contains color palette and bitmask information for a video image.
 * @remarks
 * This structure is not used for some RGB formats. For more information about which fields are valid under different circumstances, see the Platform SDK documentation for <b>BITMAPINFO</b>.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-truecolorinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class TRUECOLORINFO extends Win32Struct
{
    static sizeof => 2064

    static packingSize => 8

    /**
     * Array of color masks (one per color element).
     * @type {Array<UInt32>}
     */
    dwBitMasks{
        get {
            if(!this.HasProp("__dwBitMasksProxyArray"))
                this.__dwBitMasksProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__dwBitMasksProxyArray
        }
    }

    /**
     * Array of palette colors.
     * @type {Array<RGBQUAD>}
     */
    bmiColors{
        get {
            if(!this.HasProp("__bmiColorsProxyArray"))
                this.__bmiColorsProxyArray := Win32FixedArray(this.ptr + 16, 8, RGBQUAD, "")
            return this.__bmiColorsProxyArray
        }
    }
}
