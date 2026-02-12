#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\WebAccountProviderCommand.ahk
#Include .\WebAccountCommand.ahk
#Include .\CredentialCommand.ahk
#Include .\SettingsCommand.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AccountsSettingsPaneEventDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IAccountsSettingsPaneCommandsRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccountsSettingsPaneCommandsRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3b68c099-db19-45d0-9abf-95d3773c9330}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccountProviderCommands", "get_WebAccountCommands", "get_CredentialCommands", "get_Commands", "get_HeaderText", "put_HeaderText", "GetDeferral"]

    /**
     * @type {IVector<WebAccountProviderCommand>} 
     */
    WebAccountProviderCommands {
        get => this.get_WebAccountProviderCommands()
    }

    /**
     * @type {IVector<WebAccountCommand>} 
     */
    WebAccountCommands {
        get => this.get_WebAccountCommands()
    }

    /**
     * @type {IVector<CredentialCommand>} 
     */
    CredentialCommands {
        get => this.get_CredentialCommands()
    }

    /**
     * @type {IVector<SettingsCommand>} 
     */
    Commands {
        get => this.get_Commands()
    }

    /**
     * @type {HSTRING} 
     */
    HeaderText {
        get => this.get_HeaderText()
        set => this.put_HeaderText(value)
    }

    /**
     * 
     * @returns {IVector<WebAccountProviderCommand>} 
     */
    get_WebAccountProviderCommands() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(WebAccountProviderCommand, value)
    }

    /**
     * 
     * @returns {IVector<WebAccountCommand>} 
     */
    get_WebAccountCommands() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(WebAccountCommand, value)
    }

    /**
     * 
     * @returns {IVector<CredentialCommand>} 
     */
    get_CredentialCommands() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(CredentialCommand, value)
    }

    /**
     * 
     * @returns {IVector<SettingsCommand>} 
     */
    get_Commands() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SettingsCommand, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderText() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HeaderText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AccountsSettingsPaneEventDeferral} 
     */
    GetDeferral() {
        result := ComCall(12, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AccountsSettingsPaneEventDeferral(deferral_)
    }
}
