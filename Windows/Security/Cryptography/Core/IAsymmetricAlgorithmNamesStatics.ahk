#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IAsymmetricAlgorithmNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsymmetricAlgorithmNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{caf6fce4-67c0-46aa-84f9-752e77449f9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RsaPkcs1", "get_RsaOaepSha1", "get_RsaOaepSha256", "get_RsaOaepSha384", "get_RsaOaepSha512", "get_EcdsaP256Sha256", "get_EcdsaP384Sha384", "get_EcdsaP521Sha512", "get_DsaSha1", "get_DsaSha256", "get_RsaSignPkcs1Sha1", "get_RsaSignPkcs1Sha256", "get_RsaSignPkcs1Sha384", "get_RsaSignPkcs1Sha512", "get_RsaSignPssSha1", "get_RsaSignPssSha256", "get_RsaSignPssSha384", "get_RsaSignPssSha512"]

    /**
     * @type {HSTRING} 
     */
    RsaPkcs1 {
        get => this.get_RsaPkcs1()
    }

    /**
     * @type {HSTRING} 
     */
    RsaOaepSha1 {
        get => this.get_RsaOaepSha1()
    }

    /**
     * @type {HSTRING} 
     */
    RsaOaepSha256 {
        get => this.get_RsaOaepSha256()
    }

    /**
     * @type {HSTRING} 
     */
    RsaOaepSha384 {
        get => this.get_RsaOaepSha384()
    }

    /**
     * @type {HSTRING} 
     */
    RsaOaepSha512 {
        get => this.get_RsaOaepSha512()
    }

    /**
     * @type {HSTRING} 
     */
    EcdsaP256Sha256 {
        get => this.get_EcdsaP256Sha256()
    }

    /**
     * @type {HSTRING} 
     */
    EcdsaP384Sha384 {
        get => this.get_EcdsaP384Sha384()
    }

    /**
     * @type {HSTRING} 
     */
    EcdsaP521Sha512 {
        get => this.get_EcdsaP521Sha512()
    }

    /**
     * @type {HSTRING} 
     */
    DsaSha1 {
        get => this.get_DsaSha1()
    }

    /**
     * @type {HSTRING} 
     */
    DsaSha256 {
        get => this.get_DsaSha256()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPkcs1Sha1 {
        get => this.get_RsaSignPkcs1Sha1()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPkcs1Sha256 {
        get => this.get_RsaSignPkcs1Sha256()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPkcs1Sha384 {
        get => this.get_RsaSignPkcs1Sha384()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPkcs1Sha512 {
        get => this.get_RsaSignPkcs1Sha512()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPssSha1 {
        get => this.get_RsaSignPssSha1()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPssSha256 {
        get => this.get_RsaSignPssSha256()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPssSha384 {
        get => this.get_RsaSignPssSha384()
    }

    /**
     * @type {HSTRING} 
     */
    RsaSignPssSha512 {
        get => this.get_RsaSignPssSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaPkcs1() {
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
    get_RsaOaepSha1() {
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
    get_RsaOaepSha256() {
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
    get_RsaOaepSha384() {
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
    get_RsaOaepSha512() {
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
    get_EcdsaP256Sha256() {
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
    get_EcdsaP384Sha384() {
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
    get_EcdsaP521Sha512() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DsaSha1() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DsaSha256() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPkcs1Sha1() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPkcs1Sha256() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPkcs1Sha384() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPkcs1Sha512() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPssSha1() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPssSha256() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPssSha384() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RsaSignPssSha512() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
