#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITaskFolder.ahk
#Include .\ITaskFolderCollection.ahk
#Include .\IRegisteredTask.ahk
#Include .\IRegisteredTaskCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods that are used to register (create) tasks in the folder, remove tasks from the folder, and create or remove subfolders from the folder.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskfolder
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskFolder extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Path", "GetFolder", "GetFolders", "CreateFolder", "DeleteFolder", "GetTask", "GetTasks", "DeleteTask", "RegisterTask", "RegisterTaskDefinition", "GetSecurityDescriptor", "SetSecurityDescriptor"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-get_path
     */
    get_Path() {
        pPath := BSTR()
        result := ComCall(8, this, "ptr", pPath, "HRESULT")
        return pPath
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {ITaskFolder} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-getfolder
     */
    GetFolder(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(9, this, "ptr", path, "ptr*", &ppFolder := 0, "HRESULT")
        return ITaskFolder(ppFolder)
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {ITaskFolderCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-getfolders
     */
    GetFolders(flags) {
        result := ComCall(10, this, "int", flags, "ptr*", &ppFolders := 0, "HRESULT")
        return ITaskFolderCollection(ppFolders)
    }

    /**
     * 
     * @param {BSTR} subFolderName 
     * @param {VARIANT} sddl 
     * @returns {ITaskFolder} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-createfolder
     */
    CreateFolder(subFolderName, sddl) {
        subFolderName := subFolderName is String ? BSTR.Alloc(subFolderName).Value : subFolderName

        result := ComCall(11, this, "ptr", subFolderName, "ptr", sddl, "ptr*", &ppFolder := 0, "HRESULT")
        return ITaskFolder(ppFolder)
    }

    /**
     * 
     * @param {BSTR} subFolderName 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-deletefolder
     */
    DeleteFolder(subFolderName, flags) {
        subFolderName := subFolderName is String ? BSTR.Alloc(subFolderName).Value : subFolderName

        result := ComCall(12, this, "ptr", subFolderName, "int", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {IRegisteredTask} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-gettask
     */
    GetTask(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(13, this, "ptr", path, "ptr*", &ppTask := 0, "HRESULT")
        return IRegisteredTask(ppTask)
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {IRegisteredTaskCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-gettasks
     */
    GetTasks(flags) {
        result := ComCall(14, this, "int", flags, "ptr*", &ppTasks := 0, "HRESULT")
        return IRegisteredTaskCollection(ppTasks)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-deletetask
     */
    DeleteTask(name, flags) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(15, this, "ptr", name, "int", flags, "HRESULT")
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
     * @returns {IRegisteredTask} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-registertask
     */
    RegisterTask(path, xmlText, flags, userId, password, logonType, sddl) {
        path := path is String ? BSTR.Alloc(path).Value : path
        xmlText := xmlText is String ? BSTR.Alloc(xmlText).Value : xmlText

        result := ComCall(16, this, "ptr", path, "ptr", xmlText, "int", flags, "ptr", userId, "ptr", password, "int", logonType, "ptr", sddl, "ptr*", &ppTask := 0, "HRESULT")
        return IRegisteredTask(ppTask)
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {ITaskDefinition} pDefinition 
     * @param {Integer} flags 
     * @param {VARIANT} userId 
     * @param {VARIANT} password 
     * @param {Integer} logonType 
     * @param {VARIANT} sddl 
     * @returns {IRegisteredTask} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition
     */
    RegisterTaskDefinition(path, pDefinition, flags, userId, password, logonType, sddl) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(17, this, "ptr", path, "ptr", pDefinition, "int", flags, "ptr", userId, "ptr", password, "int", logonType, "ptr", sddl, "ptr*", &ppTask := 0, "HRESULT")
        return IRegisteredTask(ppTask)
    }

    /**
     * 
     * @param {Integer} securityInformation 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-getsecuritydescriptor
     */
    GetSecurityDescriptor(securityInformation) {
        pSddl := BSTR()
        result := ComCall(18, this, "int", securityInformation, "ptr", pSddl, "HRESULT")
        return pSddl
    }

    /**
     * 
     * @param {BSTR} sddl 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfolder-setsecuritydescriptor
     */
    SetSecurityDescriptor(sddl, flags) {
        sddl := sddl is String ? BSTR.Alloc(sddl).Value : sddl

        result := ComCall(19, this, "ptr", sddl, "int", flags, "HRESULT")
        return result
    }
}
