#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskOptionChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Called when a print task option has changed.
 * @remarks
 * Here is a code snippet that shows how to retrieve the object, when a print task option has changed. First, the app must register to listen for option changes. Once the option is changed, a callback is made to the event listener.
 * 
 * ```csharp
 * 
 * //  Retrieve the advanced Print Task Options.
 * PrintTaskOptionDetails printDetailedOptions = PrintTaskOptionDetails.GetFromPrintTaskOptions(printTask.Options);
 * 
 * // Create a new list option.
 * PrintCustomItemListOptionDetails margins = printDetailedOptions.CreateItemListOption("Margins", "Margins");
 * margins.AddItem("WideMargins", "Wide", "Each margin is 20% of the paper size", await wideMarginsIconTask);
 * margins.AddItem("ModerateMargins", "Moderate", "Each margin is 10% of the paper size", await moderateMarginsIconTask);
 * margins.AddItem("NarrowMargins", "Narrow", "Each margin is 5% of the paper size", await narrowMarginsIconTask);
 * 
 * // Add the custom option to the option list
 * printDetailedOptions.DisplayedOptions.Add("Margins");
 * 
 * printDetailedOptions.OptionChanged += printDetailedOptions_OptionChanged;
 * ```
 * 
 * ```csharp
 * async void printDetailedOptions_OptionChanged(PrintTaskOptionDetails sender, PrintTaskOptionChangedEventArgs args)
 * {
 *     string optionId = args.OptionId as string;
 *     if (string.IsNullOrEmpty(optionId))
 *     {
 *         return;
 *     }
 * 
 *     if (optionId == "Margins")
 *     {
 *         PrintCustomItemListOptionDetails marginsOption = (PrintCustomItemListOptionDetails)sender.Options["Margins"];
 *         string marginsValue = marginsOption.Value.ToString();
 * 
 *         switch (marginsValue)
 *         {
 *             case "WideMargins":
 *                 ApplicationContentMarginTop = 0.2;
 *                 ApplicationContentMarginLeft = 0.2; 
 *                 break;
 *             case "ModerateMargins":
 *                 ApplicationContentMarginTop = 0.1;
 *                 ApplicationContentMarginLeft = 0.1;
 *                 break;
 *             case "NarrowMargins":
 *                 ApplicationContentMarginTop = 0.05;
 *                 ApplicationContentMarginLeft = 0.05;
 *                 break;
 *         }
 *     }
 * }
 * ```
 * 
 * To see the complete listing for this, and other printing scenarios using **PrintTask**, see [Printing](/windows/uwp/devices-sensors/print-from-your-app) and the [UWP print sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/Printing).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptionchangedeventargs
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintTaskOptionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskOptionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskOptionChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the print task option that changed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptionchangedeventargs.optionid
     * @type {IInspectable} 
     */
    OptionId {
        get => this.get_OptionId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_OptionId() {
        if (!this.HasProp("__IPrintTaskOptionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionChangedEventArgs := IPrintTaskOptionChangedEventArgs(outPtr)
        }

        return this.__IPrintTaskOptionChangedEventArgs.get_OptionId()
    }

;@endregion Instance Methods
}
