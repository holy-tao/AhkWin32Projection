#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IFsrmMutableCollection>} blockList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-get_blockedfilegroups
     */
    get_BlockedFileGroups(blockList) {
        result := ComCall(12, this, "ptr*", blockList, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} fileScreenFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-get_filescreenflags
     */
    get_FileScreenFlags(fileScreenFlags) {
        result := ComCall(14, this, "int*", fileScreenFlags, "HRESULT")
        return result
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
     * @param {Pointer<IFsrmAction>} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-createaction
     */
    CreateAction(actionType, action) {
        result := ComCall(16, this, "int", actionType, "ptr*", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} actions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreenbase-enumactions
     */
    EnumActions(actions) {
        result := ComCall(17, this, "ptr*", actions, "HRESULT")
        return result
    }
}
