#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskSourceRequestedArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Arguments associated with the [PrintTaskSourceRequestedHandler](printtasksourcerequestedhandler.md) delegate. Provides a method for handing the content to be printed to the PrintTask.
 * @remarks
 * PrintTaskSourceRequestedArgs is used to set the source of the content to be printed. Here is a code snippet from the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing) that shows the [SetSource](printtasksourcerequestedargs_setsource_1925283600.md) method:
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
 *         // Call PrintTaskSourceRequestedArgs.SetSource
 *         sourceRequested.SetSource(printDocumentSource);
 *     });
 * }
 * ```
 * 
 * For more information on this and other printing scenarios, see [Printing](/windows/uwp/devices-sensors/print-from-your-app) and the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtasksourcerequestedargs
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskSourceRequestedArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskSourceRequestedArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskSourceRequestedArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the **DateTime** object that indicates the deadline for a print task source request.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtasksourcerequestedargs.deadline
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
        if (!this.HasProp("__IPrintTaskSourceRequestedArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskSourceRequestedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskSourceRequestedArgs := IPrintTaskSourceRequestedArgs(outPtr)
        }

        return this.__IPrintTaskSourceRequestedArgs.get_Deadline()
    }

    /**
     * Informs the print task of the content to be printed.
     * @remarks
     * Content source information for the print task can come from either HTML (via [MSApp.GetHtmlPrintDocumentSource](/previous-versions/hh772325(v=vs.85))) or from XAML (via the XAML [PrintDocument.DocumentSource](/uwp/api/windows.ui.xaml.printing.printdocument.documentsource)). Or you can create your own method to provide content source information to the print task.
     * @param {IPrintDocumentSource} source A pointer to the **IPrintDocumentSource** interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtasksourcerequestedargs.setsource
     */
    SetSource(source) {
        if (!this.HasProp("__IPrintTaskSourceRequestedArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskSourceRequestedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskSourceRequestedArgs := IPrintTaskSourceRequestedArgs(outPtr)
        }

        return this.__IPrintTaskSourceRequestedArgs.SetSource(source)
    }

    /**
     * Gets a [PrintTaskSourceRequestedDeferral](printtasksourcerequesteddeferral.md) object that provides access to a [Complete](printtasksourcerequesteddeferral_complete_1807836922.md) method. This method indicates then the deferral is over.
     * @returns {PrintTaskSourceRequestedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtasksourcerequestedargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintTaskSourceRequestedArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskSourceRequestedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskSourceRequestedArgs := IPrintTaskSourceRequestedArgs(outPtr)
        }

        return this.__IPrintTaskSourceRequestedArgs.GetDeferral()
    }

;@endregion Instance Methods
}
