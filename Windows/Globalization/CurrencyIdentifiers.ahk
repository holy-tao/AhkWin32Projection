#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICurrencyIdentifiersStatics.ahk
#Include .\ICurrencyIdentifiersStatics3.ahk
#Include .\ICurrencyIdentifiersStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Contains the currency identifiers for the supported currencies, as static properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class CurrencyIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * Gets the currency identifier for the United Arab Emirates Dirham.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.aed
     * @type {HSTRING} 
     */
    static AED {
        get => CurrencyIdentifiers.get_AED()
    }

    /**
     * Gets the currency identifier for the Afghan Afghani.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.afn
     * @type {HSTRING} 
     */
    static AFN {
        get => CurrencyIdentifiers.get_AFN()
    }

    /**
     * Gets the currency identifier for the Albanian Lek.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.all
     * @type {HSTRING} 
     */
    static ALL {
        get => CurrencyIdentifiers.get_ALL()
    }

    /**
     * Gets the currency identifier for the Armenian Dram.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.amd
     * @type {HSTRING} 
     */
    static AMD {
        get => CurrencyIdentifiers.get_AMD()
    }

    /**
     * Gets the currency identifier for the Netherlands Antillean Guilder.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ang
     * @type {HSTRING} 
     */
    static ANG {
        get => CurrencyIdentifiers.get_ANG()
    }

    /**
     * Gets the currency identifier for the Angolan Kwanza.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.aoa
     * @type {HSTRING} 
     */
    static AOA {
        get => CurrencyIdentifiers.get_AOA()
    }

    /**
     * Gets the currency identifier for the Argentine Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ars
     * @type {HSTRING} 
     */
    static ARS {
        get => CurrencyIdentifiers.get_ARS()
    }

    /**
     * Gets the currency identifier for the Australian Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.aud
     * @type {HSTRING} 
     */
    static AUD {
        get => CurrencyIdentifiers.get_AUD()
    }

    /**
     * Gets the currency identifier for the Aruban Florin.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.awg
     * @type {HSTRING} 
     */
    static AWG {
        get => CurrencyIdentifiers.get_AWG()
    }

    /**
     * Gets the currency identifier for the Azerbaijani Manat.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.azn
     * @type {HSTRING} 
     */
    static AZN {
        get => CurrencyIdentifiers.get_AZN()
    }

    /**
     * Gets the currency identifier for the Bosnia and Herzegovina Convertible Mark.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bam
     * @type {HSTRING} 
     */
    static BAM {
        get => CurrencyIdentifiers.get_BAM()
    }

    /**
     * Gets the currency identifier for the Barbados Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bbd
     * @type {HSTRING} 
     */
    static BBD {
        get => CurrencyIdentifiers.get_BBD()
    }

    /**
     * Gets the currency identifier for the Bangladeshi Taka.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bdt
     * @type {HSTRING} 
     */
    static BDT {
        get => CurrencyIdentifiers.get_BDT()
    }

    /**
     * Gets the currency identifier for the Bulgarian Lev.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bgn
     * @type {HSTRING} 
     */
    static BGN {
        get => CurrencyIdentifiers.get_BGN()
    }

    /**
     * Gets the currency identifier for the Bahraini Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bhd
     * @type {HSTRING} 
     */
    static BHD {
        get => CurrencyIdentifiers.get_BHD()
    }

    /**
     * Gets the currency identifier for the Burundian Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bif
     * @type {HSTRING} 
     */
    static BIF {
        get => CurrencyIdentifiers.get_BIF()
    }

    /**
     * Gets the currency identifier for the Bermuda Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bmd
     * @type {HSTRING} 
     */
    static BMD {
        get => CurrencyIdentifiers.get_BMD()
    }

    /**
     * Gets the currency identifier for the Brunei Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bnd
     * @type {HSTRING} 
     */
    static BND {
        get => CurrencyIdentifiers.get_BND()
    }

    /**
     * Gets the currency identifier for the Bolivian Boliviano.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bob
     * @type {HSTRING} 
     */
    static BOB {
        get => CurrencyIdentifiers.get_BOB()
    }

    /**
     * Gets the currency identifier for the Brazilian Real.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.brl
     * @type {HSTRING} 
     */
    static BRL {
        get => CurrencyIdentifiers.get_BRL()
    }

    /**
     * Gets the currency identifier for the Bahamian Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bsd
     * @type {HSTRING} 
     */
    static BSD {
        get => CurrencyIdentifiers.get_BSD()
    }

    /**
     * Gets the currency identifier for the Bhutanese Ngultrum.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.btn
     * @type {HSTRING} 
     */
    static BTN {
        get => CurrencyIdentifiers.get_BTN()
    }

    /**
     * Gets the currency identifier for the Botswana Pula.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bwp
     * @type {HSTRING} 
     */
    static BWP {
        get => CurrencyIdentifiers.get_BWP()
    }

    /**
     * Gets the currency identifier for the Belarusian Ruble.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.byr
     * @type {HSTRING} 
     */
    static BYR {
        get => CurrencyIdentifiers.get_BYR()
    }

    /**
     * Gets the currency identifier for the Belize Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.bzd
     * @type {HSTRING} 
     */
    static BZD {
        get => CurrencyIdentifiers.get_BZD()
    }

    /**
     * Gets the currency identifier for the Canadian Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.cad
     * @type {HSTRING} 
     */
    static CAD {
        get => CurrencyIdentifiers.get_CAD()
    }

    /**
     * Gets the currency identifier for the Congolese Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.cdf
     * @type {HSTRING} 
     */
    static CDF {
        get => CurrencyIdentifiers.get_CDF()
    }

    /**
     * Gets the currency identifier for the Swiss Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.chf
     * @type {HSTRING} 
     */
    static CHF {
        get => CurrencyIdentifiers.get_CHF()
    }

    /**
     * Gets the currency identifier for the Chilean Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.clp
     * @type {HSTRING} 
     */
    static CLP {
        get => CurrencyIdentifiers.get_CLP()
    }

    /**
     * Gets the currency identifier for the Chinese Yuan.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.cny
     * @type {HSTRING} 
     */
    static CNY {
        get => CurrencyIdentifiers.get_CNY()
    }

    /**
     * Gets the currency identifier for the Colombian Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.cop
     * @type {HSTRING} 
     */
    static COP {
        get => CurrencyIdentifiers.get_COP()
    }

    /**
     * Gets the currency identifier for the Costa Rican Colon.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.crc
     * @type {HSTRING} 
     */
    static CRC {
        get => CurrencyIdentifiers.get_CRC()
    }

    /**
     * Gets the currency identifier for the Cuban Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.cup
     * @type {HSTRING} 
     */
    static CUP {
        get => CurrencyIdentifiers.get_CUP()
    }

    /**
     * Gets the currency identifier for the Cabo Verde Escudo.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.cve
     * @type {HSTRING} 
     */
    static CVE {
        get => CurrencyIdentifiers.get_CVE()
    }

    /**
     * Gets the currency identifier for the Czech Koruna.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.czk
     * @type {HSTRING} 
     */
    static CZK {
        get => CurrencyIdentifiers.get_CZK()
    }

    /**
     * Gets the currency identifier for the Djiboutian Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.djf
     * @type {HSTRING} 
     */
    static DJF {
        get => CurrencyIdentifiers.get_DJF()
    }

    /**
     * Gets the currency identifier for the Danish Krone.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.dkk
     * @type {HSTRING} 
     */
    static DKK {
        get => CurrencyIdentifiers.get_DKK()
    }

    /**
     * Gets the currency identifier for the Dominican Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.dop
     * @type {HSTRING} 
     */
    static DOP {
        get => CurrencyIdentifiers.get_DOP()
    }

    /**
     * Gets the currency identifier for the Algerian Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.dzd
     * @type {HSTRING} 
     */
    static DZD {
        get => CurrencyIdentifiers.get_DZD()
    }

    /**
     * Gets the currency identifier for the Egyptian Pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.egp
     * @type {HSTRING} 
     */
    static EGP {
        get => CurrencyIdentifiers.get_EGP()
    }

    /**
     * Gets the currency identifier for the Eritrean Nakfa.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ern
     * @type {HSTRING} 
     */
    static ERN {
        get => CurrencyIdentifiers.get_ERN()
    }

    /**
     * Gets the currency identifier for the Ethiopian Birr.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.etb
     * @type {HSTRING} 
     */
    static ETB {
        get => CurrencyIdentifiers.get_ETB()
    }

    /**
     * Gets the currency identifier for the Euro.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.eur
     * @type {HSTRING} 
     */
    static EUR {
        get => CurrencyIdentifiers.get_EUR()
    }

    /**
     * Gets the currency identifier for the Fiji Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.fjd
     * @type {HSTRING} 
     */
    static FJD {
        get => CurrencyIdentifiers.get_FJD()
    }

    /**
     * Gets the currency identifier for the Falkland Islands Pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.fkp
     * @type {HSTRING} 
     */
    static FKP {
        get => CurrencyIdentifiers.get_FKP()
    }

    /**
     * Gets the currency identifier for the Pound Sterling.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.gbp
     * @type {HSTRING} 
     */
    static GBP {
        get => CurrencyIdentifiers.get_GBP()
    }

    /**
     * Gets the currency identifier for the Georgian Lari.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.gel
     * @type {HSTRING} 
     */
    static GEL {
        get => CurrencyIdentifiers.get_GEL()
    }

    /**
     * Gets the currency identifier for the Ghanaian Cedi.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ghs
     * @type {HSTRING} 
     */
    static GHS {
        get => CurrencyIdentifiers.get_GHS()
    }

    /**
     * Gets the currency identifier for the Gibraltar Pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.gip
     * @type {HSTRING} 
     */
    static GIP {
        get => CurrencyIdentifiers.get_GIP()
    }

    /**
     * Gets the currency identifier for the Gambian Dalasi.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.gmd
     * @type {HSTRING} 
     */
    static GMD {
        get => CurrencyIdentifiers.get_GMD()
    }

    /**
     * Gets the currency identifier for the Guinean Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.gnf
     * @type {HSTRING} 
     */
    static GNF {
        get => CurrencyIdentifiers.get_GNF()
    }

    /**
     * Gets the currency identifier for the Guatemalan Quetzal.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.gtq
     * @type {HSTRING} 
     */
    static GTQ {
        get => CurrencyIdentifiers.get_GTQ()
    }

    /**
     * Gets the currency identifier for the Guyanese Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.gyd
     * @type {HSTRING} 
     */
    static GYD {
        get => CurrencyIdentifiers.get_GYD()
    }

    /**
     * Gets the currency identifier for the Hong Kong Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.hkd
     * @type {HSTRING} 
     */
    static HKD {
        get => CurrencyIdentifiers.get_HKD()
    }

    /**
     * Gets the currency identifier for the Honduran Lempira.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.hnl
     * @type {HSTRING} 
     */
    static HNL {
        get => CurrencyIdentifiers.get_HNL()
    }

    /**
     * Gets the currency identifier for the Croatian Kuna.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.hrk
     * @type {HSTRING} 
     */
    static HRK {
        get => CurrencyIdentifiers.get_HRK()
    }

    /**
     * Gets the currency identifier for the Haitian Gourde.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.htg
     * @type {HSTRING} 
     */
    static HTG {
        get => CurrencyIdentifiers.get_HTG()
    }

    /**
     * Gets the currency identifier for the Hungarian Forint.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.huf
     * @type {HSTRING} 
     */
    static HUF {
        get => CurrencyIdentifiers.get_HUF()
    }

    /**
     * Gets the currency identifier for the Indonesian Rupiah.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.idr
     * @type {HSTRING} 
     */
    static IDR {
        get => CurrencyIdentifiers.get_IDR()
    }

    /**
     * Gets the currency identifier for the Israeli New Shekel.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ils
     * @type {HSTRING} 
     */
    static ILS {
        get => CurrencyIdentifiers.get_ILS()
    }

    /**
     * Gets the currency identifier for the Indian Rupee.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.inr
     * @type {HSTRING} 
     */
    static INR {
        get => CurrencyIdentifiers.get_INR()
    }

    /**
     * Gets the currency identifier for the Iraqi Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.iqd
     * @type {HSTRING} 
     */
    static IQD {
        get => CurrencyIdentifiers.get_IQD()
    }

    /**
     * Gets the currency identifier for the Iranian Rial.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.irr
     * @type {HSTRING} 
     */
    static IRR {
        get => CurrencyIdentifiers.get_IRR()
    }

    /**
     * Gets the currency identifier for the Icelandic Krona.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.isk
     * @type {HSTRING} 
     */
    static ISK {
        get => CurrencyIdentifiers.get_ISK()
    }

    /**
     * Gets the currency identifier for the Jamaican Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.jmd
     * @type {HSTRING} 
     */
    static JMD {
        get => CurrencyIdentifiers.get_JMD()
    }

    /**
     * Gets the currency identifier for the Jordanian Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.jod
     * @type {HSTRING} 
     */
    static JOD {
        get => CurrencyIdentifiers.get_JOD()
    }

    /**
     * Gets the currency identifier for the Japanese Yen.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.jpy
     * @type {HSTRING} 
     */
    static JPY {
        get => CurrencyIdentifiers.get_JPY()
    }

    /**
     * Gets the currency identifier for the Kenyan Shilling.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.kes
     * @type {HSTRING} 
     */
    static KES {
        get => CurrencyIdentifiers.get_KES()
    }

    /**
     * Gets the currency identifier for the Kyrgyzstani Som.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.kgs
     * @type {HSTRING} 
     */
    static KGS {
        get => CurrencyIdentifiers.get_KGS()
    }

    /**
     * Gets the currency identifier for the Cambodian Riel.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.khr
     * @type {HSTRING} 
     */
    static KHR {
        get => CurrencyIdentifiers.get_KHR()
    }

    /**
     * Gets the currency identifier for the Comorian Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.kmf
     * @type {HSTRING} 
     */
    static KMF {
        get => CurrencyIdentifiers.get_KMF()
    }

    /**
     * Gets the currency identifier for the North Korean Won.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.kpw
     * @type {HSTRING} 
     */
    static KPW {
        get => CurrencyIdentifiers.get_KPW()
    }

    /**
     * Gets the currency identifier for the Korean Won.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.krw
     * @type {HSTRING} 
     */
    static KRW {
        get => CurrencyIdentifiers.get_KRW()
    }

    /**
     * Gets the currency identifier for the Kuwaiti Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.kwd
     * @type {HSTRING} 
     */
    static KWD {
        get => CurrencyIdentifiers.get_KWD()
    }

    /**
     * Gets the currency identifier for the Cayman Islands Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.kyd
     * @type {HSTRING} 
     */
    static KYD {
        get => CurrencyIdentifiers.get_KYD()
    }

    /**
     * Gets the currency identifier for the Kazakhstani Tenge.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.kzt
     * @type {HSTRING} 
     */
    static KZT {
        get => CurrencyIdentifiers.get_KZT()
    }

    /**
     * Gets the currency identifier for the Lao Kip.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.lak
     * @type {HSTRING} 
     */
    static LAK {
        get => CurrencyIdentifiers.get_LAK()
    }

    /**
     * Gets the currency identifier for the Lebanese Pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.lbp
     * @type {HSTRING} 
     */
    static LBP {
        get => CurrencyIdentifiers.get_LBP()
    }

    /**
     * Gets the currency identifier for the Sri Lankan Rupee.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.lkr
     * @type {HSTRING} 
     */
    static LKR {
        get => CurrencyIdentifiers.get_LKR()
    }

    /**
     * Gets the currency identifier for the Liberian Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.lrd
     * @type {HSTRING} 
     */
    static LRD {
        get => CurrencyIdentifiers.get_LRD()
    }

    /**
     * Gets the currency identifier for the Lesotho Loti.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.lsl
     * @type {HSTRING} 
     */
    static LSL {
        get => CurrencyIdentifiers.get_LSL()
    }

    /**
     * Gets the currency identifier for the Lithuanian Litas.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ltl
     * @type {HSTRING} 
     */
    static LTL {
        get => CurrencyIdentifiers.get_LTL()
    }

    /**
     * Gets the currency identifier for the Latvian Lats.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.lvl
     * @type {HSTRING} 
     */
    static LVL {
        get => CurrencyIdentifiers.get_LVL()
    }

    /**
     * Gets the currency identifier for the Libyan Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.lyd
     * @type {HSTRING} 
     */
    static LYD {
        get => CurrencyIdentifiers.get_LYD()
    }

    /**
     * Gets the currency identifier for the Moroccan Dirham.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mad
     * @type {HSTRING} 
     */
    static MAD {
        get => CurrencyIdentifiers.get_MAD()
    }

    /**
     * Gets the currency identifier for the Moldovan Leu.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mdl
     * @type {HSTRING} 
     */
    static MDL {
        get => CurrencyIdentifiers.get_MDL()
    }

    /**
     * Gets the currency identifier for the Malagasy Ariary.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mga
     * @type {HSTRING} 
     */
    static MGA {
        get => CurrencyIdentifiers.get_MGA()
    }

    /**
     * Gets the currency identifier for the Republic of North Macedonia Denar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mkd
     * @type {HSTRING} 
     */
    static MKD {
        get => CurrencyIdentifiers.get_MKD()
    }

    /**
     * Gets the currency identifier for the Myanmar Kyat.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mmk
     * @type {HSTRING} 
     */
    static MMK {
        get => CurrencyIdentifiers.get_MMK()
    }

    /**
     * Gets the currency identifier for the Mongolian Tugrik.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mnt
     * @type {HSTRING} 
     */
    static MNT {
        get => CurrencyIdentifiers.get_MNT()
    }

    /**
     * Gets the currency identifier for the Macao SAR Pataca.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mop
     * @type {HSTRING} 
     */
    static MOP {
        get => CurrencyIdentifiers.get_MOP()
    }

    /**
     * Gets the currency identifier for the Mauritania Ouguiya.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mro
     * @type {HSTRING} 
     */
    static MRO {
        get => CurrencyIdentifiers.get_MRO()
    }

    /**
     * Gets the currency identifier for the Mauritian Rupee.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mur
     * @type {HSTRING} 
     */
    static MUR {
        get => CurrencyIdentifiers.get_MUR()
    }

    /**
     * Gets the currency identifier for the Maldives Rufiyaa.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mvr
     * @type {HSTRING} 
     */
    static MVR {
        get => CurrencyIdentifiers.get_MVR()
    }

    /**
     * Gets the currency identifier for the Malawian Kwacha.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mwk
     * @type {HSTRING} 
     */
    static MWK {
        get => CurrencyIdentifiers.get_MWK()
    }

    /**
     * Gets the currency identifier for the Mexican Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mxn
     * @type {HSTRING} 
     */
    static MXN {
        get => CurrencyIdentifiers.get_MXN()
    }

    /**
     * Gets the currency identifier for the Malaysian Ringgit.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.myr
     * @type {HSTRING} 
     */
    static MYR {
        get => CurrencyIdentifiers.get_MYR()
    }

    /**
     * Gets the currency identifier for the New Mozambican Metical.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mzn
     * @type {HSTRING} 
     */
    static MZN {
        get => CurrencyIdentifiers.get_MZN()
    }

    /**
     * Gets the currency identifier for the Namibian Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.nad
     * @type {HSTRING} 
     */
    static NAD {
        get => CurrencyIdentifiers.get_NAD()
    }

    /**
     * Gets the currency identifier for the Nigerian Naira.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ngn
     * @type {HSTRING} 
     */
    static NGN {
        get => CurrencyIdentifiers.get_NGN()
    }

    /**
     * Gets the currency identifier for the Nicaraguan Cordoba Oro.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.nio
     * @type {HSTRING} 
     */
    static NIO {
        get => CurrencyIdentifiers.get_NIO()
    }

    /**
     * Gets the currency identifier for the Norwegian Krone.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.nok
     * @type {HSTRING} 
     */
    static NOK {
        get => CurrencyIdentifiers.get_NOK()
    }

    /**
     * Gets the currency identifier for the Nepalese Rupee.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.npr
     * @type {HSTRING} 
     */
    static NPR {
        get => CurrencyIdentifiers.get_NPR()
    }

    /**
     * Gets the currency identifier for the New Zealand Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.nzd
     * @type {HSTRING} 
     */
    static NZD {
        get => CurrencyIdentifiers.get_NZD()
    }

    /**
     * Gets the currency identifier for the Omani Rial.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.omr
     * @type {HSTRING} 
     */
    static OMR {
        get => CurrencyIdentifiers.get_OMR()
    }

    /**
     * Gets the currency identifier for the Panamanian Balboa.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.pab
     * @type {HSTRING} 
     */
    static PAB {
        get => CurrencyIdentifiers.get_PAB()
    }

    /**
     * Gets the currency identifier for the Peruvian Nuevo Sol.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.pen
     * @type {HSTRING} 
     */
    static PEN {
        get => CurrencyIdentifiers.get_PEN()
    }

    /**
     * Gets the currency identifier for the Papua New Guinea Kina.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.pgk
     * @type {HSTRING} 
     */
    static PGK {
        get => CurrencyIdentifiers.get_PGK()
    }

    /**
     * Gets the currency identifier for the Philippine Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.php
     * @type {HSTRING} 
     */
    static PHP {
        get => CurrencyIdentifiers.get_PHP()
    }

    /**
     * Gets the currency identifier for the Pakistan Rupee.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.pkr
     * @type {HSTRING} 
     */
    static PKR {
        get => CurrencyIdentifiers.get_PKR()
    }

    /**
     * Gets the currency identifier for the Polish Zloty.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.pln
     * @type {HSTRING} 
     */
    static PLN {
        get => CurrencyIdentifiers.get_PLN()
    }

    /**
     * Gets the currency identifier for the Paraguay Guarani.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.pyg
     * @type {HSTRING} 
     */
    static PYG {
        get => CurrencyIdentifiers.get_PYG()
    }

    /**
     * Gets the currency identifier for the Qatari Riyal.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.qar
     * @type {HSTRING} 
     */
    static QAR {
        get => CurrencyIdentifiers.get_QAR()
    }

    /**
     * Gets the currency identifier for the Romanian Leu.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ron
     * @type {HSTRING} 
     */
    static RON {
        get => CurrencyIdentifiers.get_RON()
    }

    /**
     * Gets the currency identifier for the Serbian Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.rsd
     * @type {HSTRING} 
     */
    static RSD {
        get => CurrencyIdentifiers.get_RSD()
    }

    /**
     * Gets the currency identifier for the Russian Ruble.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.rub
     * @type {HSTRING} 
     */
    static RUB {
        get => CurrencyIdentifiers.get_RUB()
    }

    /**
     * Gets the currency identifier for the Rwandan Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.rwf
     * @type {HSTRING} 
     */
    static RWF {
        get => CurrencyIdentifiers.get_RWF()
    }

    /**
     * Gets the currency identifier for the Saudi Arabian Riyal.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.sar
     * @type {HSTRING} 
     */
    static SAR {
        get => CurrencyIdentifiers.get_SAR()
    }

    /**
     * Gets the currency identifier for the Solomon Islands Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.sbd
     * @type {HSTRING} 
     */
    static SBD {
        get => CurrencyIdentifiers.get_SBD()
    }

    /**
     * Gets the currency identifier for the Seychelles Rupee.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.scr
     * @type {HSTRING} 
     */
    static SCR {
        get => CurrencyIdentifiers.get_SCR()
    }

    /**
     * Gets the currency identifier for the Sudanese Pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.sdg
     * @type {HSTRING} 
     */
    static SDG {
        get => CurrencyIdentifiers.get_SDG()
    }

    /**
     * Gets the currency identifier for the Swedish Krona.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.sek
     * @type {HSTRING} 
     */
    static SEK {
        get => CurrencyIdentifiers.get_SEK()
    }

    /**
     * Gets the currency identifier for the Singapore Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.sgd
     * @type {HSTRING} 
     */
    static SGD {
        get => CurrencyIdentifiers.get_SGD()
    }

    /**
     * Gets the currency identifier for the Saint Helena Pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.shp
     * @type {HSTRING} 
     */
    static SHP {
        get => CurrencyIdentifiers.get_SHP()
    }

    /**
     * Gets the currency identifier for the Sierra Leone Leone.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.sll
     * @type {HSTRING} 
     */
    static SLL {
        get => CurrencyIdentifiers.get_SLL()
    }

    /**
     * Gets the currency identifier for the Somali Shilling.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.sos
     * @type {HSTRING} 
     */
    static SOS {
        get => CurrencyIdentifiers.get_SOS()
    }

    /**
     * Gets the currency identifier for the Suriname Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.srd
     * @type {HSTRING} 
     */
    static SRD {
        get => CurrencyIdentifiers.get_SRD()
    }

    /**
     * Gets the currency identifier for the Sao Tome Dobra.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.std
     * @type {HSTRING} 
     */
    static STD {
        get => CurrencyIdentifiers.get_STD()
    }

    /**
     * Gets the currency identifier for the Syrian Pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.syp
     * @type {HSTRING} 
     */
    static SYP {
        get => CurrencyIdentifiers.get_SYP()
    }

    /**
     * Gets the currency identifier for the Swazi Lilangeni.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.szl
     * @type {HSTRING} 
     */
    static SZL {
        get => CurrencyIdentifiers.get_SZL()
    }

    /**
     * Gets the currency identifier for the Thai Baht.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.thb
     * @type {HSTRING} 
     */
    static THB {
        get => CurrencyIdentifiers.get_THB()
    }

    /**
     * Gets the currency identifier for the Tajikistani Somoni.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.tjs
     * @type {HSTRING} 
     */
    static TJS {
        get => CurrencyIdentifiers.get_TJS()
    }

    /**
     * Gets the currency identifier for the Turkmenistan Manat.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.tmt
     * @type {HSTRING} 
     */
    static TMT {
        get => CurrencyIdentifiers.get_TMT()
    }

    /**
     * Gets the currency identifier for the Tunisian Dinar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.tnd
     * @type {HSTRING} 
     */
    static TND {
        get => CurrencyIdentifiers.get_TND()
    }

    /**
     * Gets the currency identifier for the Tongan Pa'Anga.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.top
     * @type {HSTRING} 
     */
    static TOP {
        get => CurrencyIdentifiers.get_TOP()
    }

    /**
     * Gets the currency identifier for the Turkish Lira.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.try
     * @type {HSTRING} 
     */
    static TRY {
        get => CurrencyIdentifiers.get_TRY()
    }

    /**
     * Gets the currency identifier for the Trinidad and Tobago Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ttd
     * @type {HSTRING} 
     */
    static TTD {
        get => CurrencyIdentifiers.get_TTD()
    }

    /**
     * Gets the currency identifier for the New Taiwan Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.twd
     * @type {HSTRING} 
     */
    static TWD {
        get => CurrencyIdentifiers.get_TWD()
    }

    /**
     * Gets the currency identifier for the Tanzanian Shilling.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.tzs
     * @type {HSTRING} 
     */
    static TZS {
        get => CurrencyIdentifiers.get_TZS()
    }

    /**
     * Gets the currency identifier for the Ukrainian Hryvnia.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.uah
     * @type {HSTRING} 
     */
    static UAH {
        get => CurrencyIdentifiers.get_UAH()
    }

    /**
     * Gets the currency identifier for the Uganda Shilling.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ugx
     * @type {HSTRING} 
     */
    static UGX {
        get => CurrencyIdentifiers.get_UGX()
    }

    /**
     * Gets the currency identifier for the United States Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.usd
     * @type {HSTRING} 
     */
    static USD {
        get => CurrencyIdentifiers.get_USD()
    }

    /**
     * Gets the currency identifier for the Uruguayan Peso.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.uyu
     * @type {HSTRING} 
     */
    static UYU {
        get => CurrencyIdentifiers.get_UYU()
    }

    /**
     * Gets the currency identifier for the Uzbekistani Som.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.uzs
     * @type {HSTRING} 
     */
    static UZS {
        get => CurrencyIdentifiers.get_UZS()
    }

    /**
     * Gets the currency identifier for the Venezuelan Bolivar Fuerte.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.vef
     * @type {HSTRING} 
     */
    static VEF {
        get => CurrencyIdentifiers.get_VEF()
    }

    /**
     * Gets the currency identifier for the Viet Nam Dong.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.vnd
     * @type {HSTRING} 
     */
    static VND {
        get => CurrencyIdentifiers.get_VND()
    }

    /**
     * Gets the currency identifier for the Vanuatu Vatu.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.vuv
     * @type {HSTRING} 
     */
    static VUV {
        get => CurrencyIdentifiers.get_VUV()
    }

    /**
     * Gets the currency identifier for the Samoan Tala.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.wst
     * @type {HSTRING} 
     */
    static WST {
        get => CurrencyIdentifiers.get_WST()
    }

    /**
     * Gets the currency identifier for the Central African CFA.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.xaf
     * @type {HSTRING} 
     */
    static XAF {
        get => CurrencyIdentifiers.get_XAF()
    }

    /**
     * Gets the currency identifier for the East Caribbean Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.xcd
     * @type {HSTRING} 
     */
    static XCD {
        get => CurrencyIdentifiers.get_XCD()
    }

    /**
     * Gets the currency identifier for the West African CFA.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.xof
     * @type {HSTRING} 
     */
    static XOF {
        get => CurrencyIdentifiers.get_XOF()
    }

    /**
     * Gets the currency identifier for the French Pacific Franc.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.xpf
     * @type {HSTRING} 
     */
    static XPF {
        get => CurrencyIdentifiers.get_XPF()
    }

    /**
     * Gets the currency identifier that represents no currency.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.xxx
     * @type {HSTRING} 
     */
    static XXX {
        get => CurrencyIdentifiers.get_XXX()
    }

    /**
     * Gets the currency identifier for the Yemeni Rial.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.yer
     * @type {HSTRING} 
     */
    static YER {
        get => CurrencyIdentifiers.get_YER()
    }

    /**
     * Gets the currency identifier for the South African Rand.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.zar
     * @type {HSTRING} 
     */
    static ZAR {
        get => CurrencyIdentifiers.get_ZAR()
    }

    /**
     * Gets the currency identifier for the Zambian Kwacha.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.zmw
     * @type {HSTRING} 
     */
    static ZMW {
        get => CurrencyIdentifiers.get_ZMW()
    }

    /**
     * Gets the currency identifier for the Zimbabwean Dollar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.zwl
     * @type {HSTRING} 
     */
    static ZWL {
        get => CurrencyIdentifiers.get_ZWL()
    }

    /**
     * Gets the currency identifier for the Mauritanian ouguiya.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.mru
     * @type {HSTRING} 
     */
    static MRU {
        get => CurrencyIdentifiers.get_MRU()
    }

    /**
     * Gets the currency identifier for the South Sudanese pound.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ssp
     * @type {HSTRING} 
     */
    static SSP {
        get => CurrencyIdentifiers.get_SSP()
    }

    /**
     * Gets the currency identifier for the São Tomé and Príncipe dobra.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.stn
     * @type {HSTRING} 
     */
    static STN {
        get => CurrencyIdentifiers.get_STN()
    }

    /**
     * Gets the currency identifier for the Venezuelan bolívar.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.ves
     * @type {HSTRING} 
     */
    static VES {
        get => CurrencyIdentifiers.get_VES()
    }

    /**
     * Gets the currency identifier for the Belarusian Ruble.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyidentifiers.byn
     * @type {HSTRING} 
     */
    static BYN {
        get => CurrencyIdentifiers.get_BYN()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AED() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_AED()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AFN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_AFN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ALL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ALL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AMD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_AMD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ANG() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ANG()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AOA() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_AOA()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ARS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ARS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AUD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_AUD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AWG() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_AWG()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AZN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_AZN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BAM() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BAM()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BBD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BBD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BDT() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BDT()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BGN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BGN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BHD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BHD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BIF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BIF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BMD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BMD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BND() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BND()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BOB() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BOB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BRL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BRL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BSD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BSD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BTN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BTN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BWP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BWP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BYR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BYR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BZD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_BZD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CAD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CAD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CDF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CDF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CHF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CHF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CLP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CLP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CNY() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CNY()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_COP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_COP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CRC() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CRC()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CUP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CUP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CVE() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CVE()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CZK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_CZK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DJF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_DJF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DKK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_DKK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DOP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_DOP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DZD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_DZD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EGP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_EGP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ERN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ERN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ETB() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ETB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EUR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_EUR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FJD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_FJD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FKP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_FKP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GBP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GBP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GEL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GEL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GHS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GHS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GIP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GIP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GMD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GMD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GNF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GNF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GTQ() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GTQ()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GYD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_GYD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HKD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_HKD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HNL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_HNL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HRK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_HRK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HTG() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_HTG()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HUF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_HUF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IDR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_IDR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ILS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ILS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_INR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_INR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IQD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_IQD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IRR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_IRR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ISK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ISK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_JMD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_JMD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_JOD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_JOD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_JPY() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_JPY()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KES() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KES()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KGS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KGS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KHR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KHR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KMF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KMF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KPW() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KPW()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KRW() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KRW()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KWD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KWD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KYD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KYD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_KZT() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_KZT()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LAK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LAK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LBP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LBP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LKR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LKR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LRD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LRD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LSL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LSL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LTL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LTL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LVL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LVL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LYD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_LYD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MAD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MAD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MDL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MDL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MGA() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MGA()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MKD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MKD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MMK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MMK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MNT() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MNT()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MOP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MOP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MRO() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MRO()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MUR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MUR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MVR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MVR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MWK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MWK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MXN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MXN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MYR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MYR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MZN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_MZN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NAD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_NAD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NGN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_NGN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NIO() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_NIO()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NOK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_NOK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NPR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_NPR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NZD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_NZD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_OMR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_OMR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PAB() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_PAB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PEN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_PEN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PGK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_PGK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PHP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_PHP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PKR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_PKR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PLN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_PLN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PYG() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_PYG()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_QAR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_QAR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RON() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_RON()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RSD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_RSD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RUB() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_RUB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RWF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_RWF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SAR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SAR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SBD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SBD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SCR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SCR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SDG() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SDG()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SEK() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SEK()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SGD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SGD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SHP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SHP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SLL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SLL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SOS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SOS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SRD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SRD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_STD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_STD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SYP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SYP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SZL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_SZL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_THB() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_THB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TJS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TJS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TMT() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TMT()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TND() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TND()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TOP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TOP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TRY() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TRY()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TTD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TTD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TWD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TWD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TZS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_TZS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UAH() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_UAH()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UGX() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_UGX()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_USD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_USD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UYU() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_UYU()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UZS() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_UZS()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VEF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_VEF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VND() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_VND()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VUV() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_VUV()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WST() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_WST()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_XAF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_XAF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_XCD() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_XCD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_XOF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_XOF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_XPF() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_XPF()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_XXX() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_XXX()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_YER() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_YER()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZAR() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ZAR()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZMW() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ZMW()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZWL() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics := ICurrencyIdentifiersStatics(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics.get_ZWL()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MRU() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics3.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics3 := ICurrencyIdentifiersStatics3(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics3.get_MRU()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SSP() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics3.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics3 := ICurrencyIdentifiersStatics3(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics3.get_SSP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_STN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics3.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics3 := ICurrencyIdentifiersStatics3(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics3.get_STN()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VES() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics3.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics3 := ICurrencyIdentifiersStatics3(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics3.get_VES()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BYN() {
        if (!CurrencyIdentifiers.HasProp("__ICurrencyIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyIdentifiersStatics2.IID)
            CurrencyIdentifiers.__ICurrencyIdentifiersStatics2 := ICurrencyIdentifiersStatics2(factoryPtr)
        }

        return CurrencyIdentifiers.__ICurrencyIdentifiersStatics2.get_BYN()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
