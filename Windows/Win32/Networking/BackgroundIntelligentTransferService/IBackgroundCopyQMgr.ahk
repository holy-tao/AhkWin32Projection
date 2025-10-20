#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Guid} guidGroupID 
     * @param {Pointer<IBackgroundCopyGroup>} ppGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-creategroup
     */
    CreateGroup(guidGroupID, ppGroup) {
        result := ComCall(3, this, "ptr", guidGroupID, "ptr*", ppGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} groupID 
     * @param {Pointer<IBackgroundCopyGroup>} ppGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-getgroup
     */
    GetGroup(groupID, ppGroup) {
        result := ComCall(4, this, "ptr", groupID, "ptr*", ppGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IEnumBackgroundCopyGroups>} ppEnumGroups 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-enumgroups
     */
    EnumGroups(dwFlags, ppEnumGroups) {
        result := ComCall(5, this, "uint", dwFlags, "ptr*", ppEnumGroups, "HRESULT")
        return result
    }
}
