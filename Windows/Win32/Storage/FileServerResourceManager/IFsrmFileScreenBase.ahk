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
     * 
     * @returns {IFsrmMutableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-get_blockedfilegroups
     */
    get_BlockedFileGroups() {
        result := ComCall(12, this, "ptr*", &blockList := 0, "HRESULT")
        return IFsrmMutableCollection(blockList)
    }

    /**
     * 
     * @param {IFsrmMutableCollection} blockList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-put_blockedfilegroups
     */
    put_BlockedFileGroups(blockList) {
        result := ComCall(13, this, "ptr", blockList, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-get_filescreenflags
     */
    get_FileScreenFlags() {
        result := ComCall(14, this, "int*", &fileScreenFlags := 0, "HRESULT")
        return fileScreenFlags
    }

    /**
     * 
     * @param {Integer} fileScreenFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-put_filescreenflags
     */
    put_FileScreenFlags(fileScreenFlags) {
        result := ComCall(15, this, "int", fileScreenFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} actionType 
     * @returns {IFsrmAction} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-createaction
     */
    CreateAction(actionType) {
        result := ComCall(16, this, "int", actionType, "ptr*", &action := 0, "HRESULT")
        return IFsrmAction(action)
    }

    /**
     * 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-enumactions
     */
    EnumActions() {
        result := ComCall(17, this, "ptr*", &actions := 0, "HRESULT")
        return IFsrmCollection(actions)
    }
}
