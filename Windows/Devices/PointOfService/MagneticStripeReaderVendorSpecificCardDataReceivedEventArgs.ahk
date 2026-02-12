#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the recently swiped vendor card.
 * @remarks
 * This object is created by the [VendorSpecificDataReceived](claimedmagneticstripereader_vendorspecificdatareceived.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadervendorspecificcarddatareceivedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets data for the recently swiped vendor card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadervendorspecificcarddatareceivedeventargs.report
     * @type {MagneticStripeReaderReport} 
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
     * @returns {MagneticStripeReaderReport} 
     */
    get_Report() {
        if (!this.HasProp("__IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs := IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderVendorSpecificCardDataReceivedEventArgs.get_Report()
    }

;@endregion Instance Methods
}
