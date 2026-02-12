#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SettingsCommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class ISettingsCommandStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsCommandStatics
     * @type {Guid}
     */
    static IID => Guid("{749ae954-2f69-4b17-8aba-d05ce5778e46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccountsCommand"]

    /**
     * @type {SettingsCommand} 
     */
    AccountsCommand {
        get => this.get_AccountsCommand()
    }

    /**
     * 
     * @returns {SettingsCommand} 
     */
    get_AccountsCommand() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SettingsCommand(value)
    }
}
