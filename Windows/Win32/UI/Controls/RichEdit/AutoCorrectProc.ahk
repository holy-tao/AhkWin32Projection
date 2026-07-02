#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The AutoCorrectProc function is an application-defined callback function that is used with the EM_SETAUTOCORRECTPROC message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/nc-richedit-autocorrectproc
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct AutoCorrectProc {
    value : IntPtr

    __value {
        set {
            if (value is AutoCorrectProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} langid Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LANGID</a></b>
     * 
     * Language ID that identifies the autocorrect file to use for automatic correcting.
     * @param {PWSTR} pszBefore Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>*</b>
     * 
     * Autocorrect candidate string.
     * @param {PWSTR} pszAfter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>*</b>
     * 
     * Resulting autocorrect string, if the return value is not <b>ATP_NOCHANGE</b>.
     * @param {Integer} cchAfter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Count of characters in <i>pszAfter</i>.
     * @param {Pointer<Integer>} pcchReplaced Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * Count of trailing characters in <i>pszBefore</i> to replace with <i>pszAfter</i>.
     * @returns {Integer} Type: <b>int</b>
     * 
     * Returns one or more of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ATP_NOCHANGE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No change.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ATP_CHANGE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Change but don’t replace most delimiters, and don’t replace a span of unchanged trailing characters (preserves their formatting).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ATP_NODELIMITER</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Change but don’t replace a span of unchanged trailing characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ATP_REPLACEALLTEXT</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replace trailing characters even if they are not changed (uses the same formatting for the entire replacement string). 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(langid, pszBefore, pszAfter, cchAfter, pcchReplaced) {
        pszBefore := pszBefore is String ? StrPtr(pszBefore) : pszBefore
        pszAfter := pszAfter is String ? StrPtr(pszAfter) : pszAfter

        pcchReplacedMarshal := pcchReplaced is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UInt16, langid, "ptr", pszBefore, "ptr", pszAfter, Int32, cchAfter, pcchReplacedMarshal, pcchReplaced, Int32)
        return result
    }

    /**
     * A AutoCorrectProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends AutoCorrectProc {
        /**
         * Creates a AutoCorrectProc pointer that invokes the given AHK function when called.
         * @param {Func(UInt16, PWSTR, PWSTR, Int32, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt16, PWSTR, PWSTR, Int32, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
