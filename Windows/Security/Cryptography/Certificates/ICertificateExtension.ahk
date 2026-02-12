#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateExtension extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateExtension
     * @type {Guid}
     */
    static IID => Guid("{84cf0656-a9e6-454d-8e45-2ea7c4bcd53b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ObjectId", "put_ObjectId", "get_IsCritical", "put_IsCritical", "EncodeValue", "get_Value", "put_Value"]

    /**
     * @type {HSTRING} 
     */
    ObjectId {
        get => this.get_ObjectId()
        set => this.put_ObjectId(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCritical {
        get => this.get_IsCritical()
        set => this.put_IsCritical(value)
    }

    /**
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ObjectId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ObjectId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCritical() {
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
    put_IsCritical(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    EncodeValue(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_Value(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Value(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
