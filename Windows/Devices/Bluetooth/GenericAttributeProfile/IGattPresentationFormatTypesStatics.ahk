#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattPresentationFormatTypesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattPresentationFormatTypesStatics
     * @type {Guid}
     */
    static IID => Guid("{faf1ba0a-30ba-409c-bef7-cffb6d03b8fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Boolean", "get_Bit2", "get_Nibble", "get_UInt8", "get_UInt12", "get_UInt16", "get_UInt24", "get_UInt32", "get_UInt48", "get_UInt64", "get_UInt128", "get_SInt8", "get_SInt12", "get_SInt16", "get_SInt24", "get_SInt32", "get_SInt48", "get_SInt64", "get_SInt128", "get_Float32", "get_Float64", "get_SFloat", "get_Float", "get_DUInt16", "get_Utf8", "get_Utf16", "get_Struct"]

    /**
     * @type {Integer} 
     */
    Boolean {
        get => this.get_Boolean()
    }

    /**
     * @type {Integer} 
     */
    Bit2 {
        get => this.get_Bit2()
    }

    /**
     * @type {Integer} 
     */
    Nibble {
        get => this.get_Nibble()
    }

    /**
     * @type {Integer} 
     */
    UInt8 {
        get => this.get_UInt8()
    }

    /**
     * @type {Integer} 
     */
    UInt12 {
        get => this.get_UInt12()
    }

    /**
     * @type {Integer} 
     */
    UInt16 {
        get => this.get_UInt16()
    }

    /**
     * @type {Integer} 
     */
    UInt24 {
        get => this.get_UInt24()
    }

    /**
     * @type {Integer} 
     */
    UInt32 {
        get => this.get_UInt32()
    }

    /**
     * @type {Integer} 
     */
    UInt48 {
        get => this.get_UInt48()
    }

    /**
     * @type {Integer} 
     */
    UInt64 {
        get => this.get_UInt64()
    }

    /**
     * @type {Integer} 
     */
    UInt128 {
        get => this.get_UInt128()
    }

    /**
     * @type {Integer} 
     */
    SInt8 {
        get => this.get_SInt8()
    }

    /**
     * @type {Integer} 
     */
    SInt12 {
        get => this.get_SInt12()
    }

    /**
     * @type {Integer} 
     */
    SInt16 {
        get => this.get_SInt16()
    }

    /**
     * @type {Integer} 
     */
    SInt24 {
        get => this.get_SInt24()
    }

    /**
     * @type {Integer} 
     */
    SInt32 {
        get => this.get_SInt32()
    }

    /**
     * @type {Integer} 
     */
    SInt48 {
        get => this.get_SInt48()
    }

    /**
     * @type {Integer} 
     */
    SInt64 {
        get => this.get_SInt64()
    }

    /**
     * @type {Integer} 
     */
    SInt128 {
        get => this.get_SInt128()
    }

    /**
     * @type {Integer} 
     */
    Float32 {
        get => this.get_Float32()
    }

    /**
     * @type {Integer} 
     */
    Float64 {
        get => this.get_Float64()
    }

    /**
     * @type {Integer} 
     */
    SFloat {
        get => this.get_SFloat()
    }

    /**
     * @type {Integer} 
     */
    Float {
        get => this.get_Float()
    }

    /**
     * @type {Integer} 
     */
    DUInt16 {
        get => this.get_DUInt16()
    }

    /**
     * @type {Integer} 
     */
    Utf8 {
        get => this.get_Utf8()
    }

    /**
     * @type {Integer} 
     */
    Utf16 {
        get => this.get_Utf16()
    }

    /**
     * @type {Integer} 
     */
    Struct {
        get => this.get_Struct()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Boolean() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bit2() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Nibble() {
        result := ComCall(8, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt8() {
        result := ComCall(9, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt12() {
        result := ComCall(10, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt16() {
        result := ComCall(11, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt24() {
        result := ComCall(12, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt32() {
        result := ComCall(13, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt48() {
        result := ComCall(14, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt64() {
        result := ComCall(15, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UInt128() {
        result := ComCall(16, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt8() {
        result := ComCall(17, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt12() {
        result := ComCall(18, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt16() {
        result := ComCall(19, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt24() {
        result := ComCall(20, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt32() {
        result := ComCall(21, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt48() {
        result := ComCall(22, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt64() {
        result := ComCall(23, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SInt128() {
        result := ComCall(24, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Float32() {
        result := ComCall(25, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Float64() {
        result := ComCall(26, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SFloat() {
        result := ComCall(27, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Float() {
        result := ComCall(28, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DUInt16() {
        result := ComCall(29, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Utf8() {
        result := ComCall(30, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Utf16() {
        result := ComCall(31, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Struct() {
        result := ComCall(32, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
