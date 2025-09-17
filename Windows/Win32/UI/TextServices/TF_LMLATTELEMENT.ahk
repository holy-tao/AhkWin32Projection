#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TF_LMLATTELEMENT structure contains information about a lattice element. A lattice element is used in speech recognition. This structure is used with the IEnumTfLatticeElements::Next method.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/ns-ctffunc-tf_lmlattelement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_LMLATTELEMENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains the starting offset, in 100-nanosecond units, of the element relative to the start of the phrase.
     * @type {Integer}
     */
    dwFrameStart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the length, in 100-nanosecond units, of the element.
     * @type {Integer}
     */
    dwFrameLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Not currently used.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Contains the display text for the element. If the spoken word is "two", the display text will be "2". The caller must free this string using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @type {Pointer<Char>}
     */
    bstrText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
