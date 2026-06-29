#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_OBJECT_TYPE.ahk" { VDS_OBJECT_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to enable VDS to perform miscellaneous operations on provider objects.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsproviderprivate
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsProviderPrivate extends IUnknown {
    /**
     * The interface identifier for IVdsProviderPrivate
     * @type {Guid}
     */
    static IID := Guid("{11f3cd41-b7e8-48ff-9472-9dff018aa292}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsProviderPrivate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetObject : IntPtr
        OnLoad    : IntPtr
        OnUnload  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsProviderPrivate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the specified object.
     * @remarks
     * The object can be a  subsystem, controller, LUN, LUN plex, drive, pack, disk, volume, or volume plex object. Each object represents a physical device (such as a subsystem, drive, or controllers) or a virtual device (such as a LUN or LUN plex). The hardware provider should create one COM object for each physical or virtual device.
     * @param {Guid} _ObjectId The GUID of the object.
     * @param {VDS_OBJECT_TYPE} type The object type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a>.
     * @returns {IUnknown} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer for the object. When the pointer is no longer needed, the caller should release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-getobject
     */
    GetObject(_ObjectId, type) {
        result := ComCall(3, this, Guid, _ObjectId, VDS_OBJECT_TYPE, type, "ptr*", &ppObjectUnk := 0, "HRESULT")
        return IUnknown(ppObjectUnk)
    }

    /**
     * Prompts the provider to initialize itself, and passes a callback object that the provider uses to get necessary interfaces.
     * @remarks
     * VDS calls this method immediately after calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> method on a provider.
     * 
     * Implementers must implement this method. Invoke the  <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method 
     *     to query for the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface.
     * @param {PWSTR} pwszMachineName This parameter is reserved.
     * @param {IUnknown} pCallbackObject Pointer to a callback object.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider failed to initialize.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload
     */
    OnLoad(pwszMachineName, pCallbackObject) {
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName

        result := ComCall(4, this, "ptr", pwszMachineName, "ptr", pCallbackObject, "HRESULT")
        return result
    }

    /**
     * Prompts the provider object to uninitialize itself.
     * @remarks
     * VDS calls this method immediately before releasing the reference to the provider object. When the reference count drops to zero, the provider unloads. If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload">OnLoad</a> method fails, VDS does not call <b>OnUnload</b>.
     * 
     * <b>Notes to implementers:  </b>You must perform all necessary clean up, even without the call to <b>OnUnload</b>.
     * @param {BOOL} bForceUnload If true, VDS attempts to forcibly unload the provider. If false, VDS makes no such attempt.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is unloaded.
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
     * The provider is unable to unload at this time. VDS tries again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onunload
     */
    OnUnload(bForceUnload) {
        result := ComCall(5, this, BOOL, bForceUnload, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsProviderPrivate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 4)
        this.vtbl.OnLoad := CallbackCreate(GetMethod(implObj, "OnLoad"), flags, 3)
        this.vtbl.OnUnload := CallbackCreate(GetMethod(implObj, "OnUnload"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.OnLoad)
        CallbackFree(this.vtbl.OnUnload)
    }
}
