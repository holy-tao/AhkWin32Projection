#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeSymbologyAttributes extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeSymbologyAttributes
     * @type {Guid}
     */
    static IID => Guid("{66413a78-ab7a-4ada-8ece-936014b2ead7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCheckDigitValidationEnabled", "put_IsCheckDigitValidationEnabled", "get_IsCheckDigitValidationSupported", "get_IsCheckDigitTransmissionEnabled", "put_IsCheckDigitTransmissionEnabled", "get_IsCheckDigitTransmissionSupported", "get_DecodeLength1", "put_DecodeLength1", "get_DecodeLength2", "put_DecodeLength2", "get_DecodeLengthKind", "put_DecodeLengthKind", "get_IsDecodeLengthSupported"]

    /**
     * @type {Boolean} 
     */
    IsCheckDigitValidationEnabled {
        get => this.get_IsCheckDigitValidationEnabled()
        set => this.put_IsCheckDigitValidationEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCheckDigitValidationSupported {
        get => this.get_IsCheckDigitValidationSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsCheckDigitTransmissionEnabled {
        get => this.get_IsCheckDigitTransmissionEnabled()
        set => this.put_IsCheckDigitTransmissionEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCheckDigitTransmissionSupported {
        get => this.get_IsCheckDigitTransmissionSupported()
    }

    /**
     * @type {Integer} 
     */
    DecodeLength1 {
        get => this.get_DecodeLength1()
        set => this.put_DecodeLength1(value)
    }

    /**
     * @type {Integer} 
     */
    DecodeLength2 {
        get => this.get_DecodeLength2()
        set => this.put_DecodeLength2(value)
    }

    /**
     * @type {Integer} 
     */
    DecodeLengthKind {
        get => this.get_DecodeLengthKind()
        set => this.put_DecodeLengthKind(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDecodeLengthSupported {
        get => this.get_IsDecodeLengthSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitValidationEnabled() {
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
    put_IsCheckDigitValidationEnabled(value) {
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
    get_IsCheckDigitValidationSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCheckDigitTransmissionEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_IsCheckDigitTransmissionEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
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
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodeLength1() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodeLength1(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodeLength2() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodeLength2(value) {
        result := ComCall(15, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecodeLengthKind() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DecodeLengthKind(value) {
        result := ComCall(17, this, "int", value, "int")
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
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
