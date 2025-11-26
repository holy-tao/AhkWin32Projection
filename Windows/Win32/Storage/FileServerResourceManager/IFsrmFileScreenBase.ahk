#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmMutableCollection.ahk
#Include .\IFsrmAction.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmObject.ahk

/**
 * Base class for all file screen interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilescreenbase
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenBase extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileScreenBase
     * @type {Guid}
     */
    static IID => Guid("{f3637e80-5b22-4a2b-a637-bbb642b41cfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BlockedFileGroups", "put_BlockedFileGroups", "get_FileScreenFlags", "put_FileScreenFlags", "CreateAction", "EnumActions"]

    /**
     * @type {IFsrmMutableCollection} 
     */
    BlockedFileGroups {
        get => this.get_BlockedFileGroups()
        set => this.put_BlockedFileGroups(value)
    }

    /**
     * @type {Integer} 
     */
    FileScreenFlags {
        get => this.get_FileScreenFlags()
        set => this.put_FileScreenFlags(value)
    }

    /**
     * Retrieves or sets the names of the file groups that contain the file name patterns used to specify the files that are blocked by this screen.
     * @remarks
     * 
     * To specify the blocked group names on a new screen, access this property to get an empty collection and then add the group names to the collection.
     * 
     * 
     * 
     * @returns {IFsrmMutableCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-get_blockedfilegroups
     */
    get_BlockedFileGroups() {
        result := ComCall(12, this, "ptr*", &blockList := 0, "HRESULT")
        return IFsrmMutableCollection(blockList)
    }

    /**
     * Retrieves or sets the names of the file groups that contain the file name patterns used to specify the files that are blocked by this screen.
     * @remarks
     * 
     * To specify the blocked group names on a new screen, access this property to get an empty collection and then add the group names to the collection.
     * 
     * 
     * 
     * @param {IFsrmMutableCollection} blockList 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-put_blockedfilegroups
     */
    put_BlockedFileGroups(blockList) {
        result := ComCall(13, this, "ptr", blockList, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the file screen flags.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-get_filescreenflags
     */
    get_FileScreenFlags() {
        result := ComCall(14, this, "int*", &fileScreenFlags := 0, "HRESULT")
        return fileScreenFlags
    }

    /**
     * Retrieves or sets the file screen flags.
     * @param {Integer} fileScreenFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-put_filescreenflags
     */
    put_FileScreenFlags(fileScreenFlags) {
        result := ComCall(15, this, "int", fileScreenFlags, "HRESULT")
        return result
    }

    /**
     * Creates an action for this file screen object.
     * @param {Integer} actionType The type of action to create. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmactiontype">FsrmActionType</a> enumeration.
     * @returns {IFsrmAction} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmaction">IFsrmAction</a> interface to the newly created action. 
     *       Query the interface for the specific action specified. For example, if <i>actionType</i> is 
     *       <b>FsrmActionType_Command</b>, query <i>action</i> for the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmactioncommand">IFsrmActionCommand</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-createaction
     */
    CreateAction(actionType) {
        result := ComCall(16, this, "int", actionType, "ptr*", &action := 0, "HRESULT")
        return IFsrmAction(action)
    }

    /**
     * Enumerates all the actions for the file screen object.
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a collection of actions that are defined for the object.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmaction">IFsrmAction</a> interface. You can then use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmaction-get_actiontype">IFsrmAction::ActionType</a> property to determine the type of action.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-enumactions
     */
    EnumActions() {
        result := ComCall(17, this, "ptr*", &actions := 0, "HRESULT")
        return IFsrmCollection(actions)
    }
}
