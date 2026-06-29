#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmAction.ahk" { IFsrmAction }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FsrmAccountType.ahk" { FsrmAccountType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Used to run a command or script in response to a quota, file screen, or file management job event.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmactioncommand
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmActionCommand extends IFsrmAction {
    /**
     * The interface identifier for IFsrmActionCommand
     * @type {Guid}
     */
    static IID := Guid("{12937789-e247-4917-9c20-f3ee9c7ee783}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmActionCommand interfaces
    */
    struct Vtbl extends IFsrmAction.Vtbl {
        get_ExecutablePath   : IntPtr
        put_ExecutablePath   : IntPtr
        get_Arguments        : IntPtr
        put_Arguments        : IntPtr
        get_Account          : IntPtr
        put_Account          : IntPtr
        get_WorkingDirectory : IntPtr
        put_WorkingDirectory : IntPtr
        get_MonitorCommand   : IntPtr
        put_MonitorCommand   : IntPtr
        get_KillTimeOut      : IntPtr
        put_KillTimeOut      : IntPtr
        get_LogResult        : IntPtr
        put_LogResult        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmActionCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ExecutablePath {
        get => this.get_ExecutablePath()
        set => this.put_ExecutablePath(value)
    }

    /**
     * @type {BSTR} 
     */
    Arguments {
        get => this.get_Arguments()
        set => this.put_Arguments(value)
    }

    /**
     * @type {FsrmAccountType} 
     */
    Account {
        get => this.get_Account()
        set => this.put_Account(value)
    }

    /**
     * @type {BSTR} 
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MonitorCommand {
        get => this.get_MonitorCommand()
        set => this.put_MonitorCommand(value)
    }

    /**
     * @type {Integer} 
     */
    KillTimeOut {
        get => this.get_KillTimeOut()
        set => this.put_KillTimeOut(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LogResult {
        get => this.get_LogResult()
        set => this.put_LogResult(value)
    }

    /**
     * Retrieves or sets the full path to the executable program or script to run. (Get)
     * @remarks
     * The path must exist at the time you set the property and when the command executes. If the path does not exist 
     *     when the command executes, FSRM writes an event to the Application log.
     * 
     * To execute the command, the user that configured the action must exist in the Administrators group at the time 
     *     the command is executed.
     * 
     * Only administrators can have write access to all folders in the path at the time you set the property and when 
     *     the command executes. If others have write access when the command executes, FSRM does not execute the command and 
     *     writes an event to the Application log.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_executablepath
     */
    get_ExecutablePath() {
        executablePath := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, executablePath, "HRESULT")
        return executablePath
    }

    /**
     * Retrieves or sets the full path to the executable program or script to run. (Put)
     * @remarks
     * The path must exist at the time you set the property and when the command executes. If the path does not exist 
     *     when the command executes, FSRM writes an event to the Application log.
     * 
     * To execute the command, the user that configured the action must exist in the Administrators group at the time 
     *     the command is executed.
     * 
     * Only administrators can have write access to all folders in the path at the time you set the property and when 
     *     the command executes. If others have write access when the command executes, FSRM does not execute the command and 
     *     writes an event to the Application log.
     * @param {BSTR} executablePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_executablepath
     */
    put_ExecutablePath(executablePath) {
        executablePath := executablePath is String ? BSTR.Alloc(executablePath).Value : executablePath

        result := ComCall(13, this, BSTR, executablePath, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the arguments to pass to the executable program specified in the ExecutablePath property. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_arguments
     */
    get_Arguments() {
        arguments := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, arguments, "HRESULT")
        return arguments
    }

    /**
     * Retrieves or sets the arguments to pass to the executable program specified in the ExecutablePath property. (Put)
     * @param {BSTR} arguments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_arguments
     */
    put_Arguments(arguments) {
        arguments := arguments is String ? BSTR.Alloc(arguments).Value : arguments

        result := ComCall(15, this, BSTR, arguments, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the system account that is used to run the executable program specified in the ExecutablePath property. (Get)
     * @returns {FsrmAccountType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_account
     */
    get_Account() {
        result := ComCall(16, this, "int*", &account := 0, "HRESULT")
        return account
    }

    /**
     * Retrieves or sets the system account that is used to run the executable program specified in the ExecutablePath property. (Put)
     * @param {FsrmAccountType} account 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_account
     */
    put_Account(account) {
        result := ComCall(17, this, FsrmAccountType, account, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the working directory in which the executable program will run. (Get)
     * @remarks
     * The path can contain environment variables.
     * 
     * The path must exist when you set the property or the command executes. If the path does not exist when the 
     *     command executes, FSRM writes an event to the Application log.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_workingdirectory
     */
    get_WorkingDirectory() {
        workingDirectory := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, workingDirectory, "HRESULT")
        return workingDirectory
    }

    /**
     * Retrieves or sets the working directory in which the executable program will run. (Put)
     * @remarks
     * The path can contain environment variables.
     * 
     * The path must exist when you set the property or the command executes. If the path does not exist when the 
     *     command executes, FSRM writes an event to the Application log.
     * @param {BSTR} workingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_workingdirectory
     */
    put_WorkingDirectory(workingDirectory) {
        workingDirectory := workingDirectory is String ? BSTR.Alloc(workingDirectory).Value : workingDirectory

        result := ComCall(19, this, BSTR, workingDirectory, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM will monitor the executable program specified in the ExecutablePath property. (Get)
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_killtimeout">KillTimeOut</a> and 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_logresult">LogResult</a> properties are ignored if this 
     *     property is not set to <b>VARIANT_TRUE</b>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand
     */
    get_MonitorCommand() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &monitorCommand := 0, "HRESULT")
        return monitorCommand
    }

    /**
     * Retrieves or sets a value that determines whether FSRM will monitor the executable program specified in the ExecutablePath property. (Put)
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_killtimeout">KillTimeOut</a> and 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_logresult">LogResult</a> properties are ignored if this 
     *     property is not set to <b>VARIANT_TRUE</b>.
     * @param {VARIANT_BOOL} monitorCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_monitorcommand
     */
    put_MonitorCommand(monitorCommand) {
        result := ComCall(21, this, VARIANT_BOOL, monitorCommand, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the number of minutes the server waits before terminating the process that is running the executable program specified in the ExecutablePath property. (Get)
     * @remarks
     * For FSRM to terminate the process, the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand">IFsrmActionCommand::MonitorCommand</a> 
     *     property must be set to <b>VARIANT_TRUE</b>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_killtimeout
     */
    get_KillTimeOut() {
        result := ComCall(22, this, "int*", &minutes := 0, "HRESULT")
        return minutes
    }

    /**
     * Retrieves or sets the number of minutes the server waits before terminating the process that is running the executable program specified in the ExecutablePath property. (Put)
     * @remarks
     * For FSRM to terminate the process, the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand">IFsrmActionCommand::MonitorCommand</a> 
     *     property must be set to <b>VARIANT_TRUE</b>.
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_killtimeout
     */
    put_KillTimeOut(minutes) {
        result := ComCall(23, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM logs an Application event that contains the return code of the executable program. (Get)
     * @remarks
     * For FSRM to log an event, the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand">IFsrmActionCommand::MonitorCommand</a> 
     *     property must be set to <b>VARIANT_TRUE</b>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_logresult
     */
    get_LogResult() {
        result := ComCall(24, this, VARIANT_BOOL.Ptr, &logResults := 0, "HRESULT")
        return logResults
    }

    /**
     * Retrieves or sets a value that determines whether FSRM logs an Application event that contains the return code of the executable program. (Put)
     * @remarks
     * For FSRM to log an event, the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand">IFsrmActionCommand::MonitorCommand</a> 
     *     property must be set to <b>VARIANT_TRUE</b>.
     * @param {VARIANT_BOOL} logResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_logresult
     */
    put_LogResult(logResults) {
        result := ComCall(25, this, VARIANT_BOOL, logResults, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmActionCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ExecutablePath := CallbackCreate(GetMethod(implObj, "get_ExecutablePath"), flags, 2)
        this.vtbl.put_ExecutablePath := CallbackCreate(GetMethod(implObj, "put_ExecutablePath"), flags, 2)
        this.vtbl.get_Arguments := CallbackCreate(GetMethod(implObj, "get_Arguments"), flags, 2)
        this.vtbl.put_Arguments := CallbackCreate(GetMethod(implObj, "put_Arguments"), flags, 2)
        this.vtbl.get_Account := CallbackCreate(GetMethod(implObj, "get_Account"), flags, 2)
        this.vtbl.put_Account := CallbackCreate(GetMethod(implObj, "put_Account"), flags, 2)
        this.vtbl.get_WorkingDirectory := CallbackCreate(GetMethod(implObj, "get_WorkingDirectory"), flags, 2)
        this.vtbl.put_WorkingDirectory := CallbackCreate(GetMethod(implObj, "put_WorkingDirectory"), flags, 2)
        this.vtbl.get_MonitorCommand := CallbackCreate(GetMethod(implObj, "get_MonitorCommand"), flags, 2)
        this.vtbl.put_MonitorCommand := CallbackCreate(GetMethod(implObj, "put_MonitorCommand"), flags, 2)
        this.vtbl.get_KillTimeOut := CallbackCreate(GetMethod(implObj, "get_KillTimeOut"), flags, 2)
        this.vtbl.put_KillTimeOut := CallbackCreate(GetMethod(implObj, "put_KillTimeOut"), flags, 2)
        this.vtbl.get_LogResult := CallbackCreate(GetMethod(implObj, "get_LogResult"), flags, 2)
        this.vtbl.put_LogResult := CallbackCreate(GetMethod(implObj, "put_LogResult"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ExecutablePath)
        CallbackFree(this.vtbl.put_ExecutablePath)
        CallbackFree(this.vtbl.get_Arguments)
        CallbackFree(this.vtbl.put_Arguments)
        CallbackFree(this.vtbl.get_Account)
        CallbackFree(this.vtbl.put_Account)
        CallbackFree(this.vtbl.get_WorkingDirectory)
        CallbackFree(this.vtbl.put_WorkingDirectory)
        CallbackFree(this.vtbl.get_MonitorCommand)
        CallbackFree(this.vtbl.put_MonitorCommand)
        CallbackFree(this.vtbl.get_KillTimeOut)
        CallbackFree(this.vtbl.put_KillTimeOut)
        CallbackFree(this.vtbl.get_LogResult)
        CallbackFree(this.vtbl.put_LogResult)
    }
}
