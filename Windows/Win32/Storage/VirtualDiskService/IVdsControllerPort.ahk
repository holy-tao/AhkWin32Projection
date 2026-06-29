#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVdsController.ahk" { IVdsController }
#Import ".\VDS_PORT_STATUS.ahk" { VDS_PORT_STATUS }
#Import ".\VDS_PORT_PROP.ahk" { VDS_PORT_PROP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * The IVdsControllerPort (vdshwprv.h) interface provides methods for performing query and configuration operations on a controller port.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdscontrollerport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsControllerPort extends IUnknown {
    /**
     * The interface identifier for IVdsControllerPort
     * @type {Guid}
     */
    static IID := Guid("{18691d0d-4e7f-43e8-92e4-cf44beeed11c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsControllerPort interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties       : IntPtr
        GetController       : IntPtr
        QueryAssociatedLuns : IntPtr
        Reset               : IntPtr
        SetStatus           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsControllerPort.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsControllerPort::GetProperties method (vdshwprv.h) retrieves the properties of a controller port.
     * @returns {VDS_PORT_PROP} The address of a member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_port_prop">VDS_PORT_PROP</a> 
     *       structure that is allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszFriendlyName</b> and <b>pwszIdentification</b> strings. Callers 
     *       must free the strings by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> 
     *       function.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-getproperties
     */
    GetProperties() {
        pPortProp := VDS_PORT_PROP()
        result := ComCall(3, this, VDS_PORT_PROP.Ptr, pPortProp, "HRESULT")
        return pPortProp
    }

    /**
     * The IVdsControllerPort::GetController method (vdshwprv.h) returns the controller to which the controller port belongs.
     * @returns {IVdsController} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdscontroller">IVdsController</a> interface pointer. 
     *       Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-getcontroller
     */
    GetController() {
        result := ComCall(4, this, "ptr*", &ppController := 0, "HRESULT")
        return IVdsController(ppController)
    }

    /**
     * The IVdsControllerPort::QueryAssociatedLuns (vdshwprv.h) method returns an enumeration of the LUNs with which the controller port is associated.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the LUNs  as <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the LUN  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-queryassociatedluns
     */
    QueryAssociatedLuns() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsControllerPort::Reset (vdshwprv.h) method reinitializes the controller port.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The controller port was successfully reset.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a provider 
     *         that caches information about the attached devices. The caller can use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to 
     *         restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The controller port object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until previous operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-reset
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The IVdsControllerPort::SetStatus (vdshwprv.h) method sets the status of a controller port to the specified value.
     * @param {VDS_PORT_STATUS} _status A value enumerated by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_port_status">VDS_PORT_STATUS</a> enumeration. Passing in 
     *       <b>VDS_PRS_UNKNOWN</b> fails with <b>E_INVALIDARG</b>.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The status was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a provider 
     *         that caches information about the attached devices. The caller can use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to 
     *         restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The controller port object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until previous operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-setstatus
     */
    SetStatus(_status) {
        result := ComCall(7, this, VDS_PORT_STATUS, _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsControllerPort.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetController := CallbackCreate(GetMethod(implObj, "GetController"), flags, 2)
        this.vtbl.QueryAssociatedLuns := CallbackCreate(GetMethod(implObj, "QueryAssociatedLuns"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.SetStatus := CallbackCreate(GetMethod(implObj, "SetStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetController)
        CallbackFree(this.vtbl.QueryAssociatedLuns)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.SetStatus)
    }
}
