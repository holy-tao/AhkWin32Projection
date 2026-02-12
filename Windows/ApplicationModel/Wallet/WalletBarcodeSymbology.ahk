#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents the barcode symbology types that are supported for a [WalletItem](walletitem.md).
 * @remarks
 * Each value other than **Invalid** and **Custom** enables creation of the barcode image by the system, when you call [GetImageAsync](walletbarcode_getimageasync_1312294964.md). For symbologies that aren't in this enumeration, use the [WalletBarcode(IRandomAccessStreamReference)](walletbarcode_walletbarcode_199548425.md) constructor and provide your own image.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletbarcodesymbology
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletBarcodeSymbology extends Win32Enum{

    /**
     * Invalid barcode type.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Uses the **UPC-A** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Upca => 1

    /**
     * Uses the **UPC-E** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Upce => 2

    /**
     * Uses the **EAN-13** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Ean13 => 3

    /**
     * Uses the **EAN-8** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Ean8 => 4

    /**
     * Uses the **ITF** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Itf => 5

    /**
     * Uses the **Code 39** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Code39 => 6

    /**
     * Uses the **Code 128** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Code128 => 7

    /**
     * Uses the **QR Code** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Qr => 8

    /**
     * Uses the **PDF417** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Pdf417 => 9

    /**
     * Uses the **Aztec** barcode symbology.
     * @type {Integer (Int32)}
     */
    static Aztec => 10

    /**
     * Uses a custom bar code symbology.
     * @type {Integer (Int32)}
     */
    static Custom => 100000
}
