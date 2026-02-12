#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskConfigurationSaveRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Called to notify the device app that the print task configuration must be saved.
 * @remarks
 * When the print dialog for your UWP app raises the [PrintTaskConfiguration.SaveRequested](printtaskconfiguration_saverequested.md) event, it references an instance of the **PrintTaskConfigurationSaveRequestedEventArgs** class. The Microsoft Store device app retrieves the information that it needs from this class to update the print ticket.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequestedeventargs
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class PrintTaskConfigurationSaveRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskConfigurationSaveRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskConfigurationSaveRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the information that is required for updating the print task configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequestedeventargs.request
     * @type {PrintTaskConfigurationSaveRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintTaskConfigurationSaveRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IPrintTaskConfigurationSaveRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfigurationSaveRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfigurationSaveRequestedEventArgs := IPrintTaskConfigurationSaveRequestedEventArgs(outPtr)
        }

        return this.__IPrintTaskConfigurationSaveRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
