#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeSymbologyAttributesBuilder.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the builder of barcode symbology attributes.
 * @remarks
 * This object is used to build barcode symbology attributes objects.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodesymbologyattributesbuilder
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeSymbologyAttributesBuilder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeSymbologyAttributesBuilder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeSymbologyAttributesBuilder.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether the barcode symbology supports check digit validation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodesymbologyattributesbuilder.ischeckdigitvalidationsupported
     * @type {Boolean} 
     */
    IsCheckDigitValidationSupported {
        get => this.get_IsCheckDigitValidationSupported()
        set => this.put_IsCheckDigitValidationSupported(value)
    }

    /**
     * Gets or sets whether the barcode symbology supports transmitting the check digit to the client as part of the raw data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodesymbologyattributesbuilder.ischeckdigittransmissionsupported
     * @type {Boolean} 
     */
    IsCheckDigitTransmissionSupported {
        get => this.get_IsCheckDigitTransmissionSupported()
        set => this.put_IsCheckDigitTransmissionSupported(value)
    }

    /**
     * Gets or sets whether the barcode symbology supports multiple decode lengths.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodesymbologyattributesbuilder.isdecodelengthsupported
     * @type {Boolean} 
     */
    IsDecodeLengthSupported {
        get => this.get_IsDecodeLengthSupported()
        set => this.put_IsDecodeLengthSupported(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance for BarcodeSymbologyAttributesBuilder.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.Provider.BarcodeSymbologyAttributesBuilder")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitValidationSupported() {
        if (!this.HasProp("__IBarcodeSymbologyAttributesBuilder")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributesBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributesBuilder := IBarcodeSymbologyAttributesBuilder(outPtr)
        }

        return this.__IBarcodeSymbologyAttributesBuilder.get_IsCheckDigitValidationSupported()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCheckDigitValidationSupported(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributesBuilder")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributesBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributesBuilder := IBarcodeSymbologyAttributesBuilder(outPtr)
        }

        return this.__IBarcodeSymbologyAttributesBuilder.put_IsCheckDigitValidationSupported(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitTransmissionSupported() {
        if (!this.HasProp("__IBarcodeSymbologyAttributesBuilder")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributesBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributesBuilder := IBarcodeSymbologyAttributesBuilder(outPtr)
        }

        return this.__IBarcodeSymbologyAttributesBuilder.get_IsCheckDigitTransmissionSupported()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCheckDigitTransmissionSupported(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributesBuilder")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributesBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributesBuilder := IBarcodeSymbologyAttributesBuilder(outPtr)
        }

        return this.__IBarcodeSymbologyAttributesBuilder.put_IsCheckDigitTransmissionSupported(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecodeLengthSupported() {
        if (!this.HasProp("__IBarcodeSymbologyAttributesBuilder")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributesBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributesBuilder := IBarcodeSymbologyAttributesBuilder(outPtr)
        }

        return this.__IBarcodeSymbologyAttributesBuilder.get_IsDecodeLengthSupported()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDecodeLengthSupported(value) {
        if (!this.HasProp("__IBarcodeSymbologyAttributesBuilder")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributesBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributesBuilder := IBarcodeSymbologyAttributesBuilder(outPtr)
        }

        return this.__IBarcodeSymbologyAttributesBuilder.put_IsDecodeLengthSupported(value)
    }

    /**
     * Creates a BarcodeSymbologyAttributes object from the properties of this class.
     * @returns {BarcodeSymbologyAttributes} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodesymbologyattributesbuilder.createattributes
     */
    CreateAttributes() {
        if (!this.HasProp("__IBarcodeSymbologyAttributesBuilder")) {
            if ((queryResult := this.QueryInterface(IBarcodeSymbologyAttributesBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeSymbologyAttributesBuilder := IBarcodeSymbologyAttributesBuilder(outPtr)
        }

        return this.__IBarcodeSymbologyAttributesBuilder.CreateAttributes()
    }

;@endregion Instance Methods
}
