#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintNotificationEventDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains properties that allow a client to access and/or manipulate print event data and print device name information.
 * @remarks
 * Background task handlers can use local storage to save the [PrinterName](printnotificationeventdetails_printername.md) and [EventData](printnotificationeventdetails_eventdata.md) values of the **PrintNotificationEventDetails** class, so that the information can be used later by an app.
 * 
 * 
 * 
 * 
 * 
 * ```javascript
 *     // Save the printer name and asyncUI xml
 *     //
 *     var keyPrinterName = "BA5857FA-DE2C-4A4A-BEF2-49D8B4130A39";
 *     var keyAsyncUIXML = "55DCA47A-BEE9-43EB-A7C8-92ECA2FA0685";
 *     var settings = Windows.Storage.ApplicationData.current.localSettings;
 * 
 *     //
 *     // The background task instance's activation parameters are available
 *     // via Windows.UI.WebUI.WebUIBackgroundTaskInstance.current
 *     //
 *     var backgroundTaskInstance = Windows.UI.WebUI.WebUIBackgroundTaskInstance.current;
 * 
 *     // Save data into a user-defined var, "settings" 
 *     var details = backgroundTaskInstance.triggerDetails;
 *     settings.values[keyPrinterName] = details.printerName;
 *     settings.values[keyAsyncUIXML] = details.eventData;
 * 
 *     // Save directly into PrintNotificationEventDetails
 *     Windows.Devices.Printers.Extensions.PrintNotificationEventDetails = details;
 * 
 * ```
 * 
 * For more information about using the **PrintNotificationEventDetails** class, see the [UWP device apps for printers](/windows-hardware/drivers/devapps/windows-store-device-apps-for-printers) topic on the Hardware Dev Center.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printnotificationeventdetails
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class PrintNotificationEventDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintNotificationEventDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintNotificationEventDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the print device associated with the print notification.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printnotificationeventdetails.printername
     * @type {HSTRING} 
     */
    PrinterName {
        get => this.get_PrinterName()
    }

    /**
     * Gets or sets the event data for a print notification event.
     * @remarks
     * The  property is nested XML that is formatted as string. To get this property, parse for the Bidi request and response schema that is embedded in an `<Envelope>`, following the AsyncUI's [balloonUI](/windows-hardware/drivers/print/balloonui) element message, which contains the [action](/windows-hardware/drivers/print/action) element. The [action](/windows-hardware/drivers/print/action) element contains the `<Envelope>` where the Bidi response schema is found. Examine the Bidi response to determine the cause of the event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printnotificationeventdetails.eventdata
     * @type {HSTRING} 
     */
    EventData {
        get => this.get_EventData()
        set => this.put_EventData(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrinterName() {
        if (!this.HasProp("__IPrintNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(IPrintNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintNotificationEventDetails := IPrintNotificationEventDetails(outPtr)
        }

        return this.__IPrintNotificationEventDetails.get_PrinterName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EventData() {
        if (!this.HasProp("__IPrintNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(IPrintNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintNotificationEventDetails := IPrintNotificationEventDetails(outPtr)
        }

        return this.__IPrintNotificationEventDetails.get_EventData()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EventData(value) {
        if (!this.HasProp("__IPrintNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(IPrintNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintNotificationEventDetails := IPrintNotificationEventDetails(outPtr)
        }

        return this.__IPrintNotificationEventDetails.put_EventData(value)
    }

;@endregion Instance Methods
}
