#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateQuery2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateQuery2
     * @type {Guid}
     */
    static IID => Guid("{935a0af7-0bd9-4f75-b8c2-e27a7f74eecd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IncludeDuplicates", "put_IncludeDuplicates", "get_IncludeExpiredCertificates", "put_IncludeExpiredCertificates", "get_StoreName", "put_StoreName"]

    /**
     * @type {Boolean} 
     */
    IncludeDuplicates {
        get => this.get_IncludeDuplicates()
        set => this.put_IncludeDuplicates(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeExpiredCertificates {
        get => this.get_IncludeExpiredCertificates()
        set => this.put_IncludeExpiredCertificates(value)
    }

    /**
     * @type {HSTRING} 
     */
    StoreName {
        get => this.get_StoreName()
        set => this.put_StoreName(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeDuplicates() {
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
    put_IncludeDuplicates(value) {
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
    get_IncludeExpiredCertificates() {
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
    put_IncludeExpiredCertificates(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StoreName() {
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
    put_StoreName(value) {
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
