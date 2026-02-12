#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The EditWordBreakProcEx function is an application defined callback function used with the EM_SETWORDBREAKPROCEX message.
 * @remarks
 * An application must install the callback function by specifying the address of the callback function in an <a href="https://msdn.microsoft.com/2b45f747-ae15-470b-a786-98d8135289da">EM_SETWORDBREAKPROCEX</a> message. 
 * 
 * For Microsoft Rich Edit 2.0 and later, Rich Edit no longer supports <i>EditWordBreakProcEx</i>. Users can send 
 * 				<a href="https://msdn.microsoft.com/e5029b75-5f35-43a5-876d-24e81605bb49">EM_SETWORDBREAKPROC</a> to set <a href="https://docs.microsoft.com/windows/win32/api/winuser/nc-winuser-editwordbreakproca">EditWordBreakProc</a>, which is now enhanced to support the passing of Unicode text.
 * @see https://learn.microsoft.com/windows/win32/api//content/richedit/nc-richedit-editwordbreakprocex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class EDITWORDBREAKPROCEX extends IUnknown {

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
     * @param {PSTR} pchText 
     * @param {Integer} cchText 
     * @param {Integer} bCharSet 
     * @param {Integer} action 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pchText, cchText, bCharSet, action) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(3, this, "ptr", pchText, "int", cchText, "char", bCharSet, "int", action, "int")
        return result
    }
}
