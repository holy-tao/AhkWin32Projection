#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmAction.ahk

/**
 * Used to run a command or script in response to a quota, file screen, or file management job event.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmactioncommand
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
     * 
     * @param {Pointer<BSTR>} executablePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_executablepath
     */
    get_ExecutablePath(executablePath) {
        result := ComCall(12, this, "ptr", executablePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} executablePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_executablepath
     */
    put_ExecutablePath(executablePath) {
        executablePath := executablePath is String ? BSTR.Alloc(executablePath).Value : executablePath

        result := ComCall(13, this, "ptr", executablePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} arguments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_arguments
     */
    get_Arguments(arguments) {
        result := ComCall(14, this, "ptr", arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} arguments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_arguments
     */
    put_Arguments(arguments) {
        arguments := arguments is String ? BSTR.Alloc(arguments).Value : arguments

        result := ComCall(15, this, "ptr", arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} account 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_account
     */
    get_Account(account) {
        result := ComCall(16, this, "int*", account, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} account 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_account
     */
    put_Account(account) {
        result := ComCall(17, this, "int", account, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} workingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_workingdirectory
     */
    get_WorkingDirectory(workingDirectory) {
        result := ComCall(18, this, "ptr", workingDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} workingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_workingdirectory
     */
    put_WorkingDirectory(workingDirectory) {
        workingDirectory := workingDirectory is String ? BSTR.Alloc(workingDirectory).Value : workingDirectory

        result := ComCall(19, this, "ptr", workingDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} monitorCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_monitorcommand
     */
    get_MonitorCommand(monitorCommand) {
        result := ComCall(20, this, "ptr", monitorCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} monitorCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_monitorcommand
     */
    put_MonitorCommand(monitorCommand) {
        result := ComCall(21, this, "short", monitorCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} minutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_killtimeout
     */
    get_KillTimeOut(minutes) {
        result := ComCall(22, this, "int*", minutes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_killtimeout
     */
    put_KillTimeOut(minutes) {
        result := ComCall(23, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} logResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-get_logresult
     */
    get_LogResult(logResults) {
        result := ComCall(24, this, "ptr", logResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} logResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactioncommand-put_logresult
     */
    put_LogResult(logResults) {
        result := ComCall(25, this, "short", logResults, "HRESULT")
        return result
    }
}
