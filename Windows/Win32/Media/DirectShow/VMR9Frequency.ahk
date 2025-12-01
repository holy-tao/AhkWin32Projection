#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VMR9Frequency structure describes the frequency of a video stream. Frequencies are described as ratios. For example, the NTSC frame rate of 29.97 fps is expressed as 30,000:1001.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9frequency
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9Frequency extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Numerator of the frequency ratio.
     * @type {Integer}
     */
    dwNumerator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Denominator of the frequency ratio.
     * @type {Integer}
     */
    dwDenominator {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
