#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportAppInfo.ahk
#Include .\IPrintSupportAppInfoStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportAppInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportAppInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportAppInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} printerName 
     * @param {WorkflowPrintTicket} printTicket 
     * @returns {IReference<Boolean>} 
     */
    static GetPrintJobShowsUI(printerName, printTicket) {
        if (!PrintSupportAppInfo.HasProp("__IPrintSupportAppInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintSupport.PrintSupportAppInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintSupportAppInfoStatics.IID)
            PrintSupportAppInfo.__IPrintSupportAppInfoStatics := IPrintSupportAppInfoStatics(factoryPtr)
        }

        return PrintSupportAppInfo.__IPrintSupportAppInfoStatics.GetPrintJobShowsUI(printerName, printTicket)
    }

    /**
     * 
     * @param {HSTRING} printerName 
     * @returns {PrintSupportAppInfo} 
     */
    static FromPrinterName(printerName) {
        if (!PrintSupportAppInfo.HasProp("__IPrintSupportAppInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintSupport.PrintSupportAppInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintSupportAppInfoStatics.IID)
            PrintSupportAppInfo.__IPrintSupportAppInfoStatics := IPrintSupportAppInfoStatics(factoryPtr)
        }

        return PrintSupportAppInfo.__IPrintSupportAppInfoStatics.FromPrinterName(printerName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {AppInfo} 
     */
    AppInfo {
        get => this.get_AppInfo()
    }

    /**
     * @type {Integer} 
     */
    SupportedContracts {
        get => this.get_SupportedContracts()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_AppInfo() {
        if (!this.HasProp("__IPrintSupportAppInfo")) {
            if ((queryResult := this.QueryInterface(IPrintSupportAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportAppInfo := IPrintSupportAppInfo(outPtr)
        }

        return this.__IPrintSupportAppInfo.get_AppInfo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedContracts() {
        if (!this.HasProp("__IPrintSupportAppInfo")) {
            if ((queryResult := this.QueryInterface(IPrintSupportAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportAppInfo := IPrintSupportAppInfo(outPtr)
        }

        return this.__IPrintSupportAppInfo.get_SupportedContracts()
    }

;@endregion Instance Methods
}
