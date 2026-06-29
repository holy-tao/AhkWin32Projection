#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Transfers the foreground window to the process hosting the COM server.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iforegroundtransfer
 * @namespace Windows.Win32.System.Com
 */
export default struct IForegroundTransfer extends IUnknown {
    /**
     * The interface identifier for IForegroundTransfer
     * @type {Guid}
     */
    static IID := Guid("{00000145-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IForegroundTransfer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AllowForegroundTransfer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IForegroundTransfer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Yields the foreground window to the COM server process.
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
     * The method completed successfully.
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
     * The <i>lpvReserved</i> parameter is not <b>NULL</b>, or this interface is on a proxy that does not support foreground control.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iforegroundtransfer-allowforegroundtransfer
     */
    AllowForegroundTransfer() {
        static lpvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", lpvReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IForegroundTransfer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AllowForegroundTransfer := CallbackCreate(GetMethod(implObj, "AllowForegroundTransfer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AllowForegroundTransfer)
    }
}
