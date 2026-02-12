#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [ErrorOccurred](claimedbarcodescanner_erroroccurred.md) event.
 * @remarks
 * This object is created by the [ErrorOccurred](claimedbarcodescanner_erroroccurred.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannererroroccurredeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerErrorOccurredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerErrorOccurredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerErrorOccurredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets any data that was successfully read.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannererroroccurredeventargs.partialinputdata
     * @type {BarcodeScannerReport} 
     */
    PartialInputData {
        get => this.get_PartialInputData()
    }

    /**
     * Indicates whether it is worthwhile to make another attempt at the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannererroroccurredeventargs.isretriable
     * @type {Boolean} 
     */
    IsRetriable {
        get => this.get_IsRetriable()
    }

    /**
     * Gets the data associated with the [ErrorOccurred](claimedbarcodescanner_erroroccurred.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannererroroccurredeventargs.errordata
     * @type {UnifiedPosErrorData} 
     */
    ErrorData {
        get => this.get_ErrorData()
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
    get_PartialInputData() {
        if (!this.HasProp("__IBarcodeScannerErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerErrorOccurredEventArgs := IBarcodeScannerErrorOccurredEventArgs(outPtr)
        }

        return this.__IBarcodeScannerErrorOccurredEventArgs.get_PartialInputData()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRetriable() {
        if (!this.HasProp("__IBarcodeScannerErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerErrorOccurredEventArgs := IBarcodeScannerErrorOccurredEventArgs(outPtr)
        }

        return this.__IBarcodeScannerErrorOccurredEventArgs.get_IsRetriable()
    }

    /**
     * 
     * @returns {UnifiedPosErrorData} 
     */
    get_ErrorData() {
        if (!this.HasProp("__IBarcodeScannerErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerErrorOccurredEventArgs := IBarcodeScannerErrorOccurredEventArgs(outPtr)
        }

        return this.__IBarcodeScannerErrorOccurredEventArgs.get_ErrorData()
    }

;@endregion Instance Methods
}
