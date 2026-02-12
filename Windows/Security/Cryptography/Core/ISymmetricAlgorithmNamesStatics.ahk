#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class ISymmetricAlgorithmNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISymmetricAlgorithmNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{6870727b-c996-4eae-84d7-79b2aeb73b9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesCbc", "get_DesEcb", "get_TripleDesCbc", "get_TripleDesEcb", "get_Rc2Cbc", "get_Rc2Ecb", "get_AesCbc", "get_AesEcb", "get_AesGcm", "get_AesCcm", "get_AesCbcPkcs7", "get_AesEcbPkcs7", "get_DesCbcPkcs7", "get_DesEcbPkcs7", "get_TripleDesCbcPkcs7", "get_TripleDesEcbPkcs7", "get_Rc2CbcPkcs7", "get_Rc2EcbPkcs7", "get_Rc4"]

    /**
     * @type {HSTRING} 
     */
    DesCbc {
        get => this.get_DesCbc()
    }

    /**
     * @type {HSTRING} 
     */
    DesEcb {
        get => this.get_DesEcb()
    }

    /**
     * @type {HSTRING} 
     */
    TripleDesCbc {
        get => this.get_TripleDesCbc()
    }

    /**
     * @type {HSTRING} 
     */
    TripleDesEcb {
        get => this.get_TripleDesEcb()
    }

    /**
     * @type {HSTRING} 
     */
    Rc2Cbc {
        get => this.get_Rc2Cbc()
    }

    /**
     * @type {HSTRING} 
     */
    Rc2Ecb {
        get => this.get_Rc2Ecb()
    }

    /**
     * @type {HSTRING} 
     */
    AesCbc {
        get => this.get_AesCbc()
    }

    /**
     * @type {HSTRING} 
     */
    AesEcb {
        get => this.get_AesEcb()
    }

    /**
     * @type {HSTRING} 
     */
    AesGcm {
        get => this.get_AesGcm()
    }

    /**
     * @type {HSTRING} 
     */
    AesCcm {
        get => this.get_AesCcm()
    }

    /**
     * @type {HSTRING} 
     */
    AesCbcPkcs7 {
        get => this.get_AesCbcPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    AesEcbPkcs7 {
        get => this.get_AesEcbPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    DesCbcPkcs7 {
        get => this.get_DesCbcPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    DesEcbPkcs7 {
        get => this.get_DesEcbPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    TripleDesCbcPkcs7 {
        get => this.get_TripleDesCbcPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    TripleDesEcbPkcs7 {
        get => this.get_TripleDesEcbPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    Rc2CbcPkcs7 {
        get => this.get_Rc2CbcPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    Rc2EcbPkcs7 {
        get => this.get_Rc2EcbPkcs7()
    }

    /**
     * @type {HSTRING} 
     */
    Rc4 {
        get => this.get_Rc4()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DesCbc() {
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
    get_DesEcb() {
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
    get_TripleDesCbc() {
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
    get_TripleDesEcb() {
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
    get_Rc2Cbc() {
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
    get_Rc2Ecb() {
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
    get_AesCbc() {
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
    get_AesEcb() {
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
    get_AesGcm() {
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
    get_AesCcm() {
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
    get_AesCbcPkcs7() {
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
    get_AesEcbPkcs7() {
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
    get_DesCbcPkcs7() {
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
    get_DesEcbPkcs7() {
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
    get_TripleDesCbcPkcs7() {
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
    get_TripleDesEcbPkcs7() {
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
    get_Rc2CbcPkcs7() {
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
    get_Rc2EcbPkcs7() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Rc4() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
