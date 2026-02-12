#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DWorkflowPrintRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data about the print request to the app that initiated the request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowprintrequestedeventargs
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class Print3DWorkflowPrintRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DWorkflowPrintRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DWorkflowPrintRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the print request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowprintrequestedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPrint3DWorkflowPrintRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflowPrintRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflowPrintRequestedEventArgs := IPrint3DWorkflowPrintRequestedEventArgs(outPtr)
        }

        return this.__IPrint3DWorkflowPrintRequestedEventArgs.get_Status()
    }

    /**
     * Sets the extended status of the print request.
     * @param {Integer} value The extended status of the print request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowprintrequestedeventargs.setextendedstatus
     */
    SetExtendedStatus(value) {
        if (!this.HasProp("__IPrint3DWorkflowPrintRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflowPrintRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflowPrintRequestedEventArgs := IPrint3DWorkflowPrintRequestedEventArgs(outPtr)
        }

        return this.__IPrint3DWorkflowPrintRequestedEventArgs.SetExtendedStatus(value)
    }

    /**
     * Sets the latest model data, including any updates made by the [Print3DWorkflow](print3dworkflow.md).
     * @param {IInspectable} source The latest model data, including any updates made by the [Print3DWorkflow](print3dworkflow.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowprintrequestedeventargs.setsource
     */
    SetSource(source) {
        if (!this.HasProp("__IPrint3DWorkflowPrintRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflowPrintRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflowPrintRequestedEventArgs := IPrint3DWorkflowPrintRequestedEventArgs(outPtr)
        }

        return this.__IPrint3DWorkflowPrintRequestedEventArgs.SetSource(source)
    }

    /**
     * Indicates if the data model has been updated by the [Print3DWorkflow](print3dworkflow.md).
     * @param {Boolean} value Returns **true** if the data model has been updated; otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowprintrequestedeventargs.setsourcechanged
     */
    SetSourceChanged(value) {
        if (!this.HasProp("__IPrint3DWorkflowPrintRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflowPrintRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflowPrintRequestedEventArgs := IPrint3DWorkflowPrintRequestedEventArgs(outPtr)
        }

        return this.__IPrint3DWorkflowPrintRequestedEventArgs.SetSourceChanged(value)
    }

;@endregion Instance Methods
}
