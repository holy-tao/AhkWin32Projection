#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyGroup.ahk
#Include .\IEnumBackgroundCopyGroups.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyQMgr interface to create a new group, retrieve an existing group, or enumerate all groups in the queue. A group contains a download job.
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/nn-qmgr-ibackgroundcopyqmgr
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyQMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyQMgr
     * @type {Guid}
     */
    static IID => Guid("{16f41c69-09f5-41d2-8cd8-3c08c47bc8a8}")

    /**
     * The class identifier for BackgroundCopyQMgr
     * @type {Guid}
     */
    static CLSID => Guid("{69ad4aee-51be-439b-a92c-86ae490e8b30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateGroup", "GetGroup", "EnumGroups"]

    /**
     * Use the CreateGroup method to create a new group and add it to the download queue.
     * @param {Guid} guidGroupID GUID that uniquely identifies the group in the download queue.
     * @returns {IBackgroundCopyGroup} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopygroup">IBackgroundCopyGroup</a> interface pointer. Use this interface to manage the group. For example, add a job to the group and set the properties of the group.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyqmgr-creategroup
     */
    CreateGroup(guidGroupID) {
        result := ComCall(3, this, "ptr", guidGroupID, "ptr*", &ppGroup := 0, "HRESULT")
        return IBackgroundCopyGroup(ppGroup)
    }

    /**
     * Use the GetGroup method to retrieve a group from the download queue.
     * @param {Guid} groupID GUID that uniquely identifies the group in the download queue.
     * @returns {IBackgroundCopyGroup} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopygroup">IBackgroundCopyGroup</a> interface pointer. Use this interface to manage the group. For example, add a job to the group and set the properties of the group.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyqmgr-getgroup
     */
    GetGroup(groupID) {
        result := ComCall(4, this, "ptr", groupID, "ptr*", &ppGroup := 0, "HRESULT")
        return IBackgroundCopyGroup(ppGroup)
    }

    /**
     * Use the EnumGroups method to retrieve a list of groups that the current user owns. If the current user has Administrator privileges, the method returns all groups in the queue.
     * @param {Integer} dwFlags Must be 0.
     * @returns {IEnumBackgroundCopyGroups} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ienumbackgroundcopygroups">IEnumBackgroundCopyGroups</a> interface pointer. Use this interface to retrieve a group from the list.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyqmgr-enumgroups
     */
    EnumGroups(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "ptr*", &ppEnumGroups := 0, "HRESULT")
        return IEnumBackgroundCopyGroups(ppEnumGroups)
    }
}
