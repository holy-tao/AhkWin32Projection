#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IKeyDerivationAlgorithmNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyDerivationAlgorithmNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{7b6e363e-94d2-4739-a57b-022e0c3a402a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Pbkdf2Md5", "get_Pbkdf2Sha1", "get_Pbkdf2Sha256", "get_Pbkdf2Sha384", "get_Pbkdf2Sha512", "get_Sp800108CtrHmacMd5", "get_Sp800108CtrHmacSha1", "get_Sp800108CtrHmacSha256", "get_Sp800108CtrHmacSha384", "get_Sp800108CtrHmacSha512", "get_Sp80056aConcatMd5", "get_Sp80056aConcatSha1", "get_Sp80056aConcatSha256", "get_Sp80056aConcatSha384", "get_Sp80056aConcatSha512"]

    /**
     * @type {HSTRING} 
     */
    Pbkdf2Md5 {
        get => this.get_Pbkdf2Md5()
    }

    /**
     * @type {HSTRING} 
     */
    Pbkdf2Sha1 {
        get => this.get_Pbkdf2Sha1()
    }

    /**
     * @type {HSTRING} 
     */
    Pbkdf2Sha256 {
        get => this.get_Pbkdf2Sha256()
    }

    /**
     * @type {HSTRING} 
     */
    Pbkdf2Sha384 {
        get => this.get_Pbkdf2Sha384()
    }

    /**
     * @type {HSTRING} 
     */
    Pbkdf2Sha512 {
        get => this.get_Pbkdf2Sha512()
    }

    /**
     * @type {HSTRING} 
     */
    Sp800108CtrHmacMd5 {
        get => this.get_Sp800108CtrHmacMd5()
    }

    /**
     * @type {HSTRING} 
     */
    Sp800108CtrHmacSha1 {
        get => this.get_Sp800108CtrHmacSha1()
    }

    /**
     * @type {HSTRING} 
     */
    Sp800108CtrHmacSha256 {
        get => this.get_Sp800108CtrHmacSha256()
    }

    /**
     * @type {HSTRING} 
     */
    Sp800108CtrHmacSha384 {
        get => this.get_Sp800108CtrHmacSha384()
    }

    /**
     * @type {HSTRING} 
     */
    Sp800108CtrHmacSha512 {
        get => this.get_Sp800108CtrHmacSha512()
    }

    /**
     * @type {HSTRING} 
     */
    Sp80056aConcatMd5 {
        get => this.get_Sp80056aConcatMd5()
    }

    /**
     * @type {HSTRING} 
     */
    Sp80056aConcatSha1 {
        get => this.get_Sp80056aConcatSha1()
    }

    /**
     * @type {HSTRING} 
     */
    Sp80056aConcatSha256 {
        get => this.get_Sp80056aConcatSha256()
    }

    /**
     * @type {HSTRING} 
     */
    Sp80056aConcatSha384 {
        get => this.get_Sp80056aConcatSha384()
    }

    /**
     * @type {HSTRING} 
     */
    Sp80056aConcatSha512 {
        get => this.get_Sp80056aConcatSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pbkdf2Md5() {
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
    get_Pbkdf2Sha1() {
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
    get_Pbkdf2Sha256() {
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
    get_Pbkdf2Sha384() {
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
    get_Pbkdf2Sha512() {
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
    get_Sp800108CtrHmacMd5() {
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
    get_Sp800108CtrHmacSha1() {
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
    get_Sp800108CtrHmacSha256() {
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
    get_Sp800108CtrHmacSha384() {
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
    get_Sp800108CtrHmacSha512() {
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
    get_Sp80056aConcatMd5() {
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
    get_Sp80056aConcatSha1() {
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
    get_Sp80056aConcatSha256() {
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
    get_Sp80056aConcatSha384() {
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
    get_Sp80056aConcatSha512() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
