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
     * 
     * @param {Pointer<IFsrmMutableCollection>} blockList 
     * @returns {HRESULT} 
     */
    get_BlockedFileGroups(blockList) {
        result := ComCall(12, this, "ptr", blockList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmMutableCollection>} blockList 
     * @returns {HRESULT} 
     */
    put_BlockedFileGroups(blockList) {
        result := ComCall(13, this, "ptr", blockList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} fileScreenFlags 
     * @returns {HRESULT} 
     */
    get_FileScreenFlags(fileScreenFlags) {
        result := ComCall(14, this, "int*", fileScreenFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fileScreenFlags 
     * @returns {HRESULT} 
     */
    put_FileScreenFlags(fileScreenFlags) {
        result := ComCall(15, this, "int", fileScreenFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} actionType 
     * @param {Pointer<IFsrmAction>} action 
     * @returns {HRESULT} 
     */
    CreateAction(actionType, action) {
        result := ComCall(16, this, "int", actionType, "ptr", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} actions 
     * @returns {HRESULT} 
     */
    EnumActions(actions) {
        result := ComCall(17, this, "ptr", actions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
