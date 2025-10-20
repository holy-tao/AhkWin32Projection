#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods that are used to register (create) tasks in the folder, remove tasks from the folder, and create or remove subfolders from the folder.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskfolder
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskFolder extends IDispatch{
    /**
     * The interface identifier for ITaskFolder
     * @type {Guid}
     */
    static IID => Guid("{8cfac062-a080-4c15-9a88-aa7c2af80dfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPath 
     * @returns {HRESULT} 
     */
    get_Path(pPath) {
        result := ComCall(8, this, "ptr", pPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<ITaskFolder>} ppFolder 
     * @returns {HRESULT} 
     */
    GetFolder(path, ppFolder) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(9, this, "ptr", path, "ptr", ppFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<ITaskFolderCollection>} ppFolders 
     * @returns {HRESULT} 
     */
    GetFolders(flags, ppFolders) {
        result := ComCall(10, this, "int", flags, "ptr", ppFolders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} subFolderName 
     * @param {VARIANT} sddl 
     * @param {Pointer<ITaskFolder>} ppFolder 
     * @returns {HRESULT} 
     */
    CreateFolder(subFolderName, sddl, ppFolder) {
        subFolderName := subFolderName is String ? BSTR.Alloc(subFolderName).Value : subFolderName

        result := ComCall(11, this, "ptr", subFolderName, "ptr", sddl, "ptr", ppFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} subFolderName 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    DeleteFolder(subFolderName, flags) {
        subFolderName := subFolderName is String ? BSTR.Alloc(subFolderName).Value : subFolderName

        result := ComCall(12, this, "ptr", subFolderName, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IRegisteredTask>} ppTask 
     * @returns {HRESULT} 
     */
    GetTask(path, ppTask) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(13, this, "ptr", path, "ptr", ppTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IRegisteredTaskCollection>} ppTasks 
     * @returns {HRESULT} 
     */
    GetTasks(flags, ppTasks) {
        result := ComCall(14, this, "int", flags, "ptr", ppTasks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    DeleteTask(name, flags) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(15, this, "ptr", name, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {BSTR} xmlText 
     * @param {Integer} flags 
     * @param {VARIANT} userId 
     * @param {VARIANT} password 
     * @param {Integer} logonType 
     * @param {VARIANT} sddl 
     * @param {Pointer<IRegisteredTask>} ppTask 
     * @returns {HRESULT} 
     */
    RegisterTask(path, xmlText, flags, userId, password, logonType, sddl, ppTask) {
        path := path is String ? BSTR.Alloc(path).Value : path
        xmlText := xmlText is String ? BSTR.Alloc(xmlText).Value : xmlText

        result := ComCall(16, this, "ptr", path, "ptr", xmlText, "int", flags, "ptr", userId, "ptr", password, "int", logonType, "ptr", sddl, "ptr", ppTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<ITaskDefinition>} pDefinition 
     * @param {Integer} flags 
     * @param {VARIANT} userId 
     * @param {VARIANT} password 
     * @param {Integer} logonType 
     * @param {VARIANT} sddl 
     * @param {Pointer<IRegisteredTask>} ppTask 
     * @returns {HRESULT} 
     */
    RegisterTaskDefinition(path, pDefinition, flags, userId, password, logonType, sddl, ppTask) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(17, this, "ptr", path, "ptr", pDefinition, "int", flags, "ptr", userId, "ptr", password, "int", logonType, "ptr", sddl, "ptr", ppTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} securityInformation 
     * @param {Pointer<BSTR>} pSddl 
     * @returns {HRESULT} 
     */
    GetSecurityDescriptor(securityInformation, pSddl) {
        result := ComCall(18, this, "int", securityInformation, "ptr", pSddl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} sddl 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    SetSecurityDescriptor(sddl, flags) {
        sddl := sddl is String ? BSTR.Alloc(sddl).Value : sddl

        result := ComCall(19, this, "ptr", sddl, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
