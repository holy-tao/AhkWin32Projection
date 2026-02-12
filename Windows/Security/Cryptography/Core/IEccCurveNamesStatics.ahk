#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IEccCurveNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEccCurveNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{b3ff930c-aeeb-409e-b7d4-9b95295aaecf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BrainpoolP160r1", "get_BrainpoolP160t1", "get_BrainpoolP192r1", "get_BrainpoolP192t1", "get_BrainpoolP224r1", "get_BrainpoolP224t1", "get_BrainpoolP256r1", "get_BrainpoolP256t1", "get_BrainpoolP320r1", "get_BrainpoolP320t1", "get_BrainpoolP384r1", "get_BrainpoolP384t1", "get_BrainpoolP512r1", "get_BrainpoolP512t1", "get_Curve25519", "get_Ec192wapi", "get_NistP192", "get_NistP224", "get_NistP256", "get_NistP384", "get_NistP521", "get_NumsP256t1", "get_NumsP384t1", "get_NumsP512t1", "get_SecP160k1", "get_SecP160r1", "get_SecP160r2", "get_SecP192k1", "get_SecP192r1", "get_SecP224k1", "get_SecP224r1", "get_SecP256k1", "get_SecP256r1", "get_SecP384r1", "get_SecP521r1", "get_Wtls7", "get_Wtls9", "get_Wtls12", "get_X962P192v1", "get_X962P192v2", "get_X962P192v3", "get_X962P239v1", "get_X962P239v2", "get_X962P239v3", "get_X962P256v1", "get_AllEccCurveNames"]

    /**
     * @type {HSTRING} 
     */
    BrainpoolP160r1 {
        get => this.get_BrainpoolP160r1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP160t1 {
        get => this.get_BrainpoolP160t1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP192r1 {
        get => this.get_BrainpoolP192r1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP192t1 {
        get => this.get_BrainpoolP192t1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP224r1 {
        get => this.get_BrainpoolP224r1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP224t1 {
        get => this.get_BrainpoolP224t1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP256r1 {
        get => this.get_BrainpoolP256r1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP256t1 {
        get => this.get_BrainpoolP256t1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP320r1 {
        get => this.get_BrainpoolP320r1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP320t1 {
        get => this.get_BrainpoolP320t1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP384r1 {
        get => this.get_BrainpoolP384r1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP384t1 {
        get => this.get_BrainpoolP384t1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP512r1 {
        get => this.get_BrainpoolP512r1()
    }

    /**
     * @type {HSTRING} 
     */
    BrainpoolP512t1 {
        get => this.get_BrainpoolP512t1()
    }

    /**
     * @type {HSTRING} 
     */
    Curve25519 {
        get => this.get_Curve25519()
    }

    /**
     * @type {HSTRING} 
     */
    Ec192wapi {
        get => this.get_Ec192wapi()
    }

    /**
     * @type {HSTRING} 
     */
    NistP192 {
        get => this.get_NistP192()
    }

    /**
     * @type {HSTRING} 
     */
    NistP224 {
        get => this.get_NistP224()
    }

    /**
     * @type {HSTRING} 
     */
    NistP256 {
        get => this.get_NistP256()
    }

    /**
     * @type {HSTRING} 
     */
    NistP384 {
        get => this.get_NistP384()
    }

    /**
     * @type {HSTRING} 
     */
    NistP521 {
        get => this.get_NistP521()
    }

    /**
     * @type {HSTRING} 
     */
    NumsP256t1 {
        get => this.get_NumsP256t1()
    }

    /**
     * @type {HSTRING} 
     */
    NumsP384t1 {
        get => this.get_NumsP384t1()
    }

    /**
     * @type {HSTRING} 
     */
    NumsP512t1 {
        get => this.get_NumsP512t1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP160k1 {
        get => this.get_SecP160k1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP160r1 {
        get => this.get_SecP160r1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP160r2 {
        get => this.get_SecP160r2()
    }

    /**
     * @type {HSTRING} 
     */
    SecP192k1 {
        get => this.get_SecP192k1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP192r1 {
        get => this.get_SecP192r1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP224k1 {
        get => this.get_SecP224k1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP224r1 {
        get => this.get_SecP224r1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP256k1 {
        get => this.get_SecP256k1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP256r1 {
        get => this.get_SecP256r1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP384r1 {
        get => this.get_SecP384r1()
    }

    /**
     * @type {HSTRING} 
     */
    SecP521r1 {
        get => this.get_SecP521r1()
    }

    /**
     * @type {HSTRING} 
     */
    Wtls7 {
        get => this.get_Wtls7()
    }

    /**
     * @type {HSTRING} 
     */
    Wtls9 {
        get => this.get_Wtls9()
    }

    /**
     * @type {HSTRING} 
     */
    Wtls12 {
        get => this.get_Wtls12()
    }

    /**
     * @type {HSTRING} 
     */
    X962P192v1 {
        get => this.get_X962P192v1()
    }

    /**
     * @type {HSTRING} 
     */
    X962P192v2 {
        get => this.get_X962P192v2()
    }

    /**
     * @type {HSTRING} 
     */
    X962P192v3 {
        get => this.get_X962P192v3()
    }

    /**
     * @type {HSTRING} 
     */
    X962P239v1 {
        get => this.get_X962P239v1()
    }

    /**
     * @type {HSTRING} 
     */
    X962P239v2 {
        get => this.get_X962P239v2()
    }

    /**
     * @type {HSTRING} 
     */
    X962P239v3 {
        get => this.get_X962P239v3()
    }

    /**
     * @type {HSTRING} 
     */
    X962P256v1 {
        get => this.get_X962P256v1()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    AllEccCurveNames {
        get => this.get_AllEccCurveNames()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BrainpoolP160r1() {
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
    get_BrainpoolP160t1() {
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
    get_BrainpoolP192r1() {
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
    get_BrainpoolP192t1() {
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
    get_BrainpoolP224r1() {
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
    get_BrainpoolP224t1() {
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
    get_BrainpoolP256r1() {
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
    get_BrainpoolP256t1() {
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
    get_BrainpoolP320r1() {
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
    get_BrainpoolP320t1() {
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
    get_BrainpoolP384r1() {
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
    get_BrainpoolP384t1() {
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
    get_BrainpoolP512r1() {
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
    get_BrainpoolP512t1() {
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
    get_Curve25519() {
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
    get_Ec192wapi() {
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
    get_NistP192() {
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
    get_NistP224() {
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
    get_NistP256() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NistP384() {
        value := HSTRING()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NistP521() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumsP256t1() {
        value := HSTRING()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumsP384t1() {
        value := HSTRING()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumsP512t1() {
        value := HSTRING()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP160k1() {
        value := HSTRING()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP160r1() {
        value := HSTRING()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP160r2() {
        value := HSTRING()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP192k1() {
        value := HSTRING()
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP192r1() {
        value := HSTRING()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP224k1() {
        value := HSTRING()
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP224r1() {
        value := HSTRING()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP256k1() {
        value := HSTRING()
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP256r1() {
        value := HSTRING()
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP384r1() {
        value := HSTRING()
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecP521r1() {
        value := HSTRING()
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wtls7() {
        value := HSTRING()
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wtls9() {
        value := HSTRING()
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wtls12() {
        value := HSTRING()
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_X962P192v1() {
        value := HSTRING()
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_X962P192v2() {
        value := HSTRING()
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_X962P192v3() {
        value := HSTRING()
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_X962P239v1() {
        value := HSTRING()
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_X962P239v2() {
        value := HSTRING()
        result := ComCall(48, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_X962P239v3() {
        value := HSTRING()
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_X962P256v1() {
        value := HSTRING()
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AllEccCurveNames() {
        result := ComCall(51, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
