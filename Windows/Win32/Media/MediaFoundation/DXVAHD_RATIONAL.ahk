#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a rational number (ratio).
 * @remarks
 * Values of the form 0/<i>n</i> are interpreted as zero. The value 0/0 is interpreted as zero.  However, these values are not necessarily valid in all contexts.
 * 
 * Values of the form <i>n</i>/0, where <i>n</i> is nonzero, are invalid.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_rational
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_RATIONAL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The numerator of the ratio.
     * @type {Integer}
     */
    Numerator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The denominator of the ratio.
     * @type {Integer}
     */
    Denominator {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
