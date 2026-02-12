#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnifiedPosErrorData.ahk
#Include .\IUnifiedPosErrorDataFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides error information.
 * @remarks
 * This object is accessed when you retrieve the ErrorData property of the [BarcodeScannerErrorOccurredEventArgs](barcodescannererroroccurredeventargs.md) or [MagneticStripeReaderErrorOccurredEventArgs](magneticstripereadererroroccurredeventargs.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrordata
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class UnifiedPosErrorData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUnifiedPosErrorData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUnifiedPosErrorData.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance for UnifiedPosErrorData.
     * @param {HSTRING} message The error message.
     * @param {Integer} severity The error severity.
     * @param {Integer} reason The cause of the error.
     * @param {Integer} extendedReason The vendor specific error information.
     * @returns {UnifiedPosErrorData} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrordata.#ctor
     */
    static CreateInstance(message, severity, reason, extendedReason) {
        if (!UnifiedPosErrorData.HasProp("__IUnifiedPosErrorDataFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.UnifiedPosErrorData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUnifiedPosErrorDataFactory.IID)
            UnifiedPosErrorData.__IUnifiedPosErrorDataFactory := IUnifiedPosErrorDataFactory(factoryPtr)
        }

        return UnifiedPosErrorData.__IUnifiedPosErrorDataFactory.CreateInstance(message, severity, reason, extendedReason)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the error message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrordata.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * Gets the error severity.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrordata.severity
     * @type {Integer} 
     */
    Severity {
        get => this.get_Severity()
    }

    /**
     * Gets the cause of the error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrordata.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * Gets the vendor specific error information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrordata.extendedreason
     * @type {Integer} 
     */
    ExtendedReason {
        get => this.get_ExtendedReason()
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
    get_Message() {
        if (!this.HasProp("__IUnifiedPosErrorData")) {
            if ((queryResult := this.QueryInterface(IUnifiedPosErrorData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnifiedPosErrorData := IUnifiedPosErrorData(outPtr)
        }

        return this.__IUnifiedPosErrorData.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Severity() {
        if (!this.HasProp("__IUnifiedPosErrorData")) {
            if ((queryResult := this.QueryInterface(IUnifiedPosErrorData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnifiedPosErrorData := IUnifiedPosErrorData(outPtr)
        }

        return this.__IUnifiedPosErrorData.get_Severity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IUnifiedPosErrorData")) {
            if ((queryResult := this.QueryInterface(IUnifiedPosErrorData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnifiedPosErrorData := IUnifiedPosErrorData(outPtr)
        }

        return this.__IUnifiedPosErrorData.get_Reason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedReason() {
        if (!this.HasProp("__IUnifiedPosErrorData")) {
            if ((queryResult := this.QueryInterface(IUnifiedPosErrorData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnifiedPosErrorData := IUnifiedPosErrorData(outPtr)
        }

        return this.__IUnifiedPosErrorData.get_ExtendedReason()
    }

;@endregion Instance Methods
}
