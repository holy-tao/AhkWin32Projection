#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the request from the system to create a print task. This object is available from the [PrintTaskRequestedEventArgs](printtaskrequestedeventargs.md) object passed to the [PrintTaskRequested](printmanager_printtaskrequested.md) event.
 * @remarks
 * The PrintTaskRequest class is used by an app to create a new [PrintTask](printtask.md) object. A [PrintTask](printtask.md) object is created in response to the [PrintTaskRequested](printmanager_printtaskrequested.md) event and it indicates to the system that the app has content to be printed. When creating a [PrintTask](printtask.md) object using the [CreatePrintTask](printtaskrequest_createprinttask_356827780.md) method, the app must provide a name for the [PrintTask](printtask.md) and a [PrintTaskSourceRequestedHandler](printtasksourcerequestedhandler.md) event handler which is called when the content to be printed is required.
 * 
 * An app should do the minimum amount of work possible in the [PrintTaskRequested](printmanager_printtaskrequested.md) event handler since only a short amount of time is provided for a response. Wherever possible, the app should simply create a [PrintTask](printtask.md) and delay any content initialization until the [PrintTaskSourceRequestedHandler](printtasksourcerequestedhandler.md) event handler is called.
 * 
 * If an app needs to perform an asynchronous operation during the [PrintTaskRequested](printmanager_printtaskrequested.md) handler it must retrieve and use a [PrintTaskRequestedDeferral](printtaskrequesteddeferral.md) object. Prior to the exit of the event handler, and typically before the asynchronous operation is started, the app must retrieve the **PrintTaskRequestedDeferral** object by calling the [GetDeferral](printtaskrequest_getdeferral_254836512.md) method of the PrintTaskRequest object. When the asynchronous operation completes, the app must call the [Complete](printtaskrequesteddeferral_complete_1807836922.md) method of the [PrintTaskRequestedDeferral](printtaskrequesteddeferral.md) object to signal that the print task request is complete. The call to the **Complete** method must occur before the [Deadline](printtaskrequest_deadline.md) is reached in order for the request to be accepted.
 * 
 * The **CreatePrintTask** method in **PrintTaskRequest** can be used to create the print task. Here is a code snippet from the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing) that shows the creation of a print task:
 * 
 * ```csharp
 * protected virtual void PrintTaskRequested(PrintManager sender, PrintTaskRequestedEventArgs e)
 * {
 *     PrintTask printTask = null;
 *     printTask = e.Request.CreatePrintTask("C# Printing SDK Sample", sourceRequested =>
 *     {
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
 *         sourceRequested.SetSource(printDocumentSource);
 *     });
 * }
 * ```
 * 
 * For more information on this and other printing scenarios, see [Printing](/windows/uwp/devices-sensors/print-from-your-app) and the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequest
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [DateTime](../windows.foundation/datetime.md) value that indicates how long an app has to respond to the [PrintTaskRequested](printmanager_printtaskrequested.md) event. If the system has not received a response from the [PrintTaskRequested](printmanager_printtaskrequested.md) event handler by the time the deadline is reached, then the print task is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequest.deadline
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
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IPrintTaskRequest")) {
            if ((queryResult := this.QueryInterface(IPrintTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskRequest := IPrintTaskRequest(outPtr)
        }

        return this.__IPrintTaskRequest.get_Deadline()
    }

    /**
     * Creates a new [PrintTask](printtask.md) which indicates that the app has content to be printed.
     * @param {HSTRING} title Title for the print task.
     * @param {PrintTaskSourceRequestedHandler} handler Pointer to a **PrintTaskSourceRequestedHandler** delegate for the print task.
     * @returns {PrintTask} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequest.createprinttask
     */
    CreatePrintTask(title, handler) {
        if (!this.HasProp("__IPrintTaskRequest")) {
            if ((queryResult := this.QueryInterface(IPrintTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskRequest := IPrintTaskRequest(outPtr)
        }

        return this.__IPrintTaskRequest.CreatePrintTask(title, handler)
    }

    /**
     * Retrieves the deferral object associated with the [PrintTaskRequest](printtaskrequest.md). The deferral object is used to handle asynchronous calls in the [PrintTaskRequested](printmanager_printtaskrequested.md) event handler.
     * @returns {PrintTaskRequestedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintTaskRequest")) {
            if ((queryResult := this.QueryInterface(IPrintTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskRequest := IPrintTaskRequest(outPtr)
        }

        return this.__IPrintTaskRequest.GetDeferral()
    }

;@endregion Instance Methods
}
