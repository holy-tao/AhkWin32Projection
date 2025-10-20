#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICommand.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandText extends ICommand{
    /**
     * The interface identifier for ICommandText
     * @type {Guid}
     */
    static IID => Guid("{0c733a27-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<Guid>} pguidDialect 
     * @param {Pointer<PWSTR>} ppwszCommand 
     * @returns {HRESULT} 
     */
    GetCommandText(pguidDialect, ppwszCommand) {
        result := ComCall(6, this, "ptr", pguidDialect, "ptr", ppwszCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidDialect 
     * @param {PWSTR} pwszCommand 
     * @returns {HRESULT} 
     */
    SetCommandText(rguidDialect, pwszCommand) {
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        result := ComCall(7, this, "ptr", rguidDialect, "ptr", pwszCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
