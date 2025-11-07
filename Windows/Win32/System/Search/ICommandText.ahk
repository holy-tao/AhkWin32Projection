#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICommand.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandText extends ICommand{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCommandText", "SetCommandText"]

    /**
     * 
     * @param {Pointer<Guid>} pguidDialect 
     * @returns {PWSTR} 
     */
    GetCommandText(pguidDialect) {
        result := ComCall(6, this, "ptr", pguidDialect, "ptr*", &ppwszCommand := 0, "HRESULT")
        return ppwszCommand
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidDialect 
     * @param {PWSTR} pwszCommand 
     * @returns {HRESULT} 
     */
    SetCommandText(rguidDialect, pwszCommand) {
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        result := ComCall(7, this, "ptr", rguidDialect, "ptr", pwszCommand, "HRESULT")
        return result
    }
}
