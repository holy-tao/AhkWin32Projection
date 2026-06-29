#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to manage a COM+ object pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicepool
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServicePool extends IUnknown {
    /**
     * The interface identifier for IServicePool
     * @type {Guid}
     */
    static IID := Guid("{b302df81-ea45-451e-99a2-09f9fd1b1e13}")

    /**
     * The class identifier for ServicePool
     * @type {Guid}
     */
    static CLSID := Guid("{ecabb0c9-7f19-11d2-978e-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServicePool interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        GetObject  : IntPtr
        Shutdown   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServicePool.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an object pool.
     * @param {IUnknown} pPoolConfig An object supporting the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicepoolconfig">IServicePoolConfig</a> interface that describes the configuration of the object pool.
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
     * <dt><b>CO_E_ALREADYINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicepool-initialize">Initialize</a> has already been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepool-initialize
     */
    Initialize(pPoolConfig) {
        result := ComCall(3, this, "ptr", pPoolConfig, "HRESULT")
        return result
    }

    /**
     * Retrieves an object from the object pool.
     * @param {Pointer<Guid>} riid A reference to the identifier of the object requested.
     * @param {Pointer<Pointer<Void>>} ppv The requested object.
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
     * <dt><b>CO_E_ACTIVATION_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object activation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_ACTIVATIONFAILED_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object activation failed due to time-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object pool was not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepool-getobject
     */
    GetObject(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Shuts down an object pool.
     * @returns {HRESULT} This method returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepool-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServicePool.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 3)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.Shutdown)
    }
}
