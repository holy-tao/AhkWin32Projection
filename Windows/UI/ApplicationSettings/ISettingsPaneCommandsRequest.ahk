#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\SettingsCommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class ISettingsPaneCommandsRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsPaneCommandsRequest
     * @type {Guid}
     */
    static IID => Guid("{44df23ae-5d6e-4068-a168-f47643182114}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ApplicationCommands"]

    /**
     * @type {IVector<SettingsCommand>} 
     */
    ApplicationCommands {
        get => this.get_ApplicationCommands()
    }

    /**
     * 
     * @returns {IVector<SettingsCommand>} 
     */
    get_ApplicationCommands() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SettingsCommand, value)
    }
}
