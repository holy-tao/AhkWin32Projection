#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VMR9DeinterlaceCaps structure describes the capabilities of a deinterlacing mode.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ns-vmr9-vmr9deinterlacecaps
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9DeinterlaceCaps extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of previously de-interlaced frames that must be fed back to the hardware to deinterlace the next field. (Used by recursive deinterlacing algorithms.)
     * @type {Integer}
     */
    dwNumPreviousOutputFrames {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of future samples needed to deinterlace the current field.
     * @type {Integer}
     */
    dwNumForwardRefSamples {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of past samples needed to deinterlace the current field.
     * @type {Integer}
     */
    dwNumBackwardRefSamples {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9deinterlacetech">VMR9DeinterlaceTech</a> enumeration type. These flags are used to describe the deinterlacing algorithm.
     * @type {Integer}
     */
    DeinterlaceTechnology {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
