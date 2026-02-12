#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocumentText.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentTextAuthor extends IDebugDocumentText{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentTextAuthor
     * @type {Guid}
     */
    static IID => Guid("{51973c24-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertText", "RemoveText", "ReplaceText"]

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToInsert 
     * @param {PWSTR} pcharText 
     * @returns {HRESULT} 
     */
    InsertText(cCharacterPosition, cNumToInsert, pcharText) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        result := ComCall(12, this, "uint", cCharacterPosition, "uint", cNumToInsert, "ptr", pcharText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToRemove 
     * @returns {HRESULT} 
     */
    RemoveText(cCharacterPosition, cNumToRemove) {
        result := ComCall(13, this, "uint", cCharacterPosition, "uint", cNumToRemove, "int")
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
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToReplace 
     * @param {PWSTR} pcharText 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with the dialog box or close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following error codes:
     * @see https://learn.microsoft.com/windows/win32/api//content/commdlg/nf-commdlg-replacetextw
     */
    ReplaceText(cCharacterPosition, cNumToReplace, pcharText) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        result := ComCall(14, this, "uint", cCharacterPosition, "uint", cNumToReplace, "ptr", pcharText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
