#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * The TF_LMLATTELEMENT structure contains information about a lattice element. A lattice element is used in speech recognition. This structure is used with the IEnumTfLatticeElements::Next method.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/ns-ctffunc-tf_lmlattelement
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_LMLATTELEMENT {
    #StructPack 8

    /**
     * Contains the starting offset, in 100-nanosecond units, of the element relative to the start of the phrase.
     */
    dwFrameStart : UInt32

    /**
     * Contains the length, in 100-nanosecond units, of the element.
     */
    dwFrameLen : UInt32

    /**
     * Not currently used.
     */
    dwFlags : UInt32

    iCost : Int32

    /**
     * Contains the display text for the element. If the spoken word is "two", the display text will be "2". The caller must free this string using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     */
    bstrText : BSTR

}
