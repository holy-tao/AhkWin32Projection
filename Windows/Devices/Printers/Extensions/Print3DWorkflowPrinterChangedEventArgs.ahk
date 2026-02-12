#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DWorkflowPrinterChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data about the printer change to the app that initiated the change.
 * @remarks
 * This class is instantiated automatically when the [PrinterChanged](print3dworkflow_printerchanged.md) event is raised.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowprinterchangedeventargs
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class Print3DWorkflowPrinterChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DWorkflowPrinterChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DWorkflowPrinterChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device identifier of the new 3D printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowprinterchangedeventargs.newdeviceid
     * @type {HSTRING} 
     */
    NewDeviceId {
        get => this.get_NewDeviceId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NewDeviceId() {
        if (!this.HasProp("__IPrint3DWorkflowPrinterChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DWorkflowPrinterChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DWorkflowPrinterChangedEventArgs := IPrint3DWorkflowPrinterChangedEventArgs(outPtr)
        }

        return this.__IPrint3DWorkflowPrinterChangedEventArgs.get_NewDeviceId()
    }

;@endregion Instance Methods
}
