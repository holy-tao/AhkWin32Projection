#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumBackgroundCopyGroups.ahk" { IEnumBackgroundCopyGroups }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IBackgroundCopyGroup.ahk" { IBackgroundCopyGroup }

/**
 * Use the IBackgroundCopyQMgr interface to create a new group, retrieve an existing group, or enumerate all groups in the queue. A group contains a download job.
 * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopyqmgr
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyQMgr extends IUnknown {
    /**
     * The interface identifier for IBackgroundCopyQMgr
     * @type {Guid}
     */
    static IID := Guid("{16f41c69-09f5-41d2-8cd8-3c08c47bc8a8}")

    /**
     * The class identifier for BackgroundCopyQMgr
     * @type {Guid}
     */
    static CLSID := Guid("{69ad4aee-51be-439b-a92c-86ae490e8b30}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyQMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateGroup : IntPtr
        GetGroup    : IntPtr
        EnumGroups  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyQMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Use the CreateGroup method to create a new group and add it to the download queue.
     * @param {Guid} guidGroupID GUID that uniquely identifies the group in the download queue.
     * @returns {IBackgroundCopyGroup} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopygroup">IBackgroundCopyGroup</a> interface pointer. Use this interface to manage the group. For example, add a job to the group and set the properties of the group.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-creategroup
     */
    CreateGroup(guidGroupID) {
        result := ComCall(3, this, Guid, guidGroupID, "ptr*", &ppGroup := 0, "HRESULT")
        return IBackgroundCopyGroup(ppGroup)
    }

    /**
     * Use the GetGroup method to retrieve a group from the download queue.
     * @param {Guid} groupID GUID that uniquely identifies the group in the download queue.
     * @returns {IBackgroundCopyGroup} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopygroup">IBackgroundCopyGroup</a> interface pointer. Use this interface to manage the group. For example, add a job to the group and set the properties of the group.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-getgroup
     */
    GetGroup(groupID) {
        result := ComCall(4, this, Guid, groupID, "ptr*", &ppGroup := 0, "HRESULT")
        return IBackgroundCopyGroup(ppGroup)
    }

    /**
     * Use the EnumGroups method to retrieve a list of groups that the current user owns. If the current user has Administrator privileges, the method returns all groups in the queue.
     * @param {Integer} dwFlags Must be 0.
     * @returns {IEnumBackgroundCopyGroups} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ienumbackgroundcopygroups">IEnumBackgroundCopyGroups</a> interface pointer. Use this interface to retrieve a group from the list.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-enumgroups
     */
    EnumGroups(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "ptr*", &ppEnumGroups := 0, "HRESULT")
        return IEnumBackgroundCopyGroups(ppEnumGroups)
    }

    Query(iid) {
        if (IBackgroundCopyQMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateGroup := CallbackCreate(GetMethod(implObj, "CreateGroup"), flags, 3)
        this.vtbl.GetGroup := CallbackCreate(GetMethod(implObj, "GetGroup"), flags, 3)
        this.vtbl.EnumGroups := CallbackCreate(GetMethod(implObj, "EnumGroups"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateGroup)
        CallbackFree(this.vtbl.GetGroup)
        CallbackFree(this.vtbl.EnumGroups)
    }
}
