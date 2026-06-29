#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * . (ISuspensionDependencyManager)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-isuspensiondependencymanager
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISuspensionDependencyManager extends IUnknown {
    /**
     * The interface identifier for ISuspensionDependencyManager
     * @type {Guid}
     */
    static IID := Guid("{52b83a42-2543-416a-81d9-c0de7969c8b3}")

    /**
     * The class identifier for SuspensionDependencyManager
     * @type {Guid}
     */
    static CLSID := Guid("{6b273fc5-61fd-4918-95a2-c3b5e9d7f581}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISuspensionDependencyManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterAsChild        : IntPtr
        GroupChildWithParent   : IntPtr
        UngroupChildFromParent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISuspensionDependencyManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ISuspensionDependencyManager::RegisterAsChild method
     * @param {HANDLE} processHandle Type: <b>HANDLE</b>
     * 
     * The process to be registered as a child.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isuspensiondependencymanager-registeraschild
     */
    RegisterAsChild(processHandle) {
        result := ComCall(3, this, HANDLE, processHandle, "HRESULT")
        return result
    }

    /**
     * ISuspensionDependencyManager::GroupChildWithParent method
     * @param {HANDLE} childProcessHandle Type: <b>HANDLE</b>
     * 
     * The child process to group with the parent process.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isuspensiondependencymanager-groupchildwithparent
     */
    GroupChildWithParent(childProcessHandle) {
        result := ComCall(4, this, HANDLE, childProcessHandle, "HRESULT")
        return result
    }

    /**
     * ISuspensionDependencyManager::UngroupChildFromParent method
     * @param {HANDLE} childProcessHandle Type: <b>HANDLE</b>
     * 
     * The child process to ungroup from the parent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isuspensiondependencymanager-ungroupchildfromparent
     */
    UngroupChildFromParent(childProcessHandle) {
        result := ComCall(5, this, HANDLE, childProcessHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISuspensionDependencyManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterAsChild := CallbackCreate(GetMethod(implObj, "RegisterAsChild"), flags, 2)
        this.vtbl.GroupChildWithParent := CallbackCreate(GetMethod(implObj, "GroupChildWithParent"), flags, 2)
        this.vtbl.UngroupChildFromParent := CallbackCreate(GetMethod(implObj, "UngroupChildFromParent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterAsChild)
        CallbackFree(this.vtbl.GroupChildWithParent)
        CallbackFree(this.vtbl.UngroupChildFromParent)
    }
}
