#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IKeyAlgorithmNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyAlgorithmNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{479065d7-7ac7-4581-8c3b-d07027140448}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Rsa", "get_Dsa", "get_Ecdh256", "get_Ecdh384", "get_Ecdh521", "get_Ecdsa256", "get_Ecdsa384", "get_Ecdsa521"]

    /**
     * @type {HSTRING} 
     */
    Rsa {
        get => this.get_Rsa()
    }

    /**
     * @type {HSTRING} 
     */
    Dsa {
        get => this.get_Dsa()
    }

    /**
     * @type {HSTRING} 
     */
    Ecdh256 {
        get => this.get_Ecdh256()
    }

    /**
     * @type {HSTRING} 
     */
    Ecdh384 {
        get => this.get_Ecdh384()
    }

    /**
     * @type {HSTRING} 
     */
    Ecdh521 {
        get => this.get_Ecdh521()
    }

    /**
     * @type {HSTRING} 
     */
    Ecdsa256 {
        get => this.get_Ecdsa256()
    }

    /**
     * @type {HSTRING} 
     */
    Ecdsa384 {
        get => this.get_Ecdsa384()
    }

    /**
     * @type {HSTRING} 
     */
    Ecdsa521 {
        get => this.get_Ecdsa521()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Rsa() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Dsa() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ecdh256() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ecdh384() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ecdh521() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ecdsa256() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ecdsa384() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ecdsa521() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
