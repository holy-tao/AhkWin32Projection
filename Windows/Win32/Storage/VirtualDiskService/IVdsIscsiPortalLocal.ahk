#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_ISCSI_IPSEC_KEY.ahk" { VDS_ISCSI_IPSEC_KEY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for setting local-initiator-specific IPSEC pre-shared keys on an iSCSI portal.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsiscsiportallocal
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsIscsiPortalLocal extends IUnknown {
    /**
     * The interface identifier for IVdsIscsiPortalLocal
     * @type {Guid}
     */
    static IID := Guid("{ad837c28-52c1-421d-bf04-fae7da665396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsIscsiPortalLocal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIpsecSecurityLocal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsIscsiPortalLocal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Not supported.This method is reserved for future use. (IVdsIscsiPortalLocal.SetIpsecSecurityLocal)
     * @param {Integer} ullSecurityFlags Reserved for future use.
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey Reserved for future use.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not supported in this release.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiportallocal-setipsecsecuritylocal
     */
    SetIpsecSecurityLocal(ullSecurityFlags, pIpsecKey) {
        result := ComCall(3, this, "uint", ullSecurityFlags, VDS_ISCSI_IPSEC_KEY.Ptr, pIpsecKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsIscsiPortalLocal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIpsecSecurityLocal := CallbackCreate(GetMethod(implObj, "SetIpsecSecurityLocal"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIpsecSecurityLocal)
    }
}
