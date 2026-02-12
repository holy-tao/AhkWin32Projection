#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the EM_SETWORDBREAKPROC message. (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nc-winuser-editwordbreakproca
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class EDITWORDBREAKPROCA extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {PSTR} lpch 
     * @param {Integer} ichCurrent 
     * @param {Integer} cch 
     * @param {Integer} code 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpch, ichCurrent, cch, code) {
        lpch := lpch is String ? StrPtr(lpch) : lpch

        result := ComCall(3, this, "ptr", lpch, "int", ichCurrent, "int", cch, "int", code, "int")
        return result
    }
}
