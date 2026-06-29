#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IParseDisplayName.ahk" { IParseDisplayName }

/**
 * Enumerates objects in a compound document or lock a container in the running state. Container and object applications both implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iolecontainer
 * @namespace Windows.Win32.System.Ole
 */
export default struct IOleContainer extends IParseDisplayName {
    /**
     * The interface identifier for IOleContainer
     * @type {Guid}
     */
    static IID := Guid("{0000011b-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOleContainer interfaces
    */
    struct Vtbl extends IParseDisplayName.Vtbl {
        EnumObjects   : IntPtr
        LockContainer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOleContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enumerates the objects in the current container.
     * @remarks
     * A container should implement <b>EnumObjects</b> to enable programmatic clients to find out what objects it holds. This method, however, is not called in standard linking scenarios.
     * @param {Integer} grfFlags Specifies which objects in a container are to be enumerated, as defined in the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olecontf">OLECONTF</a>.
     * @returns {IEnumUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> pointer variable that receives the interface pointer to the enumerator object. Each time a container receives a successful call to <b>EnumObjects</b>, it must increase the reference count on the <i>ppenum</i> pointer the method returns. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when it is done with the pointer. If an error is returned, the implementation must set <i>ppenum</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecontainer-enumobjects
     */
    EnumObjects(grfFlags) {
        result := ComCall(4, this, "uint", grfFlags, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumUnknown(ppenum)
    }

    /**
     * Keeps the container for embedded objects running until explicitly released.
     * @remarks
     * An embedded object calls <b>LockContainer</b> to keep its container running when the object has link clients that require an update. If an end user selects <b>File Close</b> from the container's menu, however, the container ignores all outstanding <b>LockContainer</b> locks and closes the document anyway.
     * @param {BOOL} fLock Indicates whether to lock (<b>TRUE</b>) or unlock (<b>FALSE</b>) a container.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecontainer-lockcontainer
     */
    LockContainer(fLock) {
        result := ComCall(5, this, BOOL, fLock, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOleContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumObjects := CallbackCreate(GetMethod(implObj, "EnumObjects"), flags, 3)
        this.vtbl.LockContainer := CallbackCreate(GetMethod(implObj, "LockContainer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumObjects)
        CallbackFree(this.vtbl.LockContainer)
    }
}
