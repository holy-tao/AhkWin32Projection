#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SettingsCommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class ISettingsCommandFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsCommandFactory
     * @type {Guid}
     */
    static IID => Guid("{68e15b33-1c83-433a-aa5a-ceeea5bd4764}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSettingsCommand"]

    /**
     * 
     * @param {IInspectable} settingsCommandId 
     * @param {HSTRING} label 
     * @param {UICommandInvokedHandler} handler 
     * @returns {SettingsCommand} 
     */
    CreateSettingsCommand(settingsCommandId, label, handler) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(6, this, "ptr", settingsCommandId, "ptr", label, "ptr", handler, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SettingsCommand(instance)
    }
}
