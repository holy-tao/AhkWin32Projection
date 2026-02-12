#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IUssdMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUssdMessage
     * @type {Guid}
     */
    static IID => Guid("{2f9acf82-2004-4d5d-bf81-2aba1b4be4a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataCodingScheme", "put_DataCodingScheme", "GetPayload", "SetPayload", "get_PayloadAsText", "put_PayloadAsText"]

    /**
     * @type {Integer} 
     */
    DataCodingScheme {
        get => this.get_DataCodingScheme()
        set => this.put_DataCodingScheme(value)
    }

    /**
     * @type {HSTRING} 
     */
    PayloadAsText {
        get => this.get_PayloadAsText()
        set => this.put_PayloadAsText(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataCodingScheme() {
        result := ComCall(6, this, "char*", &value := 0, "int")
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
    put_DataCodingScheme(value) {
        result := ComCall(7, this, "char", value, "int")
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
    GetPayload(value) {
        result := ComCall(8, this, "ptr", value, "int")
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
    SetPayload(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayloadAsText() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_PayloadAsText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
