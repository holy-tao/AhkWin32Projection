#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintManager.ahk
#Include .\IPrintManagerStatic.ahk
#Include .\IPrintManagerStatic2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintManager.ahk
#Include .\PrintTaskRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides the entry-point for printing within an application.
 * @remarks
 * The PrintManager class is responsible for orchestrating the printing flow for UWP apps. To use this class, you must first call the [GetForCurrentView](printmanager_getforcurrentview_1363600702.md) method. This method returns the PrintManager object that is specific to the current active window. Next, you must add an event listener for the [PrintTaskRequested](printmanager_printtaskrequested.md) event. This event is raised when the application invokes the printing dialog via the **ShowPrintUIAsync** method.
 * 
 * When a UWP app registers its "intention" to print, it creates a print contract with the print manager. In the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing), registration is performed by the `RegisterForPrinting` method.
 * 
 * ```csharp
 * public virtual void RegisterForPrinting()
 * {
 *    printDocument = new PrintDocument();
 *    printDocumentSource = printDocument.DocumentSource;
 *    printDocument.Paginate += CreatePrintPreviewPages;
 *    printDocument.GetPreviewPage += GetPrintPreviewPage;
 *    printDocument.AddPages += AddPrintPages;
 * 
 *    PrintManager printMan = PrintManager.GetForCurrentView();
 *    printMan.PrintTaskRequested += PrintTaskRequested;
 * }
 * ```
 * 
 * For more examples involving the print manager and to see some sample code for printing scenarios in UWP apps, see [Printing](/windows/uwp/devices-sensors/print-from-your-app) and the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing)..
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printmanager
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the **PrintManager** object associated with the current window.
     * @returns {PrintManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printmanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!PrintManager.HasProp("__IPrintManagerStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintManagerStatic.IID)
            PrintManager.__IPrintManagerStatic := IPrintManagerStatic(factoryPtr)
        }

        return PrintManager.__IPrintManagerStatic.GetForCurrentView()
    }

    /**
     * Programmatically initiates the user interface for printing content.
     * @remarks
     * This method may be used by an application which has already used **GetForCurrentView** to retrieve the **PrintManager** instance and has registered a listener for the **PrintTaskRequested** event to initiate the printing user experience. **ShowPrintUIAsync** displays the appropriate printing window. If printing can't be performed at that time, the method will throw an exception. We recommend catching these exceptions and letting the user know when printing can't proceed, as shown here.
     * 
     * 
     * 
     * ```csharp
     * async private void printButton_Click(object sender, RoutedEventArgs e)
     * {
     *     try
     *     {
     *         // Show print UI
     *         await Windows.Graphics.Printing.PrintManager.ShowPrintUIAsync();
     * 
     *     }
     *     catch
     *     {
     *         // Printing cannot proceed at this time
     *         ContentDialog noPrintingDialog = new ContentDialog()
     *         {
     *             Title = "Printing error",
     *             Content = "\nSorry, printing can't proceed at this time.", PrimaryButtonText = "OK"
     *         };
     *         await noPrintingDialog.ShowAsync();
     *     }
     * }
     * ```
     * 
     * In this example, a print window is displayed in the event handler for a button click. If the method throws an exception (because printing can't be performed at that time), a [ContentDialog](../windows.ui.xaml.controls/contentdialog.md) control informs the user of the situation. For more info about printing from your app, see [Printing](/windows/uwp/devices-sensors/print-from-your-app).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printmanager.showprintuiasync
     */
    static ShowPrintUIAsync() {
        if (!PrintManager.HasProp("__IPrintManagerStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintManagerStatic.IID)
            PrintManager.__IPrintManagerStatic := IPrintManagerStatic(factoryPtr)
        }

        return PrintManager.__IPrintManagerStatic.ShowPrintUIAsync()
    }

    /**
     * Indicates whether or not the app is running on a device that supports printing.
     * @remarks
     * A Universal Windows app should use this method to determine whether to show or hide certain UI elements related to the printing task.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printmanager.issupported
     */
    static IsSupported() {
        if (!PrintManager.HasProp("__IPrintManagerStatic2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintManagerStatic2.IID)
            PrintManager.__IPrintManagerStatic2 := IPrintManagerStatic2(factoryPtr)
        }

        return PrintManager.__IPrintManagerStatic2.IsSupported()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPrintTaskRequestedToken")) {
            this.remove_PrintTaskRequested(this.__OnPrintTaskRequestedToken)
            this.__OnPrintTaskRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintManager, PrintTaskRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintTaskRequested(eventHandler) {
        if (!this.HasProp("__IPrintManager")) {
            if ((queryResult := this.QueryInterface(IPrintManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintManager := IPrintManager(outPtr)
        }

        return this.__IPrintManager.add_PrintTaskRequested(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PrintTaskRequested(eventCookie) {
        if (!this.HasProp("__IPrintManager")) {
            if ((queryResult := this.QueryInterface(IPrintManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintManager := IPrintManager(outPtr)
        }

        return this.__IPrintManager.remove_PrintTaskRequested(eventCookie)
    }

;@endregion Instance Methods
}
