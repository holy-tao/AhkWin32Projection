#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeSymbologiesStatics2.ahk
#Include .\IBarcodeSymbologiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the barcode symbology.
 * @remarks
 * This is a static class that contains the barcode symbologies.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeSymbologies extends IInspectable {
;@region Static Properties
    /**
     * Gets the GS1DWCode barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.gs1dwcode
     * @type {Integer} 
     */
    static Gs1DWCode {
        get => BarcodeSymbologies.get_Gs1DWCode()
    }

    /**
     * Unknown barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.unknown
     * @type {Integer} 
     */
    static Unknown {
        get => BarcodeSymbologies.get_Unknown()
    }

    /**
     * Gets the EAN 8 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean8
     * @type {Integer} 
     */
    static Ean8 {
        get => BarcodeSymbologies.get_Ean8()
    }

    /**
     * Gets the EAN 8 with 2 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean8add2
     * @type {Integer} 
     */
    static Ean8Add2 {
        get => BarcodeSymbologies.get_Ean8Add2()
    }

    /**
     * Gets the EAN 8 with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean8add5
     * @type {Integer} 
     */
    static Ean8Add5 {
        get => BarcodeSymbologies.get_Ean8Add5()
    }

    /**
     * Gets the EAN Velocity barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.eanv
     * @type {Integer} 
     */
    static Eanv {
        get => BarcodeSymbologies.get_Eanv()
    }

    /**
     * Gets the EAN Velocity with 2 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.eanvadd2
     * @type {Integer} 
     */
    static EanvAdd2 {
        get => BarcodeSymbologies.get_EanvAdd2()
    }

    /**
     * Gets the EAN Velocity with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.eanvadd5
     * @type {Integer} 
     */
    static EanvAdd5 {
        get => BarcodeSymbologies.get_EanvAdd5()
    }

    /**
     * Gets the EAN (European Article Number) 13 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean13
     * @type {Integer} 
     */
    static Ean13 {
        get => BarcodeSymbologies.get_Ean13()
    }

    /**
     * Gets the EAN 13 with 2 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean13add2
     * @type {Integer} 
     */
    static Ean13Add2 {
        get => BarcodeSymbologies.get_Ean13Add2()
    }

    /**
     * Gets the EAN 13 with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean13add5
     * @type {Integer} 
     */
    static Ean13Add5 {
        get => BarcodeSymbologies.get_Ean13Add5()
    }

    /**
     * Gets the International Standard Book Number (ISBN), also known as Bookland or Bookland EAN, barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.isbn
     * @type {Integer} 
     */
    static Isbn {
        get => BarcodeSymbologies.get_Isbn()
    }

    /**
     * Gets the ISBN with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.isbnadd5
     * @type {Integer} 
     */
    static IsbnAdd5 {
        get => BarcodeSymbologies.get_IsbnAdd5()
    }

    /**
     * Gets the International Standard Music Number (ISMN) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ismn
     * @type {Integer} 
     */
    static Ismn {
        get => BarcodeSymbologies.get_Ismn()
    }

    /**
     * Gets the ISMN with 2 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ismnadd2
     * @type {Integer} 
     */
    static IsmnAdd2 {
        get => BarcodeSymbologies.get_IsmnAdd2()
    }

    /**
     * Gets the ISMN with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ismnadd5
     * @type {Integer} 
     */
    static IsmnAdd5 {
        get => BarcodeSymbologies.get_IsmnAdd5()
    }

    /**
     * Gets the International Standard Serial Number (ISSN) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.issn
     * @type {Integer} 
     */
    static Issn {
        get => BarcodeSymbologies.get_Issn()
    }

    /**
     * Gets the ISSN with 2 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.issnadd2
     * @type {Integer} 
     */
    static IssnAdd2 {
        get => BarcodeSymbologies.get_IssnAdd2()
    }

    /**
     * Gets the ISSN with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.issnadd5
     * @type {Integer} 
     */
    static IssnAdd5 {
        get => BarcodeSymbologies.get_IssnAdd5()
    }

    /**
     * Gets the EAN 99 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean99
     * @type {Integer} 
     */
    static Ean99 {
        get => BarcodeSymbologies.get_Ean99()
    }

    /**
     * Gets the EAN 99 with 2 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean99add2
     * @type {Integer} 
     */
    static Ean99Add2 {
        get => BarcodeSymbologies.get_Ean99Add2()
    }

    /**
     * Gets the EAN 99 with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ean99add5
     * @type {Integer} 
     */
    static Ean99Add5 {
        get => BarcodeSymbologies.get_Ean99Add5()
    }

    /**
     * Gets the Universal Product Code (UPC) version A barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.upca
     * @type {Integer} 
     */
    static Upca {
        get => BarcodeSymbologies.get_Upca()
    }

    /**
     * Gets the UPC A with 2 digit supplemental barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.upcaadd2
     * @type {Integer} 
     */
    static UpcaAdd2 {
        get => BarcodeSymbologies.get_UpcaAdd2()
    }

    /**
     * Gets the UPC A with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.upcaadd5
     * @type {Integer} 
     */
    static UpcaAdd5 {
        get => BarcodeSymbologies.get_UpcaAdd5()
    }

    /**
     * Gets the Universal Product Code (UPC) version E barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.upce
     * @type {Integer} 
     */
    static Upce {
        get => BarcodeSymbologies.get_Upce()
    }

    /**
     * Gets the UPC-E with 2 digit supplemnent barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.upceadd2
     * @type {Integer} 
     */
    static UpceAdd2 {
        get => BarcodeSymbologies.get_UpceAdd2()
    }

    /**
     * Gets the UPC-E with 5 digit supplement barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.upceadd5
     * @type {Integer} 
     */
    static UpceAdd5 {
        get => BarcodeSymbologies.get_UpceAdd5()
    }

    /**
     * Gets the UPC Coupon with supplemental barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.upccoupon
     * @type {Integer} 
     */
    static UpcCoupon {
        get => BarcodeSymbologies.get_UpcCoupon()
    }

    /**
     * Gets the Standard 2 of 5 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.tfstd
     * @type {Integer} 
     */
    static TfStd {
        get => BarcodeSymbologies.get_TfStd()
    }

    /**
     * Gets the Discreet 2 of 5 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.tfdis
     * @type {Integer} 
     */
    static TfDis {
        get => BarcodeSymbologies.get_TfDis()
    }

    /**
     * Gets the Interleaved 2 of 5 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.tfint
     * @type {Integer} 
     */
    static TfInt {
        get => BarcodeSymbologies.get_TfInt()
    }

    /**
     * Gets the Industrial 2 of 5 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.tfind
     * @type {Integer} 
     */
    static TfInd {
        get => BarcodeSymbologies.get_TfInd()
    }

    /**
     * Gets the 2 of 5 Matrix barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.tfmat
     * @type {Integer} 
     */
    static TfMat {
        get => BarcodeSymbologies.get_TfMat()
    }

    /**
     * Gets the 2 of 5 International Air Transportation Association (IATA) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.tfiata
     * @type {Integer} 
     */
    static TfIata {
        get => BarcodeSymbologies.get_TfIata()
    }

    /**
     * Gets the GS1 Databar Omnidirectional, GS1 Databar Stacked Omnidirectional, GS1 Databar Stacked, or GS1 Databar Truncated barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.gs1databartype1
     * @type {Integer} 
     */
    static Gs1DatabarType1 {
        get => BarcodeSymbologies.get_Gs1DatabarType1()
    }

    /**
     * Gets the GS1 DataBar Limited or RSS Limited barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.gs1databartype2
     * @type {Integer} 
     */
    static Gs1DatabarType2 {
        get => BarcodeSymbologies.get_Gs1DatabarType2()
    }

    /**
     * Gets the GS1 Databar Expanded, GS1 Databar Expanded Stacked, or RSS Expanded barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.gs1databartype3
     * @type {Integer} 
     */
    static Gs1DatabarType3 {
        get => BarcodeSymbologies.get_Gs1DatabarType3()
    }

    /**
     * Gets the Code 39 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code39
     * @type {Integer} 
     */
    static Code39 {
        get => BarcodeSymbologies.get_Code39()
    }

    /**
     * Gets the Code 39 Extended barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code39ex
     * @type {Integer} 
     */
    static Code39Ex {
        get => BarcodeSymbologies.get_Code39Ex()
    }

    /**
     * Gets the Tri-Optic Media Storage Devices barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.trioptic39
     * @type {Integer} 
     */
    static Trioptic39 {
        get => BarcodeSymbologies.get_Trioptic39()
    }

    /**
     * Gets the Code 32 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code32
     * @type {Integer} 
     */
    static Code32 {
        get => BarcodeSymbologies.get_Code32()
    }

    /**
     * Gets the Pharma-Zentral-Nummer (Pzn) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.pzn
     * @type {Integer} 
     */
    static Pzn {
        get => BarcodeSymbologies.get_Pzn()
    }

    /**
     * Gets the Code 93 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code93
     * @type {Integer} 
     */
    static Code93 {
        get => BarcodeSymbologies.get_Code93()
    }

    /**
     * Gets the Code 93 Extended barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code93ex
     * @type {Integer} 
     */
    static Code93Ex {
        get => BarcodeSymbologies.get_Code93Ex()
    }

    /**
     * Gets the Code 128 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code128
     * @type {Integer} 
     */
    static Code128 {
        get => BarcodeSymbologies.get_Code128()
    }

    /**
     * Gets the GS1 128 shipping container barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.gs1128
     * @type {Integer} 
     */
    static Gs1128 {
        get => BarcodeSymbologies.get_Gs1128()
    }

    /**
     * Gets the GS1 128 Coupon barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.gs1128coupon
     * @type {Integer} 
     */
    static Gs1128Coupon {
        get => BarcodeSymbologies.get_Gs1128Coupon()
    }

    /**
     * Gets the UCC/EAN 128 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.uccean128
     * @type {Integer} 
     */
    static UccEan128 {
        get => BarcodeSymbologies.get_UccEan128()
    }

    /**
     * Gets the Serials Industry Systems Advisory Committee (SISAC) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.sisac
     * @type {Integer} 
     */
    static Sisac {
        get => BarcodeSymbologies.get_Sisac()
    }

    /**
     * Gets the International Society of Blood Transfusion (ISBT) 128 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.isbt
     * @type {Integer} 
     */
    static Isbt {
        get => BarcodeSymbologies.get_Isbt()
    }

    /**
     * Gets the Codabar barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.codabar
     * @type {Integer} 
     */
    static Codabar {
        get => BarcodeSymbologies.get_Codabar()
    }

    /**
     * Gets the Code 11 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code11
     * @type {Integer} 
     */
    static Code11 {
        get => BarcodeSymbologies.get_Code11()
    }

    /**
     * Gets the MSI barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.msi
     * @type {Integer} 
     */
    static Msi {
        get => BarcodeSymbologies.get_Msi()
    }

    /**
     * Gets the Plessey barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.plessey
     * @type {Integer} 
     */
    static Plessey {
        get => BarcodeSymbologies.get_Plessey()
    }

    /**
     * Gets the Telepen barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.telepen
     * @type {Integer} 
     */
    static Telepen {
        get => BarcodeSymbologies.get_Telepen()
    }

    /**
     * Gets the Code 16k barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code16k
     * @type {Integer} 
     */
    static Code16k {
        get => BarcodeSymbologies.get_Code16k()
    }

    /**
     * Gets the Codablock A barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.codablocka
     * @type {Integer} 
     */
    static CodablockA {
        get => BarcodeSymbologies.get_CodablockA()
    }

    /**
     * Gets the Codablock F barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.codablockf
     * @type {Integer} 
     */
    static CodablockF {
        get => BarcodeSymbologies.get_CodablockF()
    }

    /**
     * Gets the Codablock 128 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.codablock128
     * @type {Integer} 
     */
    static Codablock128 {
        get => BarcodeSymbologies.get_Codablock128()
    }

    /**
     * Gets the Code 49 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.code49
     * @type {Integer} 
     */
    static Code49 {
        get => BarcodeSymbologies.get_Code49()
    }

    /**
     * Gets the Aztec barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.aztec
     * @type {Integer} 
     */
    static Aztec {
        get => BarcodeSymbologies.get_Aztec()
    }

    /**
     * Gets the Data Code barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.datacode
     * @type {Integer} 
     */
    static DataCode {
        get => BarcodeSymbologies.get_DataCode()
    }

    /**
     * Gets the Data Matric barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.datamatrix
     * @type {Integer} 
     */
    static DataMatrix {
        get => BarcodeSymbologies.get_DataMatrix()
    }

    /**
     * Gets the Han Xin barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.hanxin
     * @type {Integer} 
     */
    static HanXin {
        get => BarcodeSymbologies.get_HanXin()
    }

    /**
     * Gets the MaxiCode barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.maxicode
     * @type {Integer} 
     */
    static Maxicode {
        get => BarcodeSymbologies.get_Maxicode()
    }

    /**
     * Gets the Micro PDF 417 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.micropdf417
     * @type {Integer} 
     */
    static MicroPdf417 {
        get => BarcodeSymbologies.get_MicroPdf417()
    }

    /**
     * Gets the Micro QR Code barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.microqr
     * @type {Integer} 
     */
    static MicroQr {
        get => BarcodeSymbologies.get_MicroQr()
    }

    /**
     * Gets the PDF 417 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.pdf417
     * @type {Integer} 
     */
    static Pdf417 {
        get => BarcodeSymbologies.get_Pdf417()
    }

    /**
     * Gets the Quick Response (QR) Code barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.qr
     * @type {Integer} 
     */
    static Qr {
        get => BarcodeSymbologies.get_Qr()
    }

    /**
     * Gets the Microsoft tag barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.mstag
     * @type {Integer} 
     */
    static MsTag {
        get => BarcodeSymbologies.get_MsTag()
    }

    /**
     * Gets the Composite Component A or B barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ccab
     * @type {Integer} 
     */
    static Ccab {
        get => BarcodeSymbologies.get_Ccab()
    }

    /**
     * Gets the Composite Component-C barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ccc
     * @type {Integer} 
     */
    static Ccc {
        get => BarcodeSymbologies.get_Ccc()
    }

    /**
     * Gets the TLC 39 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.tlc39
     * @type {Integer} 
     */
    static Tlc39 {
        get => BarcodeSymbologies.get_Tlc39()
    }

    /**
     * Gets the Australia Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.auspost
     * @type {Integer} 
     */
    static AusPost {
        get => BarcodeSymbologies.get_AusPost()
    }

    /**
     * Gets the Canada Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.canpost
     * @type {Integer} 
     */
    static CanPost {
        get => BarcodeSymbologies.get_CanPost()
    }

    /**
     * Gets the China Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.chinapost
     * @type {Integer} 
     */
    static ChinaPost {
        get => BarcodeSymbologies.get_ChinaPost()
    }

    /**
     * Gets the Dutch Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.dutchkix
     * @type {Integer} 
     */
    static DutchKix {
        get => BarcodeSymbologies.get_DutchKix()
    }

    /**
     * Gets the InfoMail barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.infomail
     * @type {Integer} 
     */
    static InfoMail {
        get => BarcodeSymbologies.get_InfoMail()
    }

    /**
     * Gets the Italian Post 25 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.italianpost25
     * @type {Integer} 
     */
    static ItalianPost25 {
        get => BarcodeSymbologies.get_ItalianPost25()
    }

    /**
     * Gets the Italian Post 39 barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.italianpost39
     * @type {Integer} 
     */
    static ItalianPost39 {
        get => BarcodeSymbologies.get_ItalianPost39()
    }

    /**
     * Gets the Japan Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.japanpost
     * @type {Integer} 
     */
    static JapanPost {
        get => BarcodeSymbologies.get_JapanPost()
    }

    /**
     * Gets the Korea Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.koreanpost
     * @type {Integer} 
     */
    static KoreanPost {
        get => BarcodeSymbologies.get_KoreanPost()
    }

    /**
     * Gets the Sweden Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.swedenpost
     * @type {Integer} 
     */
    static SwedenPost {
        get => BarcodeSymbologies.get_SwedenPost()
    }

    /**
     * Gets the UK Postal barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ukpost
     * @type {Integer} 
     */
    static UkPost {
        get => BarcodeSymbologies.get_UkPost()
    }

    /**
     * Gets the United States Postal Service (USPS) Intelligent Mail barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.usintelligent
     * @type {Integer} 
     */
    static UsIntelligent {
        get => BarcodeSymbologies.get_UsIntelligent()
    }

    /**
     * Gets the United States Postal Service (USPS) Intelligent Mail Package barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.usintelligentpkg
     * @type {Integer} 
     */
    static UsIntelligentPkg {
        get => BarcodeSymbologies.get_UsIntelligentPkg()
    }

    /**
     * Gets the United States Postal Service PLANET barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.usplanet
     * @type {Integer} 
     */
    static UsPlanet {
        get => BarcodeSymbologies.get_UsPlanet()
    }

    /**
     * Gets the United States Postal Numeric Encoding Technique (POSTNET) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.uspostnet
     * @type {Integer} 
     */
    static UsPostNet {
        get => BarcodeSymbologies.get_UsPostNet()
    }

    /**
     * Gets the United States Postal Service 4-State Flat Mail Identification Code Sort (FICS) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.us4statefics
     * @type {Integer} 
     */
    static Us4StateFics {
        get => BarcodeSymbologies.get_Us4StateFics()
    }

    /**
     * Gets the OCR-A barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ocra
     * @type {Integer} 
     */
    static OcrA {
        get => BarcodeSymbologies.get_OcrA()
    }

    /**
     * Gets the OCR-B barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.ocrb
     * @type {Integer} 
     */
    static OcrB {
        get => BarcodeSymbologies.get_OcrB()
    }

    /**
     * Gets the Magnetic Ink Character Recognition (MICR) barcode symbology.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.micr
     * @type {Integer} 
     */
    static Micr {
        get => BarcodeSymbologies.get_Micr()
    }

    /**
     * Gets the first possible OEM defined barcode symbology when the symbology type is not included in the current list.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.extendedbase
     * @type {Integer} 
     */
    static ExtendedBase {
        get => BarcodeSymbologies.get_ExtendedBase()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Gs1DWCode() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics2.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics2 := IBarcodeSymbologiesStatics2(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics2.get_Gs1DWCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Unknown() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Unknown()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean8() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean8Add2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean8Add2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean8Add5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean8Add5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Eanv() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Eanv()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_EanvAdd2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_EanvAdd2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_EanvAdd5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_EanvAdd5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean13() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean13()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean13Add2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean13Add2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean13Add5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean13Add5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Isbn() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Isbn()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IsbnAdd5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_IsbnAdd5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ismn() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ismn()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IsmnAdd2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_IsmnAdd2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IsmnAdd5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_IsmnAdd5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Issn() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Issn()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IssnAdd2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_IssnAdd2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_IssnAdd5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_IssnAdd5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean99() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean99()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean99Add2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean99Add2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ean99Add5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ean99Add5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Upca() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Upca()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UpcaAdd2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UpcaAdd2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UpcaAdd5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UpcaAdd5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Upce() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Upce()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UpceAdd2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UpceAdd2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UpceAdd5() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UpceAdd5()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UpcCoupon() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UpcCoupon()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TfStd() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_TfStd()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TfDis() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_TfDis()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TfInt() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_TfInt()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TfInd() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_TfInd()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TfMat() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_TfMat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TfIata() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_TfIata()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Gs1DatabarType1() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Gs1DatabarType1()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Gs1DatabarType2() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Gs1DatabarType2()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Gs1DatabarType3() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Gs1DatabarType3()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code39() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code39()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code39Ex() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code39Ex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Trioptic39() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Trioptic39()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code32() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code32()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Pzn() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Pzn()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code93() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code93()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code93Ex() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code93Ex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code128() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code128()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Gs1128() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Gs1128()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Gs1128Coupon() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Gs1128Coupon()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UccEan128() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UccEan128()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Sisac() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Sisac()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Isbt() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Isbt()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Codabar() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Codabar()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code11() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code11()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Msi() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Msi()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Plessey() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Plessey()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Telepen() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Telepen()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code16k() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code16k()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CodablockA() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_CodablockA()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CodablockF() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_CodablockF()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Codablock128() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Codablock128()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Code49() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Code49()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Aztec() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Aztec()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DataCode() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_DataCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DataMatrix() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_DataMatrix()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_HanXin() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_HanXin()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Maxicode() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Maxicode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MicroPdf417() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_MicroPdf417()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MicroQr() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_MicroQr()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Pdf417() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Pdf417()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Qr() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Qr()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MsTag() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_MsTag()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ccab() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ccab()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Ccc() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Ccc()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Tlc39() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Tlc39()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AusPost() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_AusPost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CanPost() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_CanPost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ChinaPost() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_ChinaPost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DutchKix() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_DutchKix()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InfoMail() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_InfoMail()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ItalianPost25() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_ItalianPost25()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ItalianPost39() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_ItalianPost39()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_JapanPost() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_JapanPost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_KoreanPost() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_KoreanPost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SwedenPost() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_SwedenPost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UkPost() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UkPost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UsIntelligent() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UsIntelligent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UsIntelligentPkg() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UsIntelligentPkg()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UsPlanet() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UsPlanet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UsPostNet() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_UsPostNet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Us4StateFics() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Us4StateFics()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_OcrA() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_OcrA()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_OcrB() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_OcrB()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Micr() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_Micr()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ExtendedBase() {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.get_ExtendedBase()
    }

    /**
     * Returns the barcode symbology type as a string.
     * @param {Integer} scanDataType The barcode symbology type.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodesymbologies.getname
     */
    static GetName(scanDataType) {
        if (!BarcodeSymbologies.HasProp("__IBarcodeSymbologiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeSymbologies")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeSymbologiesStatics.IID)
            BarcodeSymbologies.__IBarcodeSymbologiesStatics := IBarcodeSymbologiesStatics(factoryPtr)
        }

        return BarcodeSymbologies.__IBarcodeSymbologiesStatics.GetName(scanDataType)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
