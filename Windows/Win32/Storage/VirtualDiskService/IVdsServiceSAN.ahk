#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_SAN_POLICY.ahk" { VDS_SAN_POLICY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for managing disk online and offline SAN policy for the operating system.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsservicesan
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsServiceSAN extends IUnknown {
    /**
     * The interface identifier for IVdsServiceSAN
     * @type {Guid}
     */
    static IID := Guid("{fc5d23e8-a88b-41a5-8de0-2d2f73c5a630}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsServiceSAN interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSANPolicy : IntPtr
        SetSANPolicy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsServiceSAN.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the disk SAN policy for the operating system.
     * @returns {VDS_SAN_POLICY} A pointer to a variable that receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">VDS_SAN_POLICY</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservicesan-getsanpolicy
     */
    GetSANPolicy() {
        result := ComCall(3, this, "int*", &pSanPolicy := 0, "HRESULT")
        return pSanPolicy
    }

    /**
     * Sets the disk SAN policy for the operating system.
     * @param {VDS_SAN_POLICY} SanPolicy A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">VDS_SAN_POLICY</a> enumeration that specifies the SAN policy.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_SET_SAN_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A driver error was reported when setting the SAN policy.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservicesan-setsanpolicy
     */
    SetSANPolicy(SanPolicy) {
        result := ComCall(4, this, VDS_SAN_POLICY, SanPolicy, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsServiceSAN.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSANPolicy := CallbackCreate(GetMethod(implObj, "GetSANPolicy"), flags, 2)
        this.vtbl.SetSANPolicy := CallbackCreate(GetMethod(implObj, "SetSANPolicy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSANPolicy)
        CallbackFree(this.vtbl.SetSANPolicy)
    }
}
