#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerDataReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the barcode data from the [DataReceived](claimedbarcodescanner_datareceived.md) event.
 * @remarks
 * This object is created by the [DataReceived](claimedbarcodescanner_datareceived.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerdatareceivedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerDataReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerDataReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerDataReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data from the [DataReceived](claimedbarcodescanner_datareceived.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerdatareceivedeventargs.report
     * @type {BarcodeScannerReport} 
     */
    Report {
        get => this.get_Report()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BarcodeScannerReport} 
     */
    get_Report() {
        if (!this.HasProp("__IBarcodeScannerDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerDataReceivedEventArgs := IBarcodeScannerDataReceivedEventArgs(outPtr)
        }

        return this.__IBarcodeScannerDataReceivedEventArgs.get_Report()
    }

;@endregion Instance Methods
}
