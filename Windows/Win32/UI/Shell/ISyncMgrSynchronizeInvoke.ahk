#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enable a registered application to invoke the synchronization manager to update items.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface is implemented by the synchronization manager.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * A registered application calls the methods of this interface to update all items or to update specific items.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrsynchronizeinvoke
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrSynchronizeInvoke extends IUnknown {
    /**
     * The interface identifier for ISyncMgrSynchronizeInvoke
     * @type {Guid}
     */
    static IID := Guid("{6295df2c-35ee-11d1-8707-00c04fd93327}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrSynchronizeInvoke interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdateItems : IntPtr
        UpdateAll   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrSynchronizeInvoke.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Programmatically starts an update for specified items.
     * @param {Integer} dwInvokeFlags Type: <b>DWORD</b>
     * 
     * Specifies how an item should be invoked using the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrinvokeflags">SYNCMGRINVOKEFLAGS</a> enumeration values.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * The CLSID of a registered application to be invoked for an update.
     * @param {Integer} cbCookie Type: <b>DWORD</b>
     * 
     * The size of <i>pCookie</i> data, in bytes.
     * @param {Pointer<Integer>} pCookie Type: <b>const BYTE*</b>
     * 
     * A pointer to a private token that identifies an application. The token is passed in the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-initialize">Initialize</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED and E_OUTOFMEMORY, and the following:
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
     * The synchronization is successfully updated.
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
     * The errors occur during a synchronization update.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizeinvoke-updateitems
     */
    UpdateItems(dwInvokeFlags, clsid, cbCookie, pCookie) {
        pCookieMarshal := pCookie is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwInvokeFlags, Guid.Ptr, clsid, "uint", cbCookie, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * Programmatically starts an update for all items.
     * @remarks
     * This method returns immediately and the synchronization manager performs the synchronizations in a separate process from the calling application.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * Call was completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizeinvoke-updateall
     */
    UpdateAll() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrSynchronizeInvoke.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateItems := CallbackCreate(GetMethod(implObj, "UpdateItems"), flags, 5)
        this.vtbl.UpdateAll := CallbackCreate(GetMethod(implObj, "UpdateAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateItems)
        CallbackFree(this.vtbl.UpdateAll)
    }
}
