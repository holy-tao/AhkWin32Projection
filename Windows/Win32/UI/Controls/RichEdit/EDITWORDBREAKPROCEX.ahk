#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The EditWordBreakProcEx function is an application defined callback function used with the EM_SETWORDBREAKPROCEX message.
 * @remarks
 * An application must install the callback function by specifying the address of the callback function in an <a href="https://msdn.microsoft.com/2b45f747-ae15-470b-a786-98d8135289da">EM_SETWORDBREAKPROCEX</a> message. 
 * 
 * For Microsoft Rich Edit 2.0 and later, Rich Edit no longer supports <i>EditWordBreakProcEx</i>. Users can send 
 * 				<a href="https://msdn.microsoft.com/e5029b75-5f35-43a5-876d-24e81605bb49">EM_SETWORDBREAKPROC</a> to set <a href="https://docs.microsoft.com/windows/win32/api/winuser/nc-winuser-editwordbreakproca">EditWordBreakProc</a>, which is now enhanced to support the passing of Unicode text.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/nc-richedit-editwordbreakprocex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct EDITWORDBREAKPROCEX {
    value : IntPtr

    __value {
        set {
            if (value is EDITWORDBREAKPROCEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} pchText Type: <b>char*</b>
     * 
     * Pointer to the text at the current position. If 
     * 					<i>code</i> specifies movement to the left, the text is in the elements 
     * 					<i>pchText</i> 
     * 					[–1] through 
     * 					<i>pchText</i> [-<i>cchText</i>], and 
     * 					<i>pchText</i>[0] is undefined. For all other actions, the text is in the elements 
     * 					<i>pchText</i>[0] through 
     * 					<i>pchText</i>[
     * 					<i>cchText</i>–1].
     * @param {Integer} cchText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Number of characters in the buffer in the direction specified by 
     * 					<i>code</i>.
     * @param {Integer} bCharSet Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Character set of the text.
     * @param {Integer} action 
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The function returns a value based on the 
     * 						<i>code</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>code parameter</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return value
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WB_CLASSIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the character class and word-break flags of the character at the specified position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WB_ISDELIMITER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns <b>TRUE</b> if the character at the specified position is a delimiter or <b>FALSE</b> if the character is not.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>All other values</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the character index of the word break.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pchText, cchText, bCharSet, action) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := DllCall(this.value, "ptr", pchText, Int32, cchText, Int8, bCharSet, Int32, action, Int32)
        return result
    }

    /**
     * A EDITWORDBREAKPROCEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EDITWORDBREAKPROCEX {
        /**
         * Creates a EDITWORDBREAKPROCEX pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, Int32, Int8, Int32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, Int32, Int8, Int32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
