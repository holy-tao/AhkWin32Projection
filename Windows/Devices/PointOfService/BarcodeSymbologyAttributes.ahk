#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeSymbologyAttributes.ahk
#Include ..\..\..\Guid.ahk

/**
 * The attributes of a barcode scanner symbology.
 * @remarks
 * This object is created when a [ClaimedBarcodeScanner.GetSymbologyAttributesAsync](claimedbarcodescanner_getsymbologyattributesasync_1783019997.md) method completes.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeSymbologyAttributes extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeSymbologyAttributes

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeSymbologyAttributes.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether barcode check digit will be validated.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.ischeckdigitvalidationenabled
     * @type {Boolean} 
     */
    IsCheckDigitValidationEnabled {
        get => this.get_IsCheckDigitValidationEnabled()
        set => this.put_IsCheckDigitValidationEnabled(value)
    }

    /**
     * Gets whether the barcode symbology supports check digit validation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.ischeckdigitvalidationsupported
     * @type {Boolean} 
     */
    IsCheckDigitValidationSupported {
        get => this.get_IsCheckDigitValidationSupported()
    }

    /**
     * Gets or sets whether the check digit will be transmitted to the host as part of the raw data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.ischeckdigittransmissionenabled
     * @type {Boolean} 
     */
    IsCheckDigitTransmissionEnabled {
        get => this.get_IsCheckDigitTransmissionEnabled()
        set => this.put_IsCheckDigitTransmissionEnabled(value)
    }

    /**
     * Gets whether the barcode symbology supports transmitting the check digit to the host as part of the raw data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.ischeckdigittransmissionsupported
     * @type {Boolean} 
     */
    IsCheckDigitTransmissionSupported {
        get => this.get_IsCheckDigitTransmissionSupported()
    }

    /**
     * Gets or sets the first value used to determine the barcode symbology decode length.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.decodelength1
     * @type {Integer} 
     */
    DecodeLength1 {
        get => this.get_DecodeLength1()
        set => this.put_DecodeLength1(value)
    }

    /**
     * Gets or sets the second value used to determine the barcode symbology decode length.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.decodelength2
     * @type {Integer} 
     */
    DecodeLength2 {
        get => this.get_DecodeLength2()
        set => this.put_DecodeLength2(value)
    }

    /**
     * Gets or sets the decode length kind used by the barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.decodelengthkind
     * @type {Integer} 
     */
    DecodeLengthKind {
        get => this.get_DecodeLengthKind()
        set => this.put_DecodeLengthKind(value)
    }

    /**
     * Gets whether the barcode symbology supports multiple decode lengths.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologyattributes.isdecodelengthsupported
     * @type {Boolean} 
     */
    IsDecodeLengthSupported {
        get => this.get_IsDecodeLengthSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitValidationEnabled() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_IsCheckDigitValidationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCheckDigitValidationEnabled(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.put_IsCheckDigitValidationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitValidationSupported() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_IsCheckDigitValidationSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitTransmissionEnabled() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_IsCheckDigitTransmissionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCheckDigitTransmissionEnabled(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.put_IsCheckDigitTransmissionEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitTransmissionSupported() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_IsCheckDigitTransmissionSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodeLength1() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_DecodeLength1()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodeLength1(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.put_DecodeLength1(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodeLength2() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_DecodeLength2()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodeLength2(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.put_DecodeLength2(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodeLengthKind() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_DecodeLengthKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodeLengthKind(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.put_DecodeLengthKind(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecodeLengthSupported() {
        if (!this.HasProp("__IBarcodeSymbologyAttributes")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributes := IBarcodeSymbologyAttributes(outPtr)
        }

        return this.__IBarcodeSymbologyAttributes.get_IsDecodeLengthSupported()
    }

;@endregion Instance Methods
}
