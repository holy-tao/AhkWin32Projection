#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides error information for the [ErrorOccurred](claimedmagneticstripereader_erroroccurred.md) event.
 * @remarks
 * This object is created by the [ErrorOccurred](claimedmagneticstripereader_erroroccurred.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererroroccurredeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderErrorOccurredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReaderErrorOccurredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReaderErrorOccurredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Track 1 error information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererroroccurredeventargs.track1status
     * @type {Integer} 
     */
    Track1Status {
        get => this.get_Track1Status()
    }

    /**
     * Gets the Track 2 error information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererroroccurredeventargs.track2status
     * @type {Integer} 
     */
    Track2Status {
        get => this.get_Track2Status()
    }

    /**
     * Gets the Track 3 error information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererroroccurredeventargs.track3status
     * @type {Integer} 
     */
    Track3Status {
        get => this.get_Track3Status()
    }

    /**
     * Gets the Track 4 error information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererroroccurredeventargs.track4status
     * @type {Integer} 
     */
    Track4Status {
        get => this.get_Track4Status()
    }

    /**
     * Gets the error information, such as cause of error, severity, error message, and any available vendor specific error information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererroroccurredeventargs.errordata
     * @type {UnifiedPosErrorData} 
     */
    ErrorData {
        get => this.get_ErrorData()
    }

    /**
     * Gets the track data for tracks the did not have errors.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadererroroccurredeventargs.partialinputdata
     * @type {MagneticStripeReaderReport} 
     */
    PartialInputData {
        get => this.get_PartialInputData()
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
    get_Track1Status() {
        if (!this.HasProp("__IMagneticStripeReaderErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderErrorOccurredEventArgs := IMagneticStripeReaderErrorOccurredEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderErrorOccurredEventArgs.get_Track1Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Track2Status() {
        if (!this.HasProp("__IMagneticStripeReaderErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderErrorOccurredEventArgs := IMagneticStripeReaderErrorOccurredEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderErrorOccurredEventArgs.get_Track2Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Track3Status() {
        if (!this.HasProp("__IMagneticStripeReaderErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderErrorOccurredEventArgs := IMagneticStripeReaderErrorOccurredEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderErrorOccurredEventArgs.get_Track3Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Track4Status() {
        if (!this.HasProp("__IMagneticStripeReaderErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderErrorOccurredEventArgs := IMagneticStripeReaderErrorOccurredEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderErrorOccurredEventArgs.get_Track4Status()
    }

    /**
     * 
     * @returns {UnifiedPosErrorData} 
     */
    get_ErrorData() {
        if (!this.HasProp("__IMagneticStripeReaderErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderErrorOccurredEventArgs := IMagneticStripeReaderErrorOccurredEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderErrorOccurredEventArgs.get_ErrorData()
    }

    /**
     * 
     * @returns {MagneticStripeReaderReport} 
     */
    get_PartialInputData() {
        if (!this.HasProp("__IMagneticStripeReaderErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderErrorOccurredEventArgs := IMagneticStripeReaderErrorOccurredEventArgs(outPtr)
        }

        return this.__IMagneticStripeReaderErrorOccurredEventArgs.get_PartialInputData()
    }

;@endregion Instance Methods
}
