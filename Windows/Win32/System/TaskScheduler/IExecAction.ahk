#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAction.ahk

/**
 * Represents an action that executes a command-line operation.
 * @remarks
 * 
 * This action performs a command-line operation. For example, the action could run a script or launch an executable.
 * 
 * When reading or writing XML, an execution action is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-exec-actiongroup-element">Exec</a> element of the Task Scheduler schema.
 * 
 * If environment variables are used in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_path">Path</a>, <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_arguments">Arguments</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_workingdirectory">WorkingDirectory</a> properties, then the values of the environment variables are cached and used when the Taskeng.exe (the task engine) is launched. Changes to the environment variables that occur after the task engine is launched will not be used by the task engine.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iexecaction
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IExecAction extends IAction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExecAction
     * @type {Guid}
     */
    static IID => Guid("{4c3d624d-fd6b-49a3-b9b7-09cb3cd3f047}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "put_Path", "get_Arguments", "put_Arguments", "get_WorkingDirectory", "put_WorkingDirectory"]

    /**
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     */
    Arguments {
        get => this.get_Arguments()
        set => this.put_Arguments(value)
    }

    /**
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-get_path
     */
    get_Path(pPath) {
        result := ComCall(10, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-put_path
     */
    put_Path(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(11, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pArgument 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-get_arguments
     */
    get_Arguments(pArgument) {
        result := ComCall(12, this, "ptr", pArgument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} argument 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-put_arguments
     */
    put_Arguments(argument) {
        argument := argument is String ? BSTR.Alloc(argument).Value : argument

        result := ComCall(13, this, "ptr", argument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pWorkingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-get_workingdirectory
     */
    get_WorkingDirectory(pWorkingDirectory) {
        result := ComCall(14, this, "ptr", pWorkingDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} workingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-put_workingdirectory
     */
    put_WorkingDirectory(workingDirectory) {
        workingDirectory := workingDirectory is String ? BSTR.Alloc(workingDirectory).Value : workingDirectory

        result := ComCall(15, this, "ptr", workingDirectory, "HRESULT")
        return result
    }
}
