#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Printers\Extensions\PrintTaskConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information in response to the event that is raised when print task settings are activated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprinttasksettingsactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IPrintTaskSettingsActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskSettingsActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ee30a0c9-ce56-4865-ba8e-8954ac271107}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration"]

    /**
     * Gets the configuration information for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprinttasksettingsactivatedeventargs.configuration
     * @type {PrintTaskConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * 
     * @returns {PrintTaskConfiguration} 
     */
    get_Configuration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTaskConfiguration(value)
    }
}
