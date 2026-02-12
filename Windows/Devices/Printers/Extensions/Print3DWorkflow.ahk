#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DWorkflow.ahk
#Include .\IPrint3DWorkflow2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\Print3DWorkflow.ahk
#Include .\Print3DWorkflowPrintRequestedEventArgs.ahk
#Include .\Print3DWorkflowPrinterChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a customized printing experience for a 3D printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflow
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class Print3DWorkflow extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DWorkflow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DWorkflow.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device identifier of the 3D printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflow.deviceid
     * @type {HSTRING} 
     */
    DeviceID {
        get => this.get_DeviceID()
    }

    /**
     * Gets or sets a value that indicates the 3D object is ready for printing and no further user interaction is required.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflow.isprintready
     * @type {Boolean} 
     */
    IsPrintReady {
        get => this.get_IsPrintReady()
        set => this.put_IsPrintReady(value)
    }

    /**
     * Occurs when the user initiates printing.
     * @type {TypedEventHandler<Print3DWorkflow, Print3DWorkflowPrintRequestedEventArgs>}
    */
    OnPrintRequested {
        get {
            if(!this.HasProp("__OnPrintRequested")){
                this.__OnPrintRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5f4c6603-5512-59aa-8d96-b1389d8b5796}"),
                    Print3DWorkflow,
                    Print3DWorkflowPrintRequestedEventArgs
                )
                this.__OnPrintRequestedToken := this.add_PrintRequested(this.__OnPrintRequested.iface)
            }
            return this.__OnPrintRequested
        }
    }

    /**
     * Occurs when the user changes the designated 3D printer.
     * @type {TypedEventHandler<Print3DWorkflow, Print3DWorkflowPrinterChangedEventArgs>}
    */
    OnPrinterChanged {
        get {
            if(!this.HasProp("__OnPrinterChanged")){
                this.__OnPrinterChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b4b5ddc2-1a74-5905-9fc5-ddaae9a3ab93}"),
                    Print3DWorkflow,
                    Print3DWorkflowPrinterChangedEventArgs
                )
                this.__OnPrinterChangedToken := this.add_PrinterChanged(this.__OnPrinterChanged.iface)
            }
            return this.__OnPrinterChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPrintRequestedToken")) {
            this.remove_PrintRequested(this.__OnPrintRequestedToken)
            this.__OnPrintRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPrinterChangedToken")) {
            this.remove_PrinterChanged(this.__OnPrinterChangedToken)
            this.__OnPrinterChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceID() {
        if (!this.HasProp("__IPrint3DWorkflow")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow := IPrint3DWorkflow(outPtr)
        }

        return this.__IPrint3DWorkflow.get_DeviceID()
    }

    /**
     * Gets the model of the 3D object to be printed.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflow.getprintmodelpackage
     */
    GetPrintModelPackage() {
        if (!this.HasProp("__IPrint3DWorkflow")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow := IPrint3DWorkflow(outPtr)
        }

        return this.__IPrint3DWorkflow.GetPrintModelPackage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrintReady() {
        if (!this.HasProp("__IPrint3DWorkflow")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow := IPrint3DWorkflow(outPtr)
        }

        return this.__IPrint3DWorkflow.get_IsPrintReady()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPrintReady(value) {
        if (!this.HasProp("__IPrint3DWorkflow")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow := IPrint3DWorkflow(outPtr)
        }

        return this.__IPrint3DWorkflow.put_IsPrintReady(value)
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DWorkflow, Print3DWorkflowPrintRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintRequested(eventHandler) {
        if (!this.HasProp("__IPrint3DWorkflow")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow := IPrint3DWorkflow(outPtr)
        }

        return this.__IPrint3DWorkflow.add_PrintRequested(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PrintRequested(eventCookie) {
        if (!this.HasProp("__IPrint3DWorkflow")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow := IPrint3DWorkflow(outPtr)
        }

        return this.__IPrint3DWorkflow.remove_PrintRequested(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DWorkflow, Print3DWorkflowPrinterChangedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PrinterChanged(eventHandler) {
        if (!this.HasProp("__IPrint3DWorkflow2")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow2 := IPrint3DWorkflow2(outPtr)
        }

        return this.__IPrint3DWorkflow2.add_PrinterChanged(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PrinterChanged(eventCookie) {
        if (!this.HasProp("__IPrint3DWorkflow2")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflow2 := IPrint3DWorkflow2(outPtr)
        }

        return this.__IPrint3DWorkflow2.remove_PrinterChanged(eventCookie)
    }

;@endregion Instance Methods
}
