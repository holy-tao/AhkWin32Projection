#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskConfiguration.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintTaskConfiguration.ahk
#Include .\PrintTaskConfigurationSaveRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Allows a client to retrieve the print task extension context, and also to add an event handler to the print task.
 * @remarks
 * When a UWP app is invoked from **More settings** in the print window, the activation event provides an event argument of type [Windows.UI.WebUI.WebUIPrintTaskSettingsActivatedEventArgs](../windows.ui.webui/webuiprinttasksettingsactivatedeventargs.md) that exposes a property, [Configuration](../windows.ui.webui/webuiprinttasksettingsactivatedeventargs_configuration.md), for controlling the printer. This property provides an object of type **PrintTaskConfiguration** that provides access to the print task extension context, and also allows you to add an event handler to update the print ticket.
 * 
 * The following JavaScript code snippet demonstrates how to access the **PrintTaskConfiguration** object, and then use that to access the [PrinterExtensionContext](printtaskconfiguration_printerextensioncontext.md) property.
 * 
 * 
 * 
 * 
 * 
 * ```javascript
 * var configuration;
 * var printerExtesionContext;
 *  
 * function displayPrintSettings() {
 * 
 *     if (!configuration) {
 *         sdkSample.displayError("Configuration argument is null");
 *         return;
 *     }
 * 
 *     printerExtesionContext = configuration.printerExtensionContext;
 *     printHelper = new Microsoft.Samples.Printing.WwaDca.
 *         PrintHelperClass(printerExtensionContext);    
 * 
 *     var feature = "PageOrientation";
 * 
 *     // if printer's capabilities include this feature.
 *     if (!printHelper.featureExists(feature)) {
 *         continue;
 *     }
 * 
 *     // Get the selected option for this feature in the current
 *     // context's print ticket.
 *     var selectedOption = printHelper.getSelectedOptionIndex(feature);
 * 
 *     // Get the array of options in the current context’s print ticket
 *     var optionIndex = printHelper.getOptionInfo(feature, "Index"),
 *     var optionNames = printHelper.getOptionInfo(feature, 
 *         "DisplayName"),
 * 
 *     var selectedName;
 *     for (var i = 0; i < optionIndex.length; i++) {
 *         if (optionIndex[i] === selectedOption)
 *            selectedName = optionNames[i];
 * 
 *     // logic to display the orientation string here
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfiguration
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class PrintTaskConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the context for the print task extension.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printtaskconfiguration.printerextensioncontext
     * @type {IInspectable} 
     */
    PrinterExtensionContext {
        get => this.get_PrinterExtensionContext()
    }

    /**
     * Raised by the print window for your app to notify the device app that the print ticket must be updated.
     * @type {TypedEventHandler<PrintTaskConfiguration, PrintTaskConfigurationSaveRequestedEventArgs>}
    */
    OnSaveRequested {
        get {
            if(!this.HasProp("__OnSaveRequested")){
                this.__OnSaveRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0363f57a-b7a2-5e20-a156-253423e7ee40}"),
                    PrintTaskConfiguration,
                    PrintTaskConfigurationSaveRequestedEventArgs
                )
                this.__OnSaveRequestedToken := this.add_SaveRequested(this.__OnSaveRequested.iface)
            }
            return this.__OnSaveRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSaveRequestedToken")) {
            this.remove_SaveRequested(this.__OnSaveRequestedToken)
            this.__OnSaveRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_PrinterExtensionContext() {
        if (!this.HasProp("__IPrintTaskConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfiguration := IPrintTaskConfiguration(outPtr)
        }

        return this.__IPrintTaskConfiguration.get_PrinterExtensionContext()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTaskConfiguration, PrintTaskConfigurationSaveRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SaveRequested(eventHandler) {
        if (!this.HasProp("__IPrintTaskConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfiguration := IPrintTaskConfiguration(outPtr)
        }

        return this.__IPrintTaskConfiguration.add_SaveRequested(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_SaveRequested(eventCookie) {
        if (!this.HasProp("__IPrintTaskConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintTaskConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskConfiguration := IPrintTaskConfiguration(outPtr)
        }

        return this.__IPrintTaskConfiguration.remove_SaveRequested(eventCookie)
    }

;@endregion Instance Methods
}
