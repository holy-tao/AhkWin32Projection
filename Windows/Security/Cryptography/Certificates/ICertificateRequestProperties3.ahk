#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateRequestProperties3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateRequestProperties3
     * @type {Guid}
     */
    static IID => Guid("{e687f616-734d-46b1-9d4c-6edfdbfc845b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurveName", "put_CurveName", "get_CurveParameters", "put_CurveParameters", "get_ContainerNamePrefix", "put_ContainerNamePrefix", "get_ContainerName", "put_ContainerName", "get_UseExistingKey", "put_UseExistingKey"]

    /**
     * @type {HSTRING} 
     */
    CurveName {
        get => this.get_CurveName()
        set => this.put_CurveName(value)
    }

    /**
     */
    CurveParameters {
        get => this.get_CurveParameters()
        set => this.put_CurveParameters(value)
    }

    /**
     * @type {HSTRING} 
     */
    ContainerNamePrefix {
        get => this.get_ContainerNamePrefix()
        set => this.put_ContainerNamePrefix(value)
    }

    /**
     * @type {HSTRING} 
     */
    ContainerName {
        get => this.get_ContainerName()
        set => this.put_ContainerName(value)
    }

    /**
     * @type {Boolean} 
     */
    UseExistingKey {
        get => this.get_UseExistingKey()
        set => this.put_UseExistingKey(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurveName() {
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
    put_CurveName(value) {
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
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_CurveParameters(value) {
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
    put_CurveParameters(value_length, value) {
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
    get_ContainerNamePrefix() {
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
    put_ContainerNamePrefix(value) {
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

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContainerName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_ContainerName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseExistingKey() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_UseExistingKey(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
