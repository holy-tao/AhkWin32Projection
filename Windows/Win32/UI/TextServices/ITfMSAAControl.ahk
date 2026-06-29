#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfMSAAControl interface is used by Microsoft Active Accessibility to add or remove a document from TSF control, to avoid unnecessary overhead in TSF. This interface is not recommended for use by other applications.
 * @see https://learn.microsoft.com/windows/win32/api/msaatext/nn-msaatext-itfmsaacontrol
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfMSAAControl extends IUnknown {
    /**
     * The interface identifier for ITfMSAAControl
     * @type {Guid}
     */
    static IID := Guid("{b5f8fb3b-393f-4f7c-84cb-504924c2705a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfMSAAControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SystemEnableMSAA  : IntPtr
        SystemDisableMSAA : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfMSAAControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfMSAAControl::SystemEnableMSAA method
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-itfmsaacontrol-systemenablemsaa
     */
    SystemEnableMSAA() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfMSAAControl::SystemDisableMSAA method
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-itfmsaacontrol-systemdisablemsaa
     */
    SystemDisableMSAA() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfMSAAControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SystemEnableMSAA := CallbackCreate(GetMethod(implObj, "SystemEnableMSAA"), flags, 1)
        this.vtbl.SystemDisableMSAA := CallbackCreate(GetMethod(implObj, "SystemDisableMSAA"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SystemEnableMSAA)
        CallbackFree(this.vtbl.SystemDisableMSAA)
    }
}
