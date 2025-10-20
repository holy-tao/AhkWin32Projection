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
     * 
     * @param {Pointer<BSTR>} executablePath 
     * @returns {HRESULT} 
     */
    get_ExecutablePath(executablePath) {
        result := ComCall(12, this, "ptr", executablePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} executablePath 
     * @returns {HRESULT} 
     */
    put_ExecutablePath(executablePath) {
        executablePath := executablePath is String ? BSTR.Alloc(executablePath).Value : executablePath

        result := ComCall(13, this, "ptr", executablePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} arguments 
     * @returns {HRESULT} 
     */
    get_Arguments(arguments) {
        result := ComCall(14, this, "ptr", arguments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} arguments 
     * @returns {HRESULT} 
     */
    put_Arguments(arguments) {
        arguments := arguments is String ? BSTR.Alloc(arguments).Value : arguments

        result := ComCall(15, this, "ptr", arguments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} account 
     * @returns {HRESULT} 
     */
    get_Account(account) {
        result := ComCall(16, this, "int*", account, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} account 
     * @returns {HRESULT} 
     */
    put_Account(account) {
        result := ComCall(17, this, "int", account, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} workingDirectory 
     * @returns {HRESULT} 
     */
    get_WorkingDirectory(workingDirectory) {
        result := ComCall(18, this, "ptr", workingDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} workingDirectory 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(workingDirectory) {
        workingDirectory := workingDirectory is String ? BSTR.Alloc(workingDirectory).Value : workingDirectory

        result := ComCall(19, this, "ptr", workingDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} monitorCommand 
     * @returns {HRESULT} 
     */
    get_MonitorCommand(monitorCommand) {
        result := ComCall(20, this, "ptr", monitorCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} monitorCommand 
     * @returns {HRESULT} 
     */
    put_MonitorCommand(monitorCommand) {
        result := ComCall(21, this, "short", monitorCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} minutes 
     * @returns {HRESULT} 
     */
    get_KillTimeOut(minutes) {
        result := ComCall(22, this, "int*", minutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     */
    put_KillTimeOut(minutes) {
        result := ComCall(23, this, "int", minutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} logResults 
     * @returns {HRESULT} 
     */
    get_LogResult(logResults) {
        result := ComCall(24, this, "ptr", logResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} logResults 
     * @returns {HRESULT} 
     */
    put_LogResult(logResults) {
        result := ComCall(25, this, "short", logResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
