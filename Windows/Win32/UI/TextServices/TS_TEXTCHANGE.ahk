#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TS_TEXTCHANGE structure contains text change data.
 * @remarks
 * The possible text changes include insert, delete, and replace. For example, if you replace the first "t" of "text" with "T", <b>acpStart</b> =0, <b>acpOldEnd</b> =1, and <b>acpNewEnd</b> =1. If you delete the last "t", <b>acpStart</b> =3, <b>acpOldEnd</b> =4, and <b>acpNewEnd</b> =3. If an "a" is inserted between "e" and "x", <b>acpStart</b> =2, <b>acpOldEnd</b> =2, and <b>acpNewEnd</b> =3.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ns-textstor-ts_textchange
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TS_TEXTCHANGE {
    #StructPack 4

    /**
     * Contains the starting character position of the change.
     */
    acpStart : Int32

    /**
     * Contains the ending character position before the text is changed.
     */
    acpOldEnd : Int32

    /**
     * Contains the ending character position after the text is changed.
     */
    acpNewEnd : Int32

}
