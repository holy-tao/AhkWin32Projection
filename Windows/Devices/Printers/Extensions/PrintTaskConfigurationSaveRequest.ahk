#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskConfigurationSaveRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Called when the print dialog for your app raises a [SaveRequested](printtaskconfiguration_saverequested.md) event.
 * @remarks
 * The Microsoft Store device app uses a **PrintTaskConfigurationSaveRequest** object to further process the client's request to save the print task configuration.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequest
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class PrintTaskConfigurationSaveRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskConfigurationSaveRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskConfigurationSaveRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the date-time object that provides the deadline information for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequest.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Called by the device app to cancel the client's request to save the print task configuration.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequest.cancel
     */
    Cancel() {
        if (!this.HasProp("__IPrintTaskConfigurationSaveRequest")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfigurationSaveRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfigurationSaveRequest := IPrintTaskConfigurationSaveRequest(outPtr)
        }

        return this.__IPrintTaskConfigurationSaveRequest.Cancel()
    }

    /**
     * Called by the device app to save the print task configuration.
     * @param {IInspectable} printerExtensionContext The object that represents the print task extension context.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequest.save
     */
    Save(printerExtensionContext) {
        if (!this.HasProp("__IPrintTaskConfigurationSaveRequest")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfigurationSaveRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfigurationSaveRequest := IPrintTaskConfigurationSaveRequest(outPtr)
        }

        return this.__IPrintTaskConfigurationSaveRequest.Save(printerExtensionContext)
    }

    /**
     * Called by the device app when it has to complete some asynchronous tasks before it can save the print task configuration information.
     * @returns {PrintTaskConfigurationSaveRequestedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfigurationsaverequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintTaskConfigurationSaveRequest")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfigurationSaveRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfigurationSaveRequest := IPrintTaskConfigurationSaveRequest(outPtr)
        }

        return this.__IPrintTaskConfigurationSaveRequest.GetDeferral()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IPrintTaskConfigurationSaveRequest")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfigurationSaveRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfigurationSaveRequest := IPrintTaskConfigurationSaveRequest(outPtr)
        }

        return this.__IPrintTaskConfigurationSaveRequest.get_Deadline()
    }

;@endregion Instance Methods
}
