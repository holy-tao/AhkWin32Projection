#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a generic callback mechanism for interruptible processes that should periodically ask an object whether to continue.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-icontinuecallback
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IContinueCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContinueCallback
     * @type {Guid}
     */
    static IID => Guid("{b722bcca-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FContinue", "FContinuePrinting"]

    /**
     * Indicates whether a generic operation should continue.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Continue the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cancel the operation as soon as possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-icontinuecallback-fcontinue
     */
    FContinue() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether a lengthy printing operation should continue.
     * @param {Integer} nCntPrinted The total number of pages that have been printed at the time the object receives a call to <b>FContinuePrinting</b>.
     * @param {Integer} nCurPage The page number of the page being printed at the time the object receives a call to <b>FContinuePrinting</b>.
     * @param {PWSTR} pwszPrintStatus A pointer to the message about the current status of the print job. The object being printed may or may not display this message to the user. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return value E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Continue the printing operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cancel the printing operation as soon as possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-icontinuecallback-fcontinueprinting
     */
    FContinuePrinting(nCntPrinted, nCurPage, pwszPrintStatus) {
        pwszPrintStatus := pwszPrintStatus is String ? StrPtr(pwszPrintStatus) : pwszPrintStatus

        result := ComCall(4, this, "int", nCntPrinted, "int", nCurPage, "ptr", pwszPrintStatus, "HRESULT")
        return result
    }
}
