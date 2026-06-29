#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfRangeBackup interface is implemented by the TSF manager and is used by a text service to create a backup copy of the data contained in a range object.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfrangebackup
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfRangeBackup extends IUnknown {
    /**
     * The interface identifier for ITfRangeBackup
     * @type {Guid}
     */
    static IID := Guid("{463a506d-6992-49d2-9b88-93d55e70bb16}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfRangeBackup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Restore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfRangeBackup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfRangeBackup::Restore method
     * @param {Integer} ec Contains an edit cookie that identifies the edit session. This is the value passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that receives the backup information. If this parameter is <b>NULL</b>, the backup information is restored into a copy of the range originally backed up by <b>ITfContext::CreateRangeBackup</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is not on a document stack.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit cookie specified by <i>ec</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pRange</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrangebackup-restore
     */
    Restore(ec, pRange) {
        result := ComCall(3, this, "uint", ec, "ptr", pRange, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfRangeBackup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Restore := CallbackCreate(GetMethod(implObj, "Restore"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Restore)
    }
}
