#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LevelsParams structure contains members that specify adjustments to the light, midtone, or dark areas of a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-levelsparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class LevelsParams extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range 0 through 100 that specifies which pixels should be lightened. You can use this adjustment to lighten pixels that are already lighter than a certain threshold. Setting <b>highlight</b> to 100 specifies no change. Setting <b>highlight</b> to t specifies that a color channel value is increased if it is already greater than t percent of full intensity. For example, setting <b>highlight</b> to 90 specifies that all color channel values greater than 90 percent of full intensity are increased.
     * @type {Integer}
     */
    highlight {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -100 through 100 that specifies how much to lighten or darken an image. Color channel values in the middle of the intensity range are altered more than color channel values near the minimum or maximum intensity. You can use this adjustment to lighten (or darken) an image without loosing the contrast between the darkest and lightest portions of the image. A value of 0 specifies no change. Positive values specify that the midtones are made lighter, and negative values specify that the midtones are made darker.
     * @type {Integer}
     */
    midtone {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range 0 through 100 that specifies which pixels should be darkened. You can use this adjustment to darken pixels that are already darker than a certain threshold. Setting <b>shadow</b> to 0 specifies no change. Setting <b>shadow</b> to t specifies that a color channel value is decreased if it is already less than t percent of full intensity. For example, setting <b>shadow</b> to 10 specifies that all color channel values less than 10 percent of full intensity are decreased.
     * @type {Integer}
     */
    shadow {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
