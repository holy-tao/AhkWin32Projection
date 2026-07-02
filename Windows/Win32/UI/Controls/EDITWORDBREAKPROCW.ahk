#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WORD_BREAK_ACTION.ahk" { WORD_BREAK_ACTION }

/**
 * An application-defined callback function used with the EM_SETWORDBREAKPROC message. (Unicode)
 * @remarks
 * A carriage return followed by a line feed must be treated as a single word by the callback function. Two carriage returns followed by a line feed also must be treated as a single word. 
 * 
 * An application must install the callback function by specifying the address of the callback function in an <a href="https://docs.microsoft.com/windows/desktop/Controls/em-setwordbreakproc">EM_SETWORDBREAKPROC</a> message. 
 * 
 * <b>Rich Edit 1.0:</b>Microsoft Rich Edit 1.0 only passes back ANSI characters to <i>EditWordBreakProc</i>. For rich edit controls, you can alternately use the <a href="https://docs.microsoft.com/windows/desktop/Controls/em-setwordbreakprocex">EM_SETWORDBREAKPROCEX</a> message to replace the default extended word break procedure with an <a href="https://docs.microsoft.com/windows/desktop/api/richedit/nc-richedit-editwordbreakprocex">EditWordBreakProcEx</a> callback function. This function provides additional information about the text, such as the character set. 
 * 
 * <b>Rich Edit 2.0 and later:</b>Microsoft Rich Edit 2.0 and later only pass back Unicode characters to <i>EditWordBreakProc</i>. Thus, an ANSI application would convert the Rich Edit-supplied Unicode string using <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a>, and then translate the indices appropriately. 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines EDITWORDBREAKPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-editwordbreakprocw
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct EDITWORDBREAKPROCW {
    value : IntPtr

    __value {
        set {
            if (value is EDITWORDBREAKPROCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * A pointer to the text of the edit control.
     * @param {Integer} ichCurrent Type: <b>int</b>
     * 
     * An index to a character position in the buffer of text that identifies the point at which the function should begin checking for a word break.
     * @param {Integer} cch Type: <b>int</b>
     * 
     * The number of 
     * 					<b>TCHARs</b> in the edit control text. For the ANSI text, this is the number of bytes; for the Unicode text, this is the number of WCHARs.
     * @param {WORD_BREAK_ACTION} code Type: <b>int</b>
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the 
     * 						<i>code</i> parameter specifies <b>WB_ISDELIMITER</b>, the return value is nonzero (TRUE) if the character at the specified position is a delimiter, or zero if it is not. If the 
     * 						<i>code</i> parameter specifies <b>WB_CLASSIFY</b>, the return value is the character class and word break flags of the character at the specified position. Otherwise, the return value is an index to the beginning of a word in the buffer of text.
     */
    Call(lpch, ichCurrent, cch, code) {
        lpch := lpch is String ? StrPtr(lpch) : lpch

        result := DllCall(this.value, "ptr", lpch, Int32, ichCurrent, Int32, cch, WORD_BREAK_ACTION, code, Int32)
        return result
    }

    /**
     * A EDITWORDBREAKPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EDITWORDBREAKPROCW {
        /**
         * Creates a EDITWORDBREAKPROCW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Int32, Int32, WORD_BREAK_ACTION) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Int32, Int32, WORD_BREAK_ACTION, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
