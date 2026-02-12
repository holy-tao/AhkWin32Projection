#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportExtensionSession.ahk
#Include .\IPrintSupportExtensionSession2.ahk
#Include .\IPrintSupportExtensionSession3.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintSupportExtensionSession.ahk
#Include .\PrintSupportPrintTicketValidationRequestedEventArgs.ahk
#Include .\PrintSupportPrintDeviceCapabilitiesChangedEventArgs.ahk
#Include .\PrintSupportPrinterSelectedEventArgs.ahk
#Include .\PrintSupportCommunicationErrorDetectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a session of a print support extension.
 * @remarks
 * To a create print support extension, your app must declare a [uap4:Extension](/uwp/schemas/appxpackage/uapmanifestschema/element-uap4-extension) element with the category **windows.printSupportSettings** in its package manifest that specifies the entry point of a background task. When the background task is activated, the [IBackgroundTask.Run](/uwp/api/windows.applicationmodel.background.ibackgroundtask.run) method receives an [IBackgroundTaskInstance](/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance) object. You can cast the [TriggerDetails](windows.applicationmodel.background.ibackgroundtaskinstance.triggerdetails) property of this object to a [PrintSupportExtensionTriggerDetails](printsupportextensiontriggerdetails.md) object to get more details about the print support extension session.
 * 
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportExtensionSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportExtensionSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportExtensionSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the printer device for the current session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession.printer
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

    /**
     * Raised when the system needs to validate a print ticket.
     * @remarks
     * This event can be raised any time during a print job. After your code validates the print ticket, call [SetPrintTicketValidationStatus](printsupportprintticketvalidationrequestedeventargs_setprintticketvalidationstatus_920893354.md) to indicate whether the print ticket has been resolved, has conflicts, or is invalid.
     * @type {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrintTicketValidationRequestedEventArgs>}
    */
    OnPrintTicketValidationRequested {
        get {
            if(!this.HasProp("__OnPrintTicketValidationRequested")){
                this.__OnPrintTicketValidationRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ad13135a-1c8f-5ebd-a426-eb7434639d11}"),
                    PrintSupportExtensionSession,
                    PrintSupportPrintTicketValidationRequestedEventArgs
                )
                this.__OnPrintTicketValidationRequestedToken := this.add_PrintTicketValidationRequested(this.__OnPrintTicketValidationRequested.iface)
            }
            return this.__OnPrintTicketValidationRequested
        }
    }

    /**
     * Raised when the system updates the cached print capabilities of the associated Internet Printing Protocol (IPP) printer.
     * @remarks
     * The [PrintSupportPrintDeviceCapabilitiesChangedEventArgs](printsupportprintdevicecapabilitieschangedeventargs.md) provides the current print capabilities and provides a method you can use to update the capabilities.
     * @type {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrintDeviceCapabilitiesChangedEventArgs>}
    */
    OnPrintDeviceCapabilitiesChanged {
        get {
            if(!this.HasProp("__OnPrintDeviceCapabilitiesChanged")){
                this.__OnPrintDeviceCapabilitiesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f9203731-8ec4-5001-a5b7-b67fee4ca00b}"),
                    PrintSupportExtensionSession,
                    PrintSupportPrintDeviceCapabilitiesChangedEventArgs
                )
                this.__OnPrintDeviceCapabilitiesChangedToken := this.add_PrintDeviceCapabilitiesChanged(this.__OnPrintDeviceCapabilitiesChanged.iface)
            }
            return this.__OnPrintDeviceCapabilitiesChanged
        }
    }

    /**
     * Raised when the selected printer in the printer dialog is changed to the printer associated with printer support app.
     * @type {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrinterSelectedEventArgs>}
    */
    OnPrinterSelected {
        get {
            if(!this.HasProp("__OnPrinterSelected")){
                this.__OnPrinterSelected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0cff2f5c-9b0d-56d5-afe8-c213f2b3793d}"),
                    PrintSupportExtensionSession,
                    PrintSupportPrinterSelectedEventArgs
                )
                this.__OnPrinterSelectedToken := this.add_PrinterSelected(this.__OnPrinterSelected.iface)
            }
            return this.__OnPrinterSelected
        }
    }

    /**
     * Raised when a printer communication error is detected.
     * @type {TypedEventHandler<PrintSupportExtensionSession, PrintSupportCommunicationErrorDetectedEventArgs>}
    */
    OnCommunicationErrorDetected {
        get {
            if(!this.HasProp("__OnCommunicationErrorDetected")){
                this.__OnCommunicationErrorDetected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cee7c5ea-81e8-54a0-93c6-9f926e1eeb3d}"),
                    PrintSupportExtensionSession,
                    PrintSupportCommunicationErrorDetectedEventArgs
                )
                this.__OnCommunicationErrorDetectedToken := this.add_CommunicationErrorDetected(this.__OnCommunicationErrorDetected.iface)
            }
            return this.__OnCommunicationErrorDetected
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPrintTicketValidationRequestedToken")) {
            this.remove_PrintTicketValidationRequested(this.__OnPrintTicketValidationRequestedToken)
            this.__OnPrintTicketValidationRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPrintDeviceCapabilitiesChangedToken")) {
            this.remove_PrintDeviceCapabilitiesChanged(this.__OnPrintDeviceCapabilitiesChangedToken)
            this.__OnPrintDeviceCapabilitiesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPrinterSelectedToken")) {
            this.remove_PrinterSelected(this.__OnPrinterSelectedToken)
            this.__OnPrinterSelected.iface.Dispose()
        }

        if(this.HasProp("__OnCommunicationErrorDetectedToken")) {
            this.remove_CommunicationErrorDetected(this.__OnCommunicationErrorDetectedToken)
            this.__OnCommunicationErrorDetected.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        if (!this.HasProp("__IPrintSupportExtensionSession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession := IPrintSupportExtensionSession(outPtr)
        }

        return this.__IPrintSupportExtensionSession.get_Printer()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrintTicketValidationRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintTicketValidationRequested(handler) {
        if (!this.HasProp("__IPrintSupportExtensionSession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession := IPrintSupportExtensionSession(outPtr)
        }

        return this.__IPrintSupportExtensionSession.add_PrintTicketValidationRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrintTicketValidationRequested(token) {
        if (!this.HasProp("__IPrintSupportExtensionSession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession := IPrintSupportExtensionSession(outPtr)
        }

        return this.__IPrintSupportExtensionSession.remove_PrintTicketValidationRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrintDeviceCapabilitiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintDeviceCapabilitiesChanged(handler) {
        if (!this.HasProp("__IPrintSupportExtensionSession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession := IPrintSupportExtensionSession(outPtr)
        }

        return this.__IPrintSupportExtensionSession.add_PrintDeviceCapabilitiesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrintDeviceCapabilitiesChanged(token) {
        if (!this.HasProp("__IPrintSupportExtensionSession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession := IPrintSupportExtensionSession(outPtr)
        }

        return this.__IPrintSupportExtensionSession.remove_PrintDeviceCapabilitiesChanged(token)
    }

    /**
     * Starts the print support service so it can begin raising events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession.start
     */
    Start() {
        if (!this.HasProp("__IPrintSupportExtensionSession")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession := IPrintSupportExtensionSession(outPtr)
        }

        return this.__IPrintSupportExtensionSession.Start()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrinterSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrinterSelected(handler) {
        if (!this.HasProp("__IPrintSupportExtensionSession2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession2 := IPrintSupportExtensionSession2(outPtr)
        }

        return this.__IPrintSupportExtensionSession2.add_PrinterSelected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrinterSelected(token) {
        if (!this.HasProp("__IPrintSupportExtensionSession2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession2 := IPrintSupportExtensionSession2(outPtr)
        }

        return this.__IPrintSupportExtensionSession2.remove_PrinterSelected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintSupportExtensionSession, PrintSupportCommunicationErrorDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CommunicationErrorDetected(handler) {
        if (!this.HasProp("__IPrintSupportExtensionSession3")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession3 := IPrintSupportExtensionSession3(outPtr)
        }

        return this.__IPrintSupportExtensionSession3.add_CommunicationErrorDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CommunicationErrorDetected(token) {
        if (!this.HasProp("__IPrintSupportExtensionSession3")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionSession3 := IPrintSupportExtensionSession3(outPtr)
        }

        return this.__IPrintSupportExtensionSession3.remove_CommunicationErrorDetected(token)
    }

;@endregion Instance Methods
}
