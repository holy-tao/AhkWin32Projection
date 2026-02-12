#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowPrinterJobStatusChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPrinterJobStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowPrinterJobStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowPrinterJobStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {PrintWorkflowPrinterJob} 
     */
    PrinterJob {
        get => this.get_PrinterJob()
    }

    /**
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowPrinterJob} 
     */
    get_PrinterJob() {
        if (!this.HasProp("__IPrintWorkflowPrinterJobStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJobStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJobStatusChangedEventArgs := IPrintWorkflowPrinterJobStatusChangedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPrinterJobStatusChangedEventArgs.get_PrinterJob()
    }

    /**
     * 
     * @returns {PrintWorkflowConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IPrintWorkflowPrinterJobStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJobStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJobStatusChangedEventArgs := IPrintWorkflowPrinterJobStatusChangedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPrinterJobStatusChangedEventArgs.get_Configuration()
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowPrinterJobStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJobStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJobStatusChangedEventArgs := IPrintWorkflowPrinterJobStatusChangedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPrinterJobStatusChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
