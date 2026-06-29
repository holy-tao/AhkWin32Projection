#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAction.ahk" { IAction }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents an action that executes a command-line operation.
 * @remarks
 * This action performs a command-line operation. For example, the action could run a script or launch an executable.
 * 
 * When reading or writing XML, an execution action is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-exec-actiongroup-element">Exec</a> element of the Task Scheduler schema.
 * 
 * If environment variables are used in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_path">Path</a>, <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_arguments">Arguments</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_workingdirectory">WorkingDirectory</a> properties, then the values of the environment variables are cached and used when the Taskeng.exe (the task engine) is launched. Changes to the environment variables that occur after the task engine is launched will not be used by the task engine.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iexecaction
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IExecAction extends IAction {
    /**
     * The interface identifier for IExecAction
     * @type {Guid}
     */
    static IID := Guid("{4c3d624d-fd6b-49a3-b9b7-09cb3cd3f047}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExecAction interfaces
    */
    struct Vtbl extends IAction.Vtbl {
        get_Path             : IntPtr
        put_Path             : IntPtr
        get_Arguments        : IntPtr
        put_Arguments        : IntPtr
        get_WorkingDirectory : IntPtr
        put_WorkingDirectory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExecAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {BSTR} 
     */
    Arguments {
        get => this.get_Arguments()
        set => this.put_Arguments(value)
    }

    /**
     * @type {BSTR} 
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

    /**
     * Gets or sets the path to an executable file. (Get)
     * @remarks
     * This action performs a command-line operation. For example, the action could run a script or launch an executable.
     * 
     * When reading or writing XML, the command-line operation path is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-command-exectype-element">Command</a> element of the Task Scheduler schema.
     * 
     * The path is checked to make sure it is valid when the task is registered, not when this property is set.
     * @param {Pointer<BSTR>} pPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-get_path
     */
    get_Path(pPath) {
        result := ComCall(10, this, BSTR.Ptr, pPath, "HRESULT")
        return result
    }

    /**
     * Gets or sets the path to an executable file. (Put)
     * @remarks
     * This action performs a command-line operation. For example, the action could run a script or launch an executable.
     * 
     * When reading or writing XML, the command-line operation path is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-command-exectype-element">Command</a> element of the Task Scheduler schema.
     * 
     * The path is checked to make sure it is valid when the task is registered, not when this property is set.
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-put_path
     */
    put_Path(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(11, this, BSTR, _path, "HRESULT")
        return result
    }

    /**
     * Gets or sets the arguments associated with the command-line operation. (Get)
     * @remarks
     * When reading or writing XML, the command-line operation arguments are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-arguments-exectype-element">Arguments</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pArgument 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-get_arguments
     */
    get_Arguments(pArgument) {
        result := ComCall(12, this, BSTR.Ptr, pArgument, "HRESULT")
        return result
    }

    /**
     * Gets or sets the arguments associated with the command-line operation. (Put)
     * @remarks
     * When reading or writing XML, the command-line operation arguments are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-arguments-exectype-element">Arguments</a> element of the Task Scheduler schema.
     * @param {BSTR} argument 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-put_arguments
     */
    put_Arguments(argument) {
        argument := argument is String ? BSTR.Alloc(argument).Value : argument

        result := ComCall(13, this, BSTR, argument, "HRESULT")
        return result
    }

    /**
     * Gets or sets the directory that contains either the executable file or the files that are used by the executable file. (Get)
     * @remarks
     * When reading or writing XML, the working directory of the application is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-workingdirectory-exectype-element">WorkingDirectory</a> element of the Task Scheduler schema.
     * 
     * The path is checked to make sure it is valid when the task is registered, not when this property is set.
     * @param {Pointer<BSTR>} pWorkingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-get_workingdirectory
     */
    get_WorkingDirectory(pWorkingDirectory) {
        result := ComCall(14, this, BSTR.Ptr, pWorkingDirectory, "HRESULT")
        return result
    }

    /**
     * Gets or sets the directory that contains either the executable file or the files that are used by the executable file. (Put)
     * @remarks
     * When reading or writing XML, the working directory of the application is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-workingdirectory-exectype-element">WorkingDirectory</a> element of the Task Scheduler schema.
     * 
     * The path is checked to make sure it is valid when the task is registered, not when this property is set.
     * @param {BSTR} workingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iexecaction-put_workingdirectory
     */
    put_WorkingDirectory(workingDirectory) {
        workingDirectory := workingDirectory is String ? BSTR.Alloc(workingDirectory).Value : workingDirectory

        result := ComCall(15, this, BSTR, workingDirectory, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExecAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.put_Path := CallbackCreate(GetMethod(implObj, "put_Path"), flags, 2)
        this.vtbl.get_Arguments := CallbackCreate(GetMethod(implObj, "get_Arguments"), flags, 2)
        this.vtbl.put_Arguments := CallbackCreate(GetMethod(implObj, "put_Arguments"), flags, 2)
        this.vtbl.get_WorkingDirectory := CallbackCreate(GetMethod(implObj, "get_WorkingDirectory"), flags, 2)
        this.vtbl.put_WorkingDirectory := CallbackCreate(GetMethod(implObj, "put_WorkingDirectory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.put_Path)
        CallbackFree(this.vtbl.get_Arguments)
        CallbackFree(this.vtbl.put_Arguments)
        CallbackFree(this.vtbl.get_WorkingDirectory)
        CallbackFree(this.vtbl.put_WorkingDirectory)
    }
}
