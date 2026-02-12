#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTask.ahk
#Include .\IPrintTaskTargetDeviceSupport.ahk
#Include .\IPrintTask2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintTask.ahk
#Include .\PrintTaskProgressingEventArgs.ahk
#Include .\PrintTaskCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a printing operation including the content to be printed, as well as providing access to information describing how the content is to be printed.
 * @remarks
 * The **PrintTask** object represents a printing operation for UWP apps. The app is responsible for creating a **PrintTask** that is requested via the [PrintTaskRequested](printmanager_printtaskrequested.md) event on the [PrintManager](printmanager.md) object. To create **PrintTask** you must provide the name for the task and a [PrintTaskSourceRequestedHandler](printtasksourcerequestedhandler.md) delegate which is called when the user is ready to begin printing.
 * 
 * If the user decides not to print the task, the task may be completed without ever requesting the document source.
 * 
 * **PrintTask** contains a reference, in the form of the [Source](printtask_source.md) property, to the Print Document Source provided by the app. This object must support the [IPrintDocumentSource](iprintdocumentsource.md) interface.
 * 
 * In addition **PrintTask** contains an [Options](printtask_options.md) property which holds a reference to the [PrintTaskOptions](printtaskoptions.md) object. The **PrintTaskOptions** object provides access to details about the desired format of the printed content. **PrintTaskOptions** also provides methods which allow aspects of the print user experience to be modified. For example, **PrintTaskOptions** allows the app to define which of the supported options appear on the initial page of the print experience.
 * 
 * A print task goes through a specific set of states after its creation, and these changes in state can be used by an app to provide feedback to the user. Most of the state transitions are represented in the events that are raised by **PrintTask**. The print task is created in response to the **PrintTaskRequested** event on the **PrintManager** using the [CreatePrintTask](printtaskrequest_createprinttask_356827780.md) method on the **PrintTaskRequest** object. At this point the print task cannot be printed, since the content to print has not yet been provided. Typically a **PrintTaskRequested** event is raised when the user clicks on the Devices charm or an application initiates printing via the [ShowPrintUIAsync](printmanager_showprintuiasync_1397448831.md) method on the **PrintManager**.
 * 
 * Once the system determines that the task will be printed, the **PrintTaskSourceRequestedHandler** delegate is called to actually retrieve a reference to the Document Source object. At this point **PrintTask** is fully initialized. If the user decides not to complete the printing represented by the **PrintTask** object, the completion event is raised with a completion type of *abandoned*.
 * 
 * Upon initialization the printing user experience is responsible for helping the user select the different attributes, such as paper size or duplex, for the printed content. When the print window initialization is almost complete, **PrintTask** raises the *Previewing* event. This is when the user is now able to manipulate the contents of the **PrintTaskOptions** object via the print window. The user may change the values of the settings at any time during the Preview stage, and this must be taken into consideration the next time an app paginates the content. The **PrintTaskOptions** object provides basic functionality for retrieving the values of the print settings. For more advanced control of the print options, see [PrintTaskOptionDetails](../windows.graphics.printing.optiondetails/printtaskoptiondetails.md). Again the user may cancel this operation which will result in a completion event being raised with a completion type of *cancelled*.
 * 
 * When the user chooses to actually initiate printing by pressing Print in the print window, for example, the print task transitions from *Previewing* to the *Submitting* state, and the *Submitting* event is raised. The print document source is then passed a MakeDocument command and the process of submitting pages to the print subsystem begins. While pages are being submitted, the *Progressing* event is raised. An app may choose to use the information in the progressing event to let the user know how much content remains to be printed. Once the process of submitting the document to the print subsystem is complete, **PrintTask** raises the *Completion* event. This event indicates whether the job was submitted successfully, canceled, or failed during the submission process.
 * 
 * Here is a code snippet from the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing) that shows how to indicate the order in which the default print settings should be displayed:
 * 
 * ```csharp
 * protected override void PrintTaskRequested(PrintManager sender, PrintTaskRequestedEventArgs e)
 * {
 *     PrintTask printTask = null;
 *     printTask = e.Request.CreatePrintTask("C# Printing SDK Sample", sourceRequestedArgs =>
 *     {
 *         IList<string> displayedOptions = printTask.Options.DisplayedOptions;
 * 
 *         // Choose the printer options to be shown.
 *         // The order in which the options are appended determines the order in which they appear in the UI
 *         displayedOptions.Clear();
 *         displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Copies);
 *         displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Orientation);
 *         displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.MediaSize);
 *         displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Collation);
 *         displayedOptions.Add(Windows.Graphics.Printing.StandardPrintTaskOptions.Duplex);
 * 
 *         // Preset the default value of the printer option
 *         printTask.Options.MediaSize = PrintMediaSize.NorthAmericaLegal;
 * 
 *         // Print Task event handler is invoked when the print job is completed.
 *         printTask.Completed += async (s, args) =>
 *         {
 *             // Notify the user when the print operation fails.
 *             if (args.Completion == PrintTaskCompletion.Failed)
 *             {
 *                 await scenarioPage.Dispatcher.RunAsync(Windows.UI.Core.CoreDispatcherPriority.Normal, () =>
 *                 {
 *                     MainPage.Current.NotifyUser("Failed to print.", NotifyType.ErrorMessage);
 *                 });
 *             }
 *         };
 * 
 *         sourceRequestedArgs.SetSource(printDocumentSource);
 *     });
 * }
 * ```
 * 
 * To see the complete listing for this, and other printing scenarios using **PrintTask**, see [Printing](/windows/uwp/devices-sensors/print-from-your-app) and the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtask
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTask extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTask

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTask.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves a set of properties associated with the [PrintTask](printtask.md).
     * @remarks
     * As an example, the title of the print task that was provided when the print task was created is available as a property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtask.properties
     * @type {DataPackagePropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Returns a pointer to the app-provided object that represents the content to be printed. This object must support the [IPrintDocumentSource](iprintdocumentsource.md) interface.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtask.source
     * @type {IPrintDocumentSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Retrieves the [PrintTaskOptions](printtaskoptions.md) for the print task that defines how the content is to be formatted for printing.
     * @remarks
     * An app can use [PrintTaskOptions](printtaskoptions.md), for example, to determine the size of media on which the content is to be printed. **PrintTaskOptions** may also be used to customize the selection of options that are visible by default for the printing user experience.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtask.options
     * @type {PrintTaskOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * Gets or sets a value indicating whether the [PrintTask](printtask.md) supports printer targets.
     * @remarks
     * This property works together with [Is3DManufacturingTargetEnabled](printtask_is3dmanufacturingtargetenabled.md) to determine which devices are enumerated when the user extends the print charm. When IsPrinterTargetEnabled is **true**, the print charm displays conventional printing devices, like 2D printers. When [Is3DManufacturingTargetEnabled](printtask_is3dmanufacturingtargetenabled.md) is **true**, the print charm displays 3D devices like 3D printers. When both IsPrinterTargetEnabled and [Is3DManufacturingTargetEnabled](printtask_is3dmanufacturingtargetenabled.md) are **true**, the print charm displays both 2D printers and 3D printers.
     * 
     * By default, IsPrinterTargetEnabled is **true** and [Is3DManufacturingTargetEnabled](printtask_is3dmanufacturingtargetenabled.md) is **false**.
     * 
     * UWP apps that support 2D printing in Windows 8 are not required to make a change in Windows 8.1 to add this property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtask.isprintertargetenabled
     * @type {Boolean} 
     */
    IsPrinterTargetEnabled {
        get => this.get_IsPrinterTargetEnabled()
        set => this.put_IsPrinterTargetEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the [PrintTask](printtask.md) supports 3D manufacturing devices, like a 3D printer.
     * @remarks
     * This property works together with [IsPrinterTargetEnabled](printtask_isprintertargetenabled.md) to determine which devices are enumerated when the user extends the print charm. When [IsPrinterTargetEnabled](printtask_isprintertargetenabled.md) is **true**, the print charm displays conventional printing devices, like 2D printers. When Is3DManufacturingTargetEnabled is **true**, the print charm displays 3D devices like 3D printers. When both [IsPrinterTargetEnabled](printtask_isprintertargetenabled.md) and Is3DManufacturingTargetEnabled are **true**, the print charm displays both 2D printers and 3D printers.
     * 
     * By default, [IsPrinterTargetEnabled](printtask_isprintertargetenabled.md) is **true** and Is3DManufacturingTargetEnabled is **false**.
     * 
     * 
     * 
     * > [!NOTE]
     * > UWP apps that support 3D printing in Windows 8.1 must set [IsPrinterTargetEnabled](printtask_isprintertargetenabled.md) to **false** and Is3DManufacturingTargetEnabled to **true** in order to enumerate only 3D printers in the print charm.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtask.is3dmanufacturingtargetenabled
     * @type {Boolean} 
     */
    Is3DManufacturingTargetEnabled {
        get => this.get_Is3DManufacturingTargetEnabled()
        set => this.put_Is3DManufacturingTargetEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the [PrintTask](printtask.md) will show a print preview.
     * @remarks
     * In some situations, displaying the print preview will take too much time and disrupt the user experience of a Universal Windows app. For this reason, the developer may wish to disable the print preview feature in favor of a smoother control flow.
     * 
     * By default, **isPreviewEnabled** is **true**. UWP apps that are meant to print in the background must set **isPreviewEnabled** to **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtask.ispreviewenabled
     * @type {Boolean} 
     */
    IsPreviewEnabled {
        get => this.get_IsPreviewEnabled()
        set => this.put_IsPreviewEnabled(value)
    }

    /**
     * Raised when the print system initializes print preview mode.
     * @type {TypedEventHandler<PrintTask, IInspectable>}
    */
    OnPreviewing {
        get {
            if(!this.HasProp("__OnPreviewing")){
                this.__OnPreviewing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4cc141d4-c0d9-5220-b1ce-80fff3bd2d44}"),
                    PrintTask,
                    IInspectable
                )
                this.__OnPreviewingToken := this.add_Previewing(this.__OnPreviewing.iface)
            }
            return this.__OnPreviewing
        }
    }

    /**
     * Raised when a print task begins submitting content to the print subsystem to be printed.
     * @type {TypedEventHandler<PrintTask, IInspectable>}
    */
    OnSubmitting {
        get {
            if(!this.HasProp("__OnSubmitting")){
                this.__OnSubmitting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4cc141d4-c0d9-5220-b1ce-80fff3bd2d44}"),
                    PrintTask,
                    IInspectable
                )
                this.__OnSubmittingToken := this.add_Submitting(this.__OnSubmitting.iface)
            }
            return this.__OnSubmitting
        }
    }

    /**
     * Raised to provide progress information about how much of the printed content has been submitted to the print subsystem for printing.
     * @type {TypedEventHandler<PrintTask, PrintTaskProgressingEventArgs>}
    */
    OnProgressing {
        get {
            if(!this.HasProp("__OnProgressing")){
                this.__OnProgressing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c08d0524-5899-536c-8f46-55fdaa4cf78b}"),
                    PrintTask,
                    PrintTaskProgressingEventArgs
                )
                this.__OnProgressingToken := this.add_Progressing(this.__OnProgressing.iface)
            }
            return this.__OnProgressing
        }
    }

    /**
     * Raised when the print task is completed.
     * @type {TypedEventHandler<PrintTask, PrintTaskCompletedEventArgs>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b0b02549-b9ad-5226-898a-7b563b46640c}"),
                    PrintTask,
                    PrintTaskCompletedEventArgs
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPreviewingToken")) {
            this.remove_Previewing(this.__OnPreviewingToken)
            this.__OnPreviewing.iface.Dispose()
        }

        if(this.HasProp("__OnSubmittingToken")) {
            this.remove_Submitting(this.__OnSubmittingToken)
            this.__OnSubmitting.iface.Dispose()
        }

        if(this.HasProp("__OnProgressingToken")) {
            this.remove_Progressing(this.__OnProgressingToken)
            this.__OnProgressing.iface.Dispose()
        }

        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {DataPackagePropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.get_Properties()
    }

    /**
     * 
     * @returns {IPrintDocumentSource} 
     */
    get_Source() {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.get_Source()
    }

    /**
     * 
     * @returns {PrintTaskOptions} 
     */
    get_Options() {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.get_Options()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Previewing(eventHandler) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.add_Previewing(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Previewing(eventCookie) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.remove_Previewing(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Submitting(eventHandler) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.add_Submitting(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Submitting(eventCookie) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.remove_Submitting(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, PrintTaskProgressingEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Progressing(eventHandler) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.add_Progressing(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Progressing(eventCookie) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.remove_Progressing(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, PrintTaskCompletedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(eventHandler) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.add_Completed(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Completed(eventCookie) {
        if (!this.HasProp("__IPrintTask")) {
            if ((queryResult := this.QueryInterface(IPrintTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask := IPrintTask(outPtr)
        }

        return this.__IPrintTask.remove_Completed(eventCookie)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPrinterTargetEnabled(value) {
        if (!this.HasProp("__IPrintTaskTargetDeviceSupport")) {
            if ((queryResult := this.QueryInterface(IPrintTaskTargetDeviceSupport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskTargetDeviceSupport := IPrintTaskTargetDeviceSupport(outPtr)
        }

        return this.__IPrintTaskTargetDeviceSupport.put_IsPrinterTargetEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrinterTargetEnabled() {
        if (!this.HasProp("__IPrintTaskTargetDeviceSupport")) {
            if ((queryResult := this.QueryInterface(IPrintTaskTargetDeviceSupport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskTargetDeviceSupport := IPrintTaskTargetDeviceSupport(outPtr)
        }

        return this.__IPrintTaskTargetDeviceSupport.get_IsPrinterTargetEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Is3DManufacturingTargetEnabled(value) {
        if (!this.HasProp("__IPrintTaskTargetDeviceSupport")) {
            if ((queryResult := this.QueryInterface(IPrintTaskTargetDeviceSupport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskTargetDeviceSupport := IPrintTaskTargetDeviceSupport(outPtr)
        }

        return this.__IPrintTaskTargetDeviceSupport.put_Is3DManufacturingTargetEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is3DManufacturingTargetEnabled() {
        if (!this.HasProp("__IPrintTaskTargetDeviceSupport")) {
            if ((queryResult := this.QueryInterface(IPrintTaskTargetDeviceSupport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskTargetDeviceSupport := IPrintTaskTargetDeviceSupport(outPtr)
        }

        return this.__IPrintTaskTargetDeviceSupport.get_Is3DManufacturingTargetEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPreviewEnabled(value) {
        if (!this.HasProp("__IPrintTask2")) {
            if ((queryResult := this.QueryInterface(IPrintTask2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask2 := IPrintTask2(outPtr)
        }

        return this.__IPrintTask2.put_IsPreviewEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPreviewEnabled() {
        if (!this.HasProp("__IPrintTask2")) {
            if ((queryResult := this.QueryInterface(IPrintTask2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTask2 := IPrintTask2(outPtr)
        }

        return this.__IPrintTask2.get_IsPreviewEnabled()
    }

;@endregion Instance Methods
}
