#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\BarcodeSymbologyAttributes.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class IBarcodeSymbologyAttributesBuilder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeSymbologyAttributesBuilder
     * @type {Guid}
     */
    static IID => Guid("{c57b0cbf-e4f5-40b9-84cf-e63fbaea42b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCheckDigitValidationSupported", "put_IsCheckDigitValidationSupported", "get_IsCheckDigitTransmissionSupported", "put_IsCheckDigitTransmissionSupported", "get_IsDecodeLengthSupported", "put_IsDecodeLengthSupported", "CreateAttributes"]

    /**
     * @type {Boolean} 
     */
    IsCheckDigitValidationSupported {
        get => this.get_IsCheckDigitValidationSupported()
        set => this.put_IsCheckDigitValidationSupported(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCheckDigitTransmissionSupported {
        get => this.get_IsCheckDigitTransmissionSupported()
        set => this.put_IsCheckDigitTransmissionSupported(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDecodeLengthSupported {
        get => this.get_IsDecodeLengthSupported()
        set => this.put_IsDecodeLengthSupported(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitValidationSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCheckDigitValidationSupported(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitTransmissionSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCheckDigitTransmissionSupported(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecodeLengthSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDecodeLengthSupported(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BarcodeSymbologyAttributes} 
     */
    CreateAttributes() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarcodeSymbologyAttributes(value)
    }
}
