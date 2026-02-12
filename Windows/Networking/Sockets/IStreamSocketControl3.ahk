#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Cryptography\Certificates\Certificate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketControl3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketControl3
     * @type {Guid}
     */
    static IID => Guid("{c56a444c-4e74-403e-894c-b31cae5c7342}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SerializeConnectionAttempts", "put_SerializeConnectionAttempts", "get_ClientCertificate", "put_ClientCertificate"]

    /**
     * @type {Boolean} 
     */
    SerializeConnectionAttempts {
        get => this.get_SerializeConnectionAttempts()
        set => this.put_SerializeConnectionAttempts(value)
    }

    /**
     * @type {Certificate} 
     */
    ClientCertificate {
        get => this.get_ClientCertificate()
        set => this.put_ClientCertificate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SerializeConnectionAttempts() {
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
    put_SerializeConnectionAttempts(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ClientCertificate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_ClientCertificate(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
