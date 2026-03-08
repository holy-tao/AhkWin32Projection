#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugCriticalErrorEvent110 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDebugCriticalErrorEvent110
     * @type {Guid}
     */
    static IID => Guid("{2f69c611-6b14-47e8-9260-4bb7c52f504b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetErrorInfo"]

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @remarks
     * This function returns a pointer to the most recently set <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> pointer in the current logical thread. It transfers ownership of the error object to the caller, and clears the error state for the thread.
     * 
     * Making a COM call that goes through a proxy-stub will clear any existing error object for the calling thread. A called object should not make any such calls after calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a> and before returning. The caller should not make any such calls after the call returns and before calling <b>GetErrorInfo</b>. As a rule of thumb, an interface method should return as soon as possible after calling <b>SetErrorInfo</b>, and the caller should call <b>GetErrorInfo</b> as soon as possible after the call returns.
     * @param {Pointer<BSTR>} pbstrSource 
     * @param {Pointer<Integer>} pMessageId 
     * @param {Pointer<BSTR>} pbstrMessage 
     * @param {Pointer<IDebugDocumentContext>} ppLocation 
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
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
     * There was no error object to return.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(pbstrSource, pMessageId, pbstrMessage, ppLocation) {
        pMessageIdMarshal := pMessageId is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pbstrSource, pMessageIdMarshal, pMessageId, "ptr", pbstrMessage, "ptr*", ppLocation, "HRESULT")
        return result
    }
}
