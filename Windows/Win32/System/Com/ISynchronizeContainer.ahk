#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\ISynchronize.ahk" { ISynchronize }

/**
 * The ISynchronizeContainer (objidlbase.h) interface manages a group of unsignaled synchronization objects.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-isynchronizecontainer
 * @namespace Windows.Win32.System.Com
 */
export default struct ISynchronizeContainer extends IUnknown {
    /**
     * The interface identifier for ISynchronizeContainer
     * @type {Guid}
     */
    static IID := Guid("{00000033-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISynchronizeContainer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddSynchronize : IntPtr
        WaitMultiple   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISynchronizeContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ISynchronizeContainer::AddSynchronize (objidlbase.h) method adds a synchronization object to the container.
     * @remarks
     * A synchronization container can hold pointers to as many as 63 synchronization objects.
     * @param {ISynchronize} pSync A pointer to the synchronization object to be added to the container. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isynchronize">ISynchronize</a>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
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
     * <dt><b>RPC_E_OUT_OF_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The synchronization object container is full.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronizecontainer-addsynchronize
     */
    AddSynchronize(pSync) {
        result := ComCall(3, this, "ptr", pSync, "HRESULT")
        return result
    }

    /**
     * The ISynchronizeContainer::WaitMultiple (objidlbase.h) method waits for any synchronization object in the container to be signaled.
     * @remarks
     * If the caller is waiting in a single-thread apartment, <b>WaitMultiple</b> enters the COM modal loop. If the caller is waiting in a multithread apartment, the caller is blocked until <b>WaitMultiple</b> returns.
     * @param {Integer} dwFlags The wait options. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_FLAGS</a> enumeration. COWAIT_WAITALL is not a valid setting for this method.
     * @param {Integer} dwTimeOut The time this call will wait before returning, in milliseconds. If this parameter is INFINITE, the caller will wait until a synchronization object is signaled, no matter how long it takes. If this parameter is 0, the method returns immediately.
     * @returns {ISynchronize} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isynchronize">ISynchronize</a> interface pointer on the synchronization object that was signaled. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronizecontainer-waitmultiple
     */
    WaitMultiple(dwFlags, dwTimeOut) {
        result := ComCall(4, this, "uint", dwFlags, "uint", dwTimeOut, "ptr*", &ppSync := 0, "HRESULT")
        return ISynchronize(ppSync)
    }

    Query(iid) {
        if (ISynchronizeContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddSynchronize := CallbackCreate(GetMethod(implObj, "AddSynchronize"), flags, 2)
        this.vtbl.WaitMultiple := CallbackCreate(GetMethod(implObj, "WaitMultiple"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddSynchronize)
        CallbackFree(this.vtbl.WaitMultiple)
    }
}
