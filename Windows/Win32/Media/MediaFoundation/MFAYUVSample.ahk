#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a 4:4:4:4 Y'Cb'Cr' sample.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfayuvsample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFAYUVSample extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Cr (chroma difference) value.
     * @type {Integer}
     */
    bCrValue {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Cb (chroma difference) value.
     * @type {Integer}
     */
    bCbValue {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Y (luma) value.
     * @type {Integer}
     */
    bYValue {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Alpha value.
     * @type {Integer}
     */
    bSampleAlpha8 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
