#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a video frequency.
 * @remarks
 * 
 * The value 0/0 indicates an unknown frequency. Values of the form <i>n</i>/0, where <i>n</i> is not zero, are invalid. Values of the form 0/<i>n</i>, where <i>n</i> is not zero, indicate a frequency of zero.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_frequency
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_Frequency extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Numerator of the frequency.
     * @type {Integer}
     */
    Numerator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Denominator of the frequency.
     * @type {Integer}
     */
    Denominator {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
