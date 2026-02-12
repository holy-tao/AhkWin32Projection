#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\TextBoxId.ahk
#Include ..\..\..\Text\Core\CoreTextRange.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TextComposition.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ITextEditSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextEditSession
     * @type {Guid}
     */
    static IID => Guid("{0bcad18a-d31b-5787-aff9-995ee743aea8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextBoxId", "get_TextLength", "get_PopulatedRange", "PopulateAsync", "GetText", "GetSelectedRange", "SetSelectedRange", "ReplaceText", "get_Composition", "StartComposition", "StartReconversion", "SubmitPayload", "SubmitPayloadAsync"]

    /**
     * @type {TextBoxId} 
     */
    TextBoxId {
        get => this.get_TextBoxId()
    }

    /**
     * @type {Integer} 
     */
    TextLength {
        get => this.get_TextLength()
    }

    /**
     * @type {CoreTextRange} 
     */
    PopulatedRange {
        get => this.get_PopulatedRange()
    }

    /**
     * @type {TextComposition} 
     */
    Composition {
        get => this.get_Composition()
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_TextBoxId() {
        value := TextBoxId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextLength() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_PopulatedRange() {
        value := CoreTextRange()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CoreTextRange} range 
     * @returns {IAsyncAction} 
     */
    PopulateAsync(range) {
        result := ComCall(9, this, "ptr", range, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * The GetTextAlign function retrieves the text-alignment setting for the specified device context.
     * @remarks
     * The bounding rectangle is a rectangle bounding all of the character cells in a string of text. Its dimensions can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextextentpoint32a">GetTextExtentPoint32</a> function.
     * 
     * The text-alignment flags determine how the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions align a string of text in relation to the string's reference point provided to <b>TextOut</b> or <b>ExtTextOut</b>.
     * 
     * The text-alignment flags are not necessarily single bit flags and may be equal to zero. The flags must be examined in groups of related flags, as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and TA_CENTER</li>
     * <li>TA_BOTTOM, TA_TOP, and TA_BASELINE</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * If the current font has a vertical default base line, the related flags are as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and VTA_BASELINE</li>
     * <li>TA_BOTTOM, TA_TOP, and VTA_CENTER</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * <p class="proch"><b>To verify that a particular flag is set in the return value of this function:</b>
     * 
     * <ol>
     * <li>Apply the bitwise OR operator to the flag and its related flags.</li>
     * <li>Apply the bitwise AND operator to the result and the return value.</li>
     * <li>Test for the equality of this result and the flag.</li>
     * </ol>
     * @param {CoreTextRange} range 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-gettextalign
     */
    GetText(range) {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", range, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    GetSelectedRange() {
        result_ := CoreTextRange()
        result := ComCall(11, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {CoreTextRange} value 
     * @returns {HRESULT} 
     */
    SetSelectedRange(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a system-defined modeless dialog box that lets the user specify a string to search for and a replacement string, as well as options to control the find and replace operations. (Unicode)
     * @remarks
     * The <b>ReplaceText</b> function does not perform a text replacement operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
     * 
     * Before calling <b>ReplaceText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b>, <b>Replace</b>, or <b>Replace All</b> buttons, or when the dialog box is closing. The  <i>lParam</i> parameter of a <b>FINDMSGSTRING</b> message contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
     * 
     * If you create a <b>Replace</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. The <b>IsDialogMessage</b> function returns a value that indicates whether the Replace dialog box processed the message.
     * 
     * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Replace</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The commdlg.h header defines ReplaceText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {CoreTextRange} replaceRange 
     * @param {HSTRING} text 
     * @returns {CoreTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api//content/commdlg/nf-commdlg-replacetextw
     */
    ReplaceText(replaceRange, text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result_ := CoreTextRange()
        result := ComCall(13, this, "ptr", replaceRange, "ptr", text, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {TextComposition} 
     */
    get_Composition() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextComposition(value)
    }

    /**
     * 
     * @returns {TextComposition} 
     */
    StartComposition() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextComposition(result_)
    }

    /**
     * 
     * @param {CoreTextRange} range 
     * @returns {TextComposition} 
     */
    StartReconversion(range) {
        result := ComCall(16, this, "ptr", range, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextComposition(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    SubmitPayload() {
        result := ComCall(17, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    SubmitPayloadAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
