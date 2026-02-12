#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ICurrencyIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrencyIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{9f1d091b-d586-4913-9b6a-a9bd2dc12874}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AED", "get_AFN", "get_ALL", "get_AMD", "get_ANG", "get_AOA", "get_ARS", "get_AUD", "get_AWG", "get_AZN", "get_BAM", "get_BBD", "get_BDT", "get_BGN", "get_BHD", "get_BIF", "get_BMD", "get_BND", "get_BOB", "get_BRL", "get_BSD", "get_BTN", "get_BWP", "get_BYR", "get_BZD", "get_CAD", "get_CDF", "get_CHF", "get_CLP", "get_CNY", "get_COP", "get_CRC", "get_CUP", "get_CVE", "get_CZK", "get_DJF", "get_DKK", "get_DOP", "get_DZD", "get_EGP", "get_ERN", "get_ETB", "get_EUR", "get_FJD", "get_FKP", "get_GBP", "get_GEL", "get_GHS", "get_GIP", "get_GMD", "get_GNF", "get_GTQ", "get_GYD", "get_HKD", "get_HNL", "get_HRK", "get_HTG", "get_HUF", "get_IDR", "get_ILS", "get_INR", "get_IQD", "get_IRR", "get_ISK", "get_JMD", "get_JOD", "get_JPY", "get_KES", "get_KGS", "get_KHR", "get_KMF", "get_KPW", "get_KRW", "get_KWD", "get_KYD", "get_KZT", "get_LAK", "get_LBP", "get_LKR", "get_LRD", "get_LSL", "get_LTL", "get_LVL", "get_LYD", "get_MAD", "get_MDL", "get_MGA", "get_MKD", "get_MMK", "get_MNT", "get_MOP", "get_MRO", "get_MUR", "get_MVR", "get_MWK", "get_MXN", "get_MYR", "get_MZN", "get_NAD", "get_NGN", "get_NIO", "get_NOK", "get_NPR", "get_NZD", "get_OMR", "get_PAB", "get_PEN", "get_PGK", "get_PHP", "get_PKR", "get_PLN", "get_PYG", "get_QAR", "get_RON", "get_RSD", "get_RUB", "get_RWF", "get_SAR", "get_SBD", "get_SCR", "get_SDG", "get_SEK", "get_SGD", "get_SHP", "get_SLL", "get_SOS", "get_SRD", "get_STD", "get_SYP", "get_SZL", "get_THB", "get_TJS", "get_TMT", "get_TND", "get_TOP", "get_TRY", "get_TTD", "get_TWD", "get_TZS", "get_UAH", "get_UGX", "get_USD", "get_UYU", "get_UZS", "get_VEF", "get_VND", "get_VUV", "get_WST", "get_XAF", "get_XCD", "get_XOF", "get_XPF", "get_XXX", "get_YER", "get_ZAR", "get_ZMW", "get_ZWL"]

    /**
     * @type {HSTRING} 
     */
    AED {
        get => this.get_AED()
    }

    /**
     * @type {HSTRING} 
     */
    AFN {
        get => this.get_AFN()
    }

    /**
     * @type {HSTRING} 
     */
    ALL {
        get => this.get_ALL()
    }

    /**
     * @type {HSTRING} 
     */
    AMD {
        get => this.get_AMD()
    }

    /**
     * @type {HSTRING} 
     */
    ANG {
        get => this.get_ANG()
    }

    /**
     * @type {HSTRING} 
     */
    AOA {
        get => this.get_AOA()
    }

    /**
     * @type {HSTRING} 
     */
    ARS {
        get => this.get_ARS()
    }

    /**
     * @type {HSTRING} 
     */
    AUD {
        get => this.get_AUD()
    }

    /**
     * @type {HSTRING} 
     */
    AWG {
        get => this.get_AWG()
    }

    /**
     * @type {HSTRING} 
     */
    AZN {
        get => this.get_AZN()
    }

    /**
     * @type {HSTRING} 
     */
    BAM {
        get => this.get_BAM()
    }

    /**
     * @type {HSTRING} 
     */
    BBD {
        get => this.get_BBD()
    }

    /**
     * @type {HSTRING} 
     */
    BDT {
        get => this.get_BDT()
    }

    /**
     * @type {HSTRING} 
     */
    BGN {
        get => this.get_BGN()
    }

    /**
     * @type {HSTRING} 
     */
    BHD {
        get => this.get_BHD()
    }

    /**
     * @type {HSTRING} 
     */
    BIF {
        get => this.get_BIF()
    }

    /**
     * @type {HSTRING} 
     */
    BMD {
        get => this.get_BMD()
    }

    /**
     * @type {HSTRING} 
     */
    BND {
        get => this.get_BND()
    }

    /**
     * @type {HSTRING} 
     */
    BOB {
        get => this.get_BOB()
    }

    /**
     * @type {HSTRING} 
     */
    BRL {
        get => this.get_BRL()
    }

    /**
     * @type {HSTRING} 
     */
    BSD {
        get => this.get_BSD()
    }

    /**
     * @type {HSTRING} 
     */
    BTN {
        get => this.get_BTN()
    }

    /**
     * @type {HSTRING} 
     */
    BWP {
        get => this.get_BWP()
    }

    /**
     * @type {HSTRING} 
     */
    BYR {
        get => this.get_BYR()
    }

    /**
     * @type {HSTRING} 
     */
    BZD {
        get => this.get_BZD()
    }

    /**
     * @type {HSTRING} 
     */
    CAD {
        get => this.get_CAD()
    }

    /**
     * @type {HSTRING} 
     */
    CDF {
        get => this.get_CDF()
    }

    /**
     * @type {HSTRING} 
     */
    CHF {
        get => this.get_CHF()
    }

    /**
     * @type {HSTRING} 
     */
    CLP {
        get => this.get_CLP()
    }

    /**
     * @type {HSTRING} 
     */
    CNY {
        get => this.get_CNY()
    }

    /**
     * @type {HSTRING} 
     */
    COP {
        get => this.get_COP()
    }

    /**
     * @type {HSTRING} 
     */
    CRC {
        get => this.get_CRC()
    }

    /**
     * @type {HSTRING} 
     */
    CUP {
        get => this.get_CUP()
    }

    /**
     * @type {HSTRING} 
     */
    CVE {
        get => this.get_CVE()
    }

    /**
     * @type {HSTRING} 
     */
    CZK {
        get => this.get_CZK()
    }

    /**
     * @type {HSTRING} 
     */
    DJF {
        get => this.get_DJF()
    }

    /**
     * @type {HSTRING} 
     */
    DKK {
        get => this.get_DKK()
    }

    /**
     * @type {HSTRING} 
     */
    DOP {
        get => this.get_DOP()
    }

    /**
     * @type {HSTRING} 
     */
    DZD {
        get => this.get_DZD()
    }

    /**
     * @type {HSTRING} 
     */
    EGP {
        get => this.get_EGP()
    }

    /**
     * @type {HSTRING} 
     */
    ERN {
        get => this.get_ERN()
    }

    /**
     * @type {HSTRING} 
     */
    ETB {
        get => this.get_ETB()
    }

    /**
     * @type {HSTRING} 
     */
    EUR {
        get => this.get_EUR()
    }

    /**
     * @type {HSTRING} 
     */
    FJD {
        get => this.get_FJD()
    }

    /**
     * @type {HSTRING} 
     */
    FKP {
        get => this.get_FKP()
    }

    /**
     * @type {HSTRING} 
     */
    GBP {
        get => this.get_GBP()
    }

    /**
     * @type {HSTRING} 
     */
    GEL {
        get => this.get_GEL()
    }

    /**
     * @type {HSTRING} 
     */
    GHS {
        get => this.get_GHS()
    }

    /**
     * @type {HSTRING} 
     */
    GIP {
        get => this.get_GIP()
    }

    /**
     * @type {HSTRING} 
     */
    GMD {
        get => this.get_GMD()
    }

    /**
     * @type {HSTRING} 
     */
    GNF {
        get => this.get_GNF()
    }

    /**
     * @type {HSTRING} 
     */
    GTQ {
        get => this.get_GTQ()
    }

    /**
     * @type {HSTRING} 
     */
    GYD {
        get => this.get_GYD()
    }

    /**
     * @type {HSTRING} 
     */
    HKD {
        get => this.get_HKD()
    }

    /**
     * @type {HSTRING} 
     */
    HNL {
        get => this.get_HNL()
    }

    /**
     * @type {HSTRING} 
     */
    HRK {
        get => this.get_HRK()
    }

    /**
     * @type {HSTRING} 
     */
    HTG {
        get => this.get_HTG()
    }

    /**
     * @type {HSTRING} 
     */
    HUF {
        get => this.get_HUF()
    }

    /**
     * @type {HSTRING} 
     */
    IDR {
        get => this.get_IDR()
    }

    /**
     * @type {HSTRING} 
     */
    ILS {
        get => this.get_ILS()
    }

    /**
     * @type {HSTRING} 
     */
    INR {
        get => this.get_INR()
    }

    /**
     * @type {HSTRING} 
     */
    IQD {
        get => this.get_IQD()
    }

    /**
     * @type {HSTRING} 
     */
    IRR {
        get => this.get_IRR()
    }

    /**
     * @type {HSTRING} 
     */
    ISK {
        get => this.get_ISK()
    }

    /**
     * @type {HSTRING} 
     */
    JMD {
        get => this.get_JMD()
    }

    /**
     * @type {HSTRING} 
     */
    JOD {
        get => this.get_JOD()
    }

    /**
     * @type {HSTRING} 
     */
    JPY {
        get => this.get_JPY()
    }

    /**
     * @type {HSTRING} 
     */
    KES {
        get => this.get_KES()
    }

    /**
     * @type {HSTRING} 
     */
    KGS {
        get => this.get_KGS()
    }

    /**
     * @type {HSTRING} 
     */
    KHR {
        get => this.get_KHR()
    }

    /**
     * @type {HSTRING} 
     */
    KMF {
        get => this.get_KMF()
    }

    /**
     * @type {HSTRING} 
     */
    KPW {
        get => this.get_KPW()
    }

    /**
     * @type {HSTRING} 
     */
    KRW {
        get => this.get_KRW()
    }

    /**
     * @type {HSTRING} 
     */
    KWD {
        get => this.get_KWD()
    }

    /**
     * @type {HSTRING} 
     */
    KYD {
        get => this.get_KYD()
    }

    /**
     * @type {HSTRING} 
     */
    KZT {
        get => this.get_KZT()
    }

    /**
     * @type {HSTRING} 
     */
    LAK {
        get => this.get_LAK()
    }

    /**
     * @type {HSTRING} 
     */
    LBP {
        get => this.get_LBP()
    }

    /**
     * @type {HSTRING} 
     */
    LKR {
        get => this.get_LKR()
    }

    /**
     * @type {HSTRING} 
     */
    LRD {
        get => this.get_LRD()
    }

    /**
     * @type {HSTRING} 
     */
    LSL {
        get => this.get_LSL()
    }

    /**
     * @type {HSTRING} 
     */
    LTL {
        get => this.get_LTL()
    }

    /**
     * @type {HSTRING} 
     */
    LVL {
        get => this.get_LVL()
    }

    /**
     * @type {HSTRING} 
     */
    LYD {
        get => this.get_LYD()
    }

    /**
     * @type {HSTRING} 
     */
    MAD {
        get => this.get_MAD()
    }

    /**
     * @type {HSTRING} 
     */
    MDL {
        get => this.get_MDL()
    }

    /**
     * @type {HSTRING} 
     */
    MGA {
        get => this.get_MGA()
    }

    /**
     * @type {HSTRING} 
     */
    MKD {
        get => this.get_MKD()
    }

    /**
     * @type {HSTRING} 
     */
    MMK {
        get => this.get_MMK()
    }

    /**
     * @type {HSTRING} 
     */
    MNT {
        get => this.get_MNT()
    }

    /**
     * @type {HSTRING} 
     */
    MOP {
        get => this.get_MOP()
    }

    /**
     * @type {HSTRING} 
     */
    MRO {
        get => this.get_MRO()
    }

    /**
     * @type {HSTRING} 
     */
    MUR {
        get => this.get_MUR()
    }

    /**
     * @type {HSTRING} 
     */
    MVR {
        get => this.get_MVR()
    }

    /**
     * @type {HSTRING} 
     */
    MWK {
        get => this.get_MWK()
    }

    /**
     * @type {HSTRING} 
     */
    MXN {
        get => this.get_MXN()
    }

    /**
     * @type {HSTRING} 
     */
    MYR {
        get => this.get_MYR()
    }

    /**
     * @type {HSTRING} 
     */
    MZN {
        get => this.get_MZN()
    }

    /**
     * @type {HSTRING} 
     */
    NAD {
        get => this.get_NAD()
    }

    /**
     * @type {HSTRING} 
     */
    NGN {
        get => this.get_NGN()
    }

    /**
     * @type {HSTRING} 
     */
    NIO {
        get => this.get_NIO()
    }

    /**
     * @type {HSTRING} 
     */
    NOK {
        get => this.get_NOK()
    }

    /**
     * @type {HSTRING} 
     */
    NPR {
        get => this.get_NPR()
    }

    /**
     * @type {HSTRING} 
     */
    NZD {
        get => this.get_NZD()
    }

    /**
     * @type {HSTRING} 
     */
    OMR {
        get => this.get_OMR()
    }

    /**
     * @type {HSTRING} 
     */
    PAB {
        get => this.get_PAB()
    }

    /**
     * @type {HSTRING} 
     */
    PEN {
        get => this.get_PEN()
    }

    /**
     * @type {HSTRING} 
     */
    PGK {
        get => this.get_PGK()
    }

    /**
     * @type {HSTRING} 
     */
    PHP {
        get => this.get_PHP()
    }

    /**
     * @type {HSTRING} 
     */
    PKR {
        get => this.get_PKR()
    }

    /**
     * @type {HSTRING} 
     */
    PLN {
        get => this.get_PLN()
    }

    /**
     * @type {HSTRING} 
     */
    PYG {
        get => this.get_PYG()
    }

    /**
     * @type {HSTRING} 
     */
    QAR {
        get => this.get_QAR()
    }

    /**
     * @type {HSTRING} 
     */
    RON {
        get => this.get_RON()
    }

    /**
     * @type {HSTRING} 
     */
    RSD {
        get => this.get_RSD()
    }

    /**
     * @type {HSTRING} 
     */
    RUB {
        get => this.get_RUB()
    }

    /**
     * @type {HSTRING} 
     */
    RWF {
        get => this.get_RWF()
    }

    /**
     * @type {HSTRING} 
     */
    SAR {
        get => this.get_SAR()
    }

    /**
     * @type {HSTRING} 
     */
    SBD {
        get => this.get_SBD()
    }

    /**
     * @type {HSTRING} 
     */
    SCR {
        get => this.get_SCR()
    }

    /**
     * @type {HSTRING} 
     */
    SDG {
        get => this.get_SDG()
    }

    /**
     * @type {HSTRING} 
     */
    SEK {
        get => this.get_SEK()
    }

    /**
     * @type {HSTRING} 
     */
    SGD {
        get => this.get_SGD()
    }

    /**
     * @type {HSTRING} 
     */
    SHP {
        get => this.get_SHP()
    }

    /**
     * @type {HSTRING} 
     */
    SLL {
        get => this.get_SLL()
    }

    /**
     * @type {HSTRING} 
     */
    SOS {
        get => this.get_SOS()
    }

    /**
     * @type {HSTRING} 
     */
    SRD {
        get => this.get_SRD()
    }

    /**
     * @type {HSTRING} 
     */
    STD {
        get => this.get_STD()
    }

    /**
     * @type {HSTRING} 
     */
    SYP {
        get => this.get_SYP()
    }

    /**
     * @type {HSTRING} 
     */
    SZL {
        get => this.get_SZL()
    }

    /**
     * @type {HSTRING} 
     */
    THB {
        get => this.get_THB()
    }

    /**
     * @type {HSTRING} 
     */
    TJS {
        get => this.get_TJS()
    }

    /**
     * @type {HSTRING} 
     */
    TMT {
        get => this.get_TMT()
    }

    /**
     * @type {HSTRING} 
     */
    TND {
        get => this.get_TND()
    }

    /**
     * @type {HSTRING} 
     */
    TOP {
        get => this.get_TOP()
    }

    /**
     * @type {HSTRING} 
     */
    TRY {
        get => this.get_TRY()
    }

    /**
     * @type {HSTRING} 
     */
    TTD {
        get => this.get_TTD()
    }

    /**
     * @type {HSTRING} 
     */
    TWD {
        get => this.get_TWD()
    }

    /**
     * @type {HSTRING} 
     */
    TZS {
        get => this.get_TZS()
    }

    /**
     * @type {HSTRING} 
     */
    UAH {
        get => this.get_UAH()
    }

    /**
     * @type {HSTRING} 
     */
    UGX {
        get => this.get_UGX()
    }

    /**
     * @type {HSTRING} 
     */
    USD {
        get => this.get_USD()
    }

    /**
     * @type {HSTRING} 
     */
    UYU {
        get => this.get_UYU()
    }

    /**
     * @type {HSTRING} 
     */
    UZS {
        get => this.get_UZS()
    }

    /**
     * @type {HSTRING} 
     */
    VEF {
        get => this.get_VEF()
    }

    /**
     * @type {HSTRING} 
     */
    VND {
        get => this.get_VND()
    }

    /**
     * @type {HSTRING} 
     */
    VUV {
        get => this.get_VUV()
    }

    /**
     * @type {HSTRING} 
     */
    WST {
        get => this.get_WST()
    }

    /**
     * @type {HSTRING} 
     */
    XAF {
        get => this.get_XAF()
    }

    /**
     * @type {HSTRING} 
     */
    XCD {
        get => this.get_XCD()
    }

    /**
     * @type {HSTRING} 
     */
    XOF {
        get => this.get_XOF()
    }

    /**
     * @type {HSTRING} 
     */
    XPF {
        get => this.get_XPF()
    }

    /**
     * @type {HSTRING} 
     */
    XXX {
        get => this.get_XXX()
    }

    /**
     * @type {HSTRING} 
     */
    YER {
        get => this.get_YER()
    }

    /**
     * @type {HSTRING} 
     */
    ZAR {
        get => this.get_ZAR()
    }

    /**
     * @type {HSTRING} 
     */
    ZMW {
        get => this.get_ZMW()
    }

    /**
     * @type {HSTRING} 
     */
    ZWL {
        get => this.get_ZWL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AED() {
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
    get_AFN() {
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
    get_ALL() {
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
    get_AMD() {
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
    get_ANG() {
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
    get_AOA() {
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
    get_ARS() {
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
    get_AUD() {
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
    get_AWG() {
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
    get_AZN() {
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
    get_BAM() {
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
    get_BBD() {
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
    get_BDT() {
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
    get_BGN() {
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
    get_BHD() {
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
    get_BIF() {
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
    get_BMD() {
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
    get_BND() {
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
    get_BOB() {
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
    get_BRL() {
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
    get_BSD() {
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
    get_BTN() {
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
    get_BWP() {
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
    get_BYR() {
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
    get_BZD() {
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
    get_CAD() {
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
    get_CDF() {
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
    get_CHF() {
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
    get_CLP() {
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
    get_CNY() {
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
    get_COP() {
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
    get_CRC() {
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
    get_CUP() {
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
    get_CVE() {
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
    get_CZK() {
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
    get_DJF() {
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
    get_DKK() {
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
    get_DOP() {
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
    get_DZD() {
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
    get_EGP() {
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
    get_ERN() {
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
    get_ETB() {
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
    get_EUR() {
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
    get_FJD() {
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
    get_FKP() {
        value := HSTRING()
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GBP() {
        value := HSTRING()
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GEL() {
        value := HSTRING()
        result := ComCall(52, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GHS() {
        value := HSTRING()
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GIP() {
        value := HSTRING()
        result := ComCall(54, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GMD() {
        value := HSTRING()
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GNF() {
        value := HSTRING()
        result := ComCall(56, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GTQ() {
        value := HSTRING()
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GYD() {
        value := HSTRING()
        result := ComCall(58, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HKD() {
        value := HSTRING()
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HNL() {
        value := HSTRING()
        result := ComCall(60, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HRK() {
        value := HSTRING()
        result := ComCall(61, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HTG() {
        value := HSTRING()
        result := ComCall(62, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HUF() {
        value := HSTRING()
        result := ComCall(63, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IDR() {
        value := HSTRING()
        result := ComCall(64, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ILS() {
        value := HSTRING()
        result := ComCall(65, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_INR() {
        value := HSTRING()
        result := ComCall(66, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IQD() {
        value := HSTRING()
        result := ComCall(67, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IRR() {
        value := HSTRING()
        result := ComCall(68, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ISK() {
        value := HSTRING()
        result := ComCall(69, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JMD() {
        value := HSTRING()
        result := ComCall(70, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JOD() {
        value := HSTRING()
        result := ComCall(71, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JPY() {
        value := HSTRING()
        result := ComCall(72, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KES() {
        value := HSTRING()
        result := ComCall(73, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KGS() {
        value := HSTRING()
        result := ComCall(74, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KHR() {
        value := HSTRING()
        result := ComCall(75, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KMF() {
        value := HSTRING()
        result := ComCall(76, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KPW() {
        value := HSTRING()
        result := ComCall(77, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KRW() {
        value := HSTRING()
        result := ComCall(78, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KWD() {
        value := HSTRING()
        result := ComCall(79, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KYD() {
        value := HSTRING()
        result := ComCall(80, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KZT() {
        value := HSTRING()
        result := ComCall(81, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LAK() {
        value := HSTRING()
        result := ComCall(82, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LBP() {
        value := HSTRING()
        result := ComCall(83, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LKR() {
        value := HSTRING()
        result := ComCall(84, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LRD() {
        value := HSTRING()
        result := ComCall(85, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LSL() {
        value := HSTRING()
        result := ComCall(86, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LTL() {
        value := HSTRING()
        result := ComCall(87, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LVL() {
        value := HSTRING()
        result := ComCall(88, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LYD() {
        value := HSTRING()
        result := ComCall(89, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MAD() {
        value := HSTRING()
        result := ComCall(90, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MDL() {
        value := HSTRING()
        result := ComCall(91, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MGA() {
        value := HSTRING()
        result := ComCall(92, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MKD() {
        value := HSTRING()
        result := ComCall(93, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MMK() {
        value := HSTRING()
        result := ComCall(94, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MNT() {
        value := HSTRING()
        result := ComCall(95, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MOP() {
        value := HSTRING()
        result := ComCall(96, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MRO() {
        value := HSTRING()
        result := ComCall(97, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MUR() {
        value := HSTRING()
        result := ComCall(98, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MVR() {
        value := HSTRING()
        result := ComCall(99, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MWK() {
        value := HSTRING()
        result := ComCall(100, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MXN() {
        value := HSTRING()
        result := ComCall(101, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MYR() {
        value := HSTRING()
        result := ComCall(102, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MZN() {
        value := HSTRING()
        result := ComCall(103, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NAD() {
        value := HSTRING()
        result := ComCall(104, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NGN() {
        value := HSTRING()
        result := ComCall(105, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NIO() {
        value := HSTRING()
        result := ComCall(106, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NOK() {
        value := HSTRING()
        result := ComCall(107, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NPR() {
        value := HSTRING()
        result := ComCall(108, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NZD() {
        value := HSTRING()
        result := ComCall(109, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OMR() {
        value := HSTRING()
        result := ComCall(110, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PAB() {
        value := HSTRING()
        result := ComCall(111, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PEN() {
        value := HSTRING()
        result := ComCall(112, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PGK() {
        value := HSTRING()
        result := ComCall(113, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PHP() {
        value := HSTRING()
        result := ComCall(114, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PKR() {
        value := HSTRING()
        result := ComCall(115, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PLN() {
        value := HSTRING()
        result := ComCall(116, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PYG() {
        value := HSTRING()
        result := ComCall(117, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QAR() {
        value := HSTRING()
        result := ComCall(118, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RON() {
        value := HSTRING()
        result := ComCall(119, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RSD() {
        value := HSTRING()
        result := ComCall(120, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RUB() {
        value := HSTRING()
        result := ComCall(121, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RWF() {
        value := HSTRING()
        result := ComCall(122, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SAR() {
        value := HSTRING()
        result := ComCall(123, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SBD() {
        value := HSTRING()
        result := ComCall(124, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SCR() {
        value := HSTRING()
        result := ComCall(125, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SDG() {
        value := HSTRING()
        result := ComCall(126, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SEK() {
        value := HSTRING()
        result := ComCall(127, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SGD() {
        value := HSTRING()
        result := ComCall(128, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SHP() {
        value := HSTRING()
        result := ComCall(129, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SLL() {
        value := HSTRING()
        result := ComCall(130, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SOS() {
        value := HSTRING()
        result := ComCall(131, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SRD() {
        value := HSTRING()
        result := ComCall(132, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_STD() {
        value := HSTRING()
        result := ComCall(133, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SYP() {
        value := HSTRING()
        result := ComCall(134, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SZL() {
        value := HSTRING()
        result := ComCall(135, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_THB() {
        value := HSTRING()
        result := ComCall(136, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TJS() {
        value := HSTRING()
        result := ComCall(137, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TMT() {
        value := HSTRING()
        result := ComCall(138, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TND() {
        value := HSTRING()
        result := ComCall(139, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TOP() {
        value := HSTRING()
        result := ComCall(140, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TRY() {
        value := HSTRING()
        result := ComCall(141, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TTD() {
        value := HSTRING()
        result := ComCall(142, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TWD() {
        value := HSTRING()
        result := ComCall(143, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TZS() {
        value := HSTRING()
        result := ComCall(144, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UAH() {
        value := HSTRING()
        result := ComCall(145, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UGX() {
        value := HSTRING()
        result := ComCall(146, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_USD() {
        value := HSTRING()
        result := ComCall(147, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UYU() {
        value := HSTRING()
        result := ComCall(148, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UZS() {
        value := HSTRING()
        result := ComCall(149, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VEF() {
        value := HSTRING()
        result := ComCall(150, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VND() {
        value := HSTRING()
        result := ComCall(151, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VUV() {
        value := HSTRING()
        result := ComCall(152, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WST() {
        value := HSTRING()
        result := ComCall(153, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XAF() {
        value := HSTRING()
        result := ComCall(154, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XCD() {
        value := HSTRING()
        result := ComCall(155, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XOF() {
        value := HSTRING()
        result := ComCall(156, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XPF() {
        value := HSTRING()
        result := ComCall(157, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XXX() {
        value := HSTRING()
        result := ComCall(158, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YER() {
        value := HSTRING()
        result := ComCall(159, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ZAR() {
        value := HSTRING()
        result := ComCall(160, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ZMW() {
        value := HSTRING()
        result := ComCall(161, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ZWL() {
        value := HSTRING()
        result := ComCall(162, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
