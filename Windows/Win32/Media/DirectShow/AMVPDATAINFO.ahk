#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\AMVPDIMINFO.ahk

/**
 * The AMVPDATAINFO structure specifies the data-specific characteristics of the VP input stream.
 * @see https://docs.microsoft.com/windows/win32/api//vptype/ns-vptype-amvpdatainfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVPDATAINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Time taken by each field.
     * @type {Integer}
     */
    dwMicrosecondsPerField {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Dimensional information.
     * @type {AMVPDIMINFO}
     */
    amvpDimInfo{
        get {
            if(!this.HasProp("__amvpDimInfo"))
                this.__amvpDimInfo := AMVPDIMINFO(this.ptr + 8)
            return this.__amvpDimInfo
        }
    }

    /**
     * The X dimension of picture aspect ratio.
     * @type {Integer}
     */
    dwPictAspectRatioX {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The Y dimension of picture aspect ratio.
     * @type {Integer}
     */
    dwPictAspectRatioY {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Video port should enable double clocking.
     * @type {Integer}
     */
    bEnableDoubleClock {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Video port should use an external VACT signal.
     * @type {Integer}
     */
    bEnableVACT {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Indicates that the signal is interlaced.
     * @type {Integer}
     */
    bDataIsInterlaced {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Number of half lines in the odd field.
     * @type {Integer}
     */
    lHalfLinesOdd {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Video port should invert the field polarity.
     * @type {Integer}
     */
    bFieldPolarityInverted {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Number of lines of data in VREF.
     * @type {Integer}
     */
    dwNumLinesInVREF {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Number of half lines in the even field.
     * @type {Integer}
     */
    lHalfLinesEven {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
