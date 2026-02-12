#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmAction.ahk

/**
 * Used to run a command or script in response to a quota, file screen, or file management job event.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nn-fsrm-ifsrmactioncommand
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmActionCommand extends IFsrmAction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmActionCommand
     * @type {Guid}
     */
    static IID => Guid("{12937789-e247-4917-9c20-f3ee9c7ee783}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExecutablePath", "put_ExecutablePath", "get_Arguments", "put_Arguments", "get_Account", "put_Account", "get_WorkingDirectory", "put_WorkingDirectory", "get_MonitorCommand", "put_MonitorCommand", "get_KillTimeOut", "put_KillTimeOut", "get_LogResult", "put_LogResult"]

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
     * @type {Integer} 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-get_executablepath
     */
    get_ExecutablePath() {
        executablePath := BSTR()
        result := ComCall(12, this, "ptr", executablePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-put_executablepath
     */
    put_ExecutablePath(executablePath) {
        if(executablePath is String) {
            pin := BSTR.Alloc(executablePath)
            executablePath := pin.Value
        }

        result := ComCall(13, this, "ptr", executablePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the arguments to pass to the executable program specified in the ExecutablePath property. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-get_arguments
     */
    get_Arguments() {
        arguments := BSTR()
        result := ComCall(14, this, "ptr", arguments, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return arguments
    }

    /**
     * Retrieves or sets the arguments to pass to the executable program specified in the ExecutablePath property. (Put)
     * @param {BSTR} arguments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-put_arguments
     */
    put_Arguments(arguments) {
        if(arguments is String) {
            pin := BSTR.Alloc(arguments)
            arguments := pin.Value
        }

        result := ComCall(15, this, "ptr", arguments, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the system account that is used to run the executable program specified in the ExecutablePath property. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-get_account
     */
    get_Account() {
        result := ComCall(16, this, "int*", &account := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return account
    }

    /**
     * Retrieves or sets the system account that is used to run the executable program specified in the ExecutablePath property. (Put)
     * @param {Integer} account 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-put_account
     */
    put_Account(account) {
        result := ComCall(17, this, "int", account, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-get_workingdirectory
     */
    get_WorkingDirectory() {
        workingDirectory := BSTR()
        result := ComCall(18, this, "ptr", workingDirectory, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-put_workingdirectory
     */
    put_WorkingDirectory(workingDirectory) {
        if(workingDirectory is String) {
            pin := BSTR.Alloc(workingDirectory)
            workingDirectory := pin.Value
        }

        result := ComCall(19, this, "ptr", workingDirectory, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM will monitor the executable program specified in the ExecutablePath property. (Get)
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_killtimeout">KillTimeOut</a> and 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_logresult">LogResult</a> properties are ignored if this 
     *     property is not set to <b>VARIANT_TRUE</b>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand
     */
    get_MonitorCommand() {
        result := ComCall(20, this, "short*", &monitorCommand := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-put_monitorcommand
     */
    put_MonitorCommand(monitorCommand) {
        result := ComCall(21, this, "short", monitorCommand, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the number of minutes the server waits before terminating the process that is running the executable program specified in the ExecutablePath property. (Get)
     * @remarks
     * For FSRM to terminate the process, the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand">IFsrmActionCommand::MonitorCommand</a> 
     *     property must be set to <b>VARIANT_TRUE</b>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-get_killtimeout
     */
    get_KillTimeOut() {
        result := ComCall(22, this, "int*", &minutes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-put_killtimeout
     */
    put_KillTimeOut(minutes) {
        result := ComCall(23, this, "int", minutes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets a value that determines whether FSRM logs an Application event that contains the return code of the executable program. (Get)
     * @remarks
     * For FSRM to log an event, the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand">IFsrmActionCommand::MonitorCommand</a> 
     *     property must be set to <b>VARIANT_TRUE</b>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-get_logresult
     */
    get_LogResult() {
        result := ComCall(24, this, "short*", &logResults := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrm/nf-fsrm-ifsrmactioncommand-put_logresult
     */
    put_LogResult(logResults) {
        result := ComCall(25, this, "short", logResults, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
