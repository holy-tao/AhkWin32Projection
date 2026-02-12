#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The AutoCorrectProc function is an application-defined callback function that is used with the EM_SETAUTOCORRECTPROC message.
 * @see https://learn.microsoft.com/windows/win32/api//content/richedit/nc-richedit-autocorrectproc
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class AutoCorrectProc extends IUnknown {

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
     * @param {Integer} langid 
     * @param {PWSTR} pszBefore 
     * @param {PWSTR} pszAfter 
     * @param {Integer} cchAfter 
     * @param {Pointer<Integer>} pcchReplaced 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(langid, pszBefore, pszAfter, cchAfter, pcchReplaced) {
        pszBefore := pszBefore is String ? StrPtr(pszBefore) : pszBefore
        pszAfter := pszAfter is String ? StrPtr(pszAfter) : pszAfter

        pcchReplacedMarshal := pcchReplaced is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ushort", langid, "ptr", pszBefore, "ptr", pszAfter, "int", cchAfter, pcchReplacedMarshal, pcchReplaced, "int")
        return result
    }
}
