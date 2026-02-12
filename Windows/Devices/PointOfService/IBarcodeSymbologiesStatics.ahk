#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeSymbologiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeSymbologiesStatics
     * @type {Guid}
     */
    static IID => Guid("{ca8549bb-06d2-43f4-a44b-c620679fd8d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Unknown", "get_Ean8", "get_Ean8Add2", "get_Ean8Add5", "get_Eanv", "get_EanvAdd2", "get_EanvAdd5", "get_Ean13", "get_Ean13Add2", "get_Ean13Add5", "get_Isbn", "get_IsbnAdd5", "get_Ismn", "get_IsmnAdd2", "get_IsmnAdd5", "get_Issn", "get_IssnAdd2", "get_IssnAdd5", "get_Ean99", "get_Ean99Add2", "get_Ean99Add5", "get_Upca", "get_UpcaAdd2", "get_UpcaAdd5", "get_Upce", "get_UpceAdd2", "get_UpceAdd5", "get_UpcCoupon", "get_TfStd", "get_TfDis", "get_TfInt", "get_TfInd", "get_TfMat", "get_TfIata", "get_Gs1DatabarType1", "get_Gs1DatabarType2", "get_Gs1DatabarType3", "get_Code39", "get_Code39Ex", "get_Trioptic39", "get_Code32", "get_Pzn", "get_Code93", "get_Code93Ex", "get_Code128", "get_Gs1128", "get_Gs1128Coupon", "get_UccEan128", "get_Sisac", "get_Isbt", "get_Codabar", "get_Code11", "get_Msi", "get_Plessey", "get_Telepen", "get_Code16k", "get_CodablockA", "get_CodablockF", "get_Codablock128", "get_Code49", "get_Aztec", "get_DataCode", "get_DataMatrix", "get_HanXin", "get_Maxicode", "get_MicroPdf417", "get_MicroQr", "get_Pdf417", "get_Qr", "get_MsTag", "get_Ccab", "get_Ccc", "get_Tlc39", "get_AusPost", "get_CanPost", "get_ChinaPost", "get_DutchKix", "get_InfoMail", "get_ItalianPost25", "get_ItalianPost39", "get_JapanPost", "get_KoreanPost", "get_SwedenPost", "get_UkPost", "get_UsIntelligent", "get_UsIntelligentPkg", "get_UsPlanet", "get_UsPostNet", "get_Us4StateFics", "get_OcrA", "get_OcrB", "get_Micr", "get_ExtendedBase", "GetName"]

    /**
     * @type {Integer} 
     */
    Unknown {
        get => this.get_Unknown()
    }

    /**
     * @type {Integer} 
     */
    Ean8 {
        get => this.get_Ean8()
    }

    /**
     * @type {Integer} 
     */
    Ean8Add2 {
        get => this.get_Ean8Add2()
    }

    /**
     * @type {Integer} 
     */
    Ean8Add5 {
        get => this.get_Ean8Add5()
    }

    /**
     * @type {Integer} 
     */
    Eanv {
        get => this.get_Eanv()
    }

    /**
     * @type {Integer} 
     */
    EanvAdd2 {
        get => this.get_EanvAdd2()
    }

    /**
     * @type {Integer} 
     */
    EanvAdd5 {
        get => this.get_EanvAdd5()
    }

    /**
     * @type {Integer} 
     */
    Ean13 {
        get => this.get_Ean13()
    }

    /**
     * @type {Integer} 
     */
    Ean13Add2 {
        get => this.get_Ean13Add2()
    }

    /**
     * @type {Integer} 
     */
    Ean13Add5 {
        get => this.get_Ean13Add5()
    }

    /**
     * @type {Integer} 
     */
    Isbn {
        get => this.get_Isbn()
    }

    /**
     * @type {Integer} 
     */
    IsbnAdd5 {
        get => this.get_IsbnAdd5()
    }

    /**
     * @type {Integer} 
     */
    Ismn {
        get => this.get_Ismn()
    }

    /**
     * @type {Integer} 
     */
    IsmnAdd2 {
        get => this.get_IsmnAdd2()
    }

    /**
     * @type {Integer} 
     */
    IsmnAdd5 {
        get => this.get_IsmnAdd5()
    }

    /**
     * @type {Integer} 
     */
    Issn {
        get => this.get_Issn()
    }

    /**
     * @type {Integer} 
     */
    IssnAdd2 {
        get => this.get_IssnAdd2()
    }

    /**
     * @type {Integer} 
     */
    IssnAdd5 {
        get => this.get_IssnAdd5()
    }

    /**
     * @type {Integer} 
     */
    Ean99 {
        get => this.get_Ean99()
    }

    /**
     * @type {Integer} 
     */
    Ean99Add2 {
        get => this.get_Ean99Add2()
    }

    /**
     * @type {Integer} 
     */
    Ean99Add5 {
        get => this.get_Ean99Add5()
    }

    /**
     * @type {Integer} 
     */
    Upca {
        get => this.get_Upca()
    }

    /**
     * @type {Integer} 
     */
    UpcaAdd2 {
        get => this.get_UpcaAdd2()
    }

    /**
     * @type {Integer} 
     */
    UpcaAdd5 {
        get => this.get_UpcaAdd5()
    }

    /**
     * @type {Integer} 
     */
    Upce {
        get => this.get_Upce()
    }

    /**
     * @type {Integer} 
     */
    UpceAdd2 {
        get => this.get_UpceAdd2()
    }

    /**
     * @type {Integer} 
     */
    UpceAdd5 {
        get => this.get_UpceAdd5()
    }

    /**
     * @type {Integer} 
     */
    UpcCoupon {
        get => this.get_UpcCoupon()
    }

    /**
     * @type {Integer} 
     */
    TfStd {
        get => this.get_TfStd()
    }

    /**
     * @type {Integer} 
     */
    TfDis {
        get => this.get_TfDis()
    }

    /**
     * @type {Integer} 
     */
    TfInt {
        get => this.get_TfInt()
    }

    /**
     * @type {Integer} 
     */
    TfInd {
        get => this.get_TfInd()
    }

    /**
     * @type {Integer} 
     */
    TfMat {
        get => this.get_TfMat()
    }

    /**
     * @type {Integer} 
     */
    TfIata {
        get => this.get_TfIata()
    }

    /**
     * @type {Integer} 
     */
    Gs1DatabarType1 {
        get => this.get_Gs1DatabarType1()
    }

    /**
     * @type {Integer} 
     */
    Gs1DatabarType2 {
        get => this.get_Gs1DatabarType2()
    }

    /**
     * @type {Integer} 
     */
    Gs1DatabarType3 {
        get => this.get_Gs1DatabarType3()
    }

    /**
     * @type {Integer} 
     */
    Code39 {
        get => this.get_Code39()
    }

    /**
     * @type {Integer} 
     */
    Code39Ex {
        get => this.get_Code39Ex()
    }

    /**
     * @type {Integer} 
     */
    Trioptic39 {
        get => this.get_Trioptic39()
    }

    /**
     * @type {Integer} 
     */
    Code32 {
        get => this.get_Code32()
    }

    /**
     * @type {Integer} 
     */
    Pzn {
        get => this.get_Pzn()
    }

    /**
     * @type {Integer} 
     */
    Code93 {
        get => this.get_Code93()
    }

    /**
     * @type {Integer} 
     */
    Code93Ex {
        get => this.get_Code93Ex()
    }

    /**
     * @type {Integer} 
     */
    Code128 {
        get => this.get_Code128()
    }

    /**
     * @type {Integer} 
     */
    Gs1128 {
        get => this.get_Gs1128()
    }

    /**
     * @type {Integer} 
     */
    Gs1128Coupon {
        get => this.get_Gs1128Coupon()
    }

    /**
     * @type {Integer} 
     */
    UccEan128 {
        get => this.get_UccEan128()
    }

    /**
     * @type {Integer} 
     */
    Sisac {
        get => this.get_Sisac()
    }

    /**
     * @type {Integer} 
     */
    Isbt {
        get => this.get_Isbt()
    }

    /**
     * @type {Integer} 
     */
    Codabar {
        get => this.get_Codabar()
    }

    /**
     * @type {Integer} 
     */
    Code11 {
        get => this.get_Code11()
    }

    /**
     * @type {Integer} 
     */
    Msi {
        get => this.get_Msi()
    }

    /**
     * @type {Integer} 
     */
    Plessey {
        get => this.get_Plessey()
    }

    /**
     * @type {Integer} 
     */
    Telepen {
        get => this.get_Telepen()
    }

    /**
     * @type {Integer} 
     */
    Code16k {
        get => this.get_Code16k()
    }

    /**
     * @type {Integer} 
     */
    CodablockA {
        get => this.get_CodablockA()
    }

    /**
     * @type {Integer} 
     */
    CodablockF {
        get => this.get_CodablockF()
    }

    /**
     * @type {Integer} 
     */
    Codablock128 {
        get => this.get_Codablock128()
    }

    /**
     * @type {Integer} 
     */
    Code49 {
        get => this.get_Code49()
    }

    /**
     * @type {Integer} 
     */
    Aztec {
        get => this.get_Aztec()
    }

    /**
     * @type {Integer} 
     */
    DataCode {
        get => this.get_DataCode()
    }

    /**
     * @type {Integer} 
     */
    DataMatrix {
        get => this.get_DataMatrix()
    }

    /**
     * @type {Integer} 
     */
    HanXin {
        get => this.get_HanXin()
    }

    /**
     * @type {Integer} 
     */
    Maxicode {
        get => this.get_Maxicode()
    }

    /**
     * @type {Integer} 
     */
    MicroPdf417 {
        get => this.get_MicroPdf417()
    }

    /**
     * @type {Integer} 
     */
    MicroQr {
        get => this.get_MicroQr()
    }

    /**
     * @type {Integer} 
     */
    Pdf417 {
        get => this.get_Pdf417()
    }

    /**
     * @type {Integer} 
     */
    Qr {
        get => this.get_Qr()
    }

    /**
     * @type {Integer} 
     */
    MsTag {
        get => this.get_MsTag()
    }

    /**
     * @type {Integer} 
     */
    Ccab {
        get => this.get_Ccab()
    }

    /**
     * @type {Integer} 
     */
    Ccc {
        get => this.get_Ccc()
    }

    /**
     * @type {Integer} 
     */
    Tlc39 {
        get => this.get_Tlc39()
    }

    /**
     * @type {Integer} 
     */
    AusPost {
        get => this.get_AusPost()
    }

    /**
     * @type {Integer} 
     */
    CanPost {
        get => this.get_CanPost()
    }

    /**
     * @type {Integer} 
     */
    ChinaPost {
        get => this.get_ChinaPost()
    }

    /**
     * @type {Integer} 
     */
    DutchKix {
        get => this.get_DutchKix()
    }

    /**
     * @type {Integer} 
     */
    InfoMail {
        get => this.get_InfoMail()
    }

    /**
     * @type {Integer} 
     */
    ItalianPost25 {
        get => this.get_ItalianPost25()
    }

    /**
     * @type {Integer} 
     */
    ItalianPost39 {
        get => this.get_ItalianPost39()
    }

    /**
     * @type {Integer} 
     */
    JapanPost {
        get => this.get_JapanPost()
    }

    /**
     * @type {Integer} 
     */
    KoreanPost {
        get => this.get_KoreanPost()
    }

    /**
     * @type {Integer} 
     */
    SwedenPost {
        get => this.get_SwedenPost()
    }

    /**
     * @type {Integer} 
     */
    UkPost {
        get => this.get_UkPost()
    }

    /**
     * @type {Integer} 
     */
    UsIntelligent {
        get => this.get_UsIntelligent()
    }

    /**
     * @type {Integer} 
     */
    UsIntelligentPkg {
        get => this.get_UsIntelligentPkg()
    }

    /**
     * @type {Integer} 
     */
    UsPlanet {
        get => this.get_UsPlanet()
    }

    /**
     * @type {Integer} 
     */
    UsPostNet {
        get => this.get_UsPostNet()
    }

    /**
     * @type {Integer} 
     */
    Us4StateFics {
        get => this.get_Us4StateFics()
    }

    /**
     * @type {Integer} 
     */
    OcrA {
        get => this.get_OcrA()
    }

    /**
     * @type {Integer} 
     */
    OcrB {
        get => this.get_OcrB()
    }

    /**
     * @type {Integer} 
     */
    Micr {
        get => this.get_Micr()
    }

    /**
     * @type {Integer} 
     */
    ExtendedBase {
        get => this.get_ExtendedBase()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unknown() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean8() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean8Add2() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean8Add5() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Eanv() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EanvAdd2() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EanvAdd5() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean13() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean13Add2() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean13Add5() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Isbn() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsbnAdd5() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ismn() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsmnAdd2() {
        result := ComCall(19, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsmnAdd5() {
        result := ComCall(20, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Issn() {
        result := ComCall(21, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IssnAdd2() {
        result := ComCall(22, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IssnAdd5() {
        result := ComCall(23, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean99() {
        result := ComCall(24, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean99Add2() {
        result := ComCall(25, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ean99Add5() {
        result := ComCall(26, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Upca() {
        result := ComCall(27, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpcaAdd2() {
        result := ComCall(28, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpcaAdd5() {
        result := ComCall(29, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Upce() {
        result := ComCall(30, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpceAdd2() {
        result := ComCall(31, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpceAdd5() {
        result := ComCall(32, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpcCoupon() {
        result := ComCall(33, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TfStd() {
        result := ComCall(34, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TfDis() {
        result := ComCall(35, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TfInt() {
        result := ComCall(36, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TfInd() {
        result := ComCall(37, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TfMat() {
        result := ComCall(38, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TfIata() {
        result := ComCall(39, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gs1DatabarType1() {
        result := ComCall(40, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gs1DatabarType2() {
        result := ComCall(41, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gs1DatabarType3() {
        result := ComCall(42, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code39() {
        result := ComCall(43, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code39Ex() {
        result := ComCall(44, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Trioptic39() {
        result := ComCall(45, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code32() {
        result := ComCall(46, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Pzn() {
        result := ComCall(47, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code93() {
        result := ComCall(48, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code93Ex() {
        result := ComCall(49, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code128() {
        result := ComCall(50, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gs1128() {
        result := ComCall(51, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gs1128Coupon() {
        result := ComCall(52, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UccEan128() {
        result := ComCall(53, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Sisac() {
        result := ComCall(54, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Isbt() {
        result := ComCall(55, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Codabar() {
        result := ComCall(56, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code11() {
        result := ComCall(57, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Msi() {
        result := ComCall(58, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Plessey() {
        result := ComCall(59, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Telepen() {
        result := ComCall(60, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code16k() {
        result := ComCall(61, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CodablockA() {
        result := ComCall(62, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CodablockF() {
        result := ComCall(63, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Codablock128() {
        result := ComCall(64, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Code49() {
        result := ComCall(65, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Aztec() {
        result := ComCall(66, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataCode() {
        result := ComCall(67, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataMatrix() {
        result := ComCall(68, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HanXin() {
        result := ComCall(69, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Maxicode() {
        result := ComCall(70, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicroPdf417() {
        result := ComCall(71, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MicroQr() {
        result := ComCall(72, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Pdf417() {
        result := ComCall(73, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Qr() {
        result := ComCall(74, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MsTag() {
        result := ComCall(75, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ccab() {
        result := ComCall(76, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ccc() {
        result := ComCall(77, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Tlc39() {
        result := ComCall(78, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AusPost() {
        result := ComCall(79, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CanPost() {
        result := ComCall(80, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChinaPost() {
        result := ComCall(81, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DutchKix() {
        result := ComCall(82, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InfoMail() {
        result := ComCall(83, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItalianPost25() {
        result := ComCall(84, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItalianPost39() {
        result := ComCall(85, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JapanPost() {
        result := ComCall(86, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KoreanPost() {
        result := ComCall(87, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SwedenPost() {
        result := ComCall(88, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UkPost() {
        result := ComCall(89, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsIntelligent() {
        result := ComCall(90, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsIntelligentPkg() {
        result := ComCall(91, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsPlanet() {
        result := ComCall(92, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsPostNet() {
        result := ComCall(93, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Us4StateFics() {
        result := ComCall(94, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OcrA() {
        result := ComCall(95, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OcrB() {
        result := ComCall(96, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Micr() {
        result := ComCall(97, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedBase() {
        result := ComCall(98, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @param {Integer} scanDataType 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName(scanDataType) {
        value := HSTRING()
        result := ComCall(99, this, "uint", scanDataType, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
