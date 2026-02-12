#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletBarcode.ahk
#Include .\IWalletBarcodeFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents a bar code assigned to a wallet item.
 * @remarks
 * Use [WalletBarcode(WalletBarcodeSymbology, String)](walletbarcode_walletbarcode_30902746.md) to construct a scheme-generated barcode image (which is realized when you call [GetImageAsync](walletbarcode_getimageasync_1312294964.md)). Use [WalletBarcode(IRandomAccessStreamReference)](walletbarcode_walletbarcode_199548425.md) to construct a barcode that you supply the image for.
 * 
 * The WalletBarcode class provides the value for the [WalletItem.Barcode](walletitem_barcode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletbarcode
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletBarcode extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletBarcode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletBarcode.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Initializes a new instance of the [WalletBarcode](walletbarcode.md) class.
     * @param {Integer} symbology The symbology type for this barcode. Use one of the supported symbologies, such as **Upca**. Don't set to **Invalid** or **Custom**.
     * @param {HSTRING} value The message ([Value](walletbarcode_value.md)) that the barcode represents.
     * @returns {WalletBarcode} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletbarcode.#ctor
     */
    static CreateWalletBarcode(symbology, value) {
        if (!WalletBarcode.HasProp("__IWalletBarcodeFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletBarcode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWalletBarcodeFactory.IID)
            WalletBarcode.__IWalletBarcodeFactory := IWalletBarcodeFactory(factoryPtr)
        }

        return WalletBarcode.__IWalletBarcodeFactory.CreateWalletBarcode(symbology, value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Initializes a new instance of the [WalletBarcode](walletbarcode.md) class.
     * @param {IRandomAccessStreamReference} streamToBarcodeImage A stream representing the bar code image.
     * @returns {WalletBarcode} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletbarcode.#ctor
     */
    static CreateCustomWalletBarcode(streamToBarcodeImage) {
        if (!WalletBarcode.HasProp("__IWalletBarcodeFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletBarcode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWalletBarcodeFactory.IID)
            WalletBarcode.__IWalletBarcodeFactory := IWalletBarcodeFactory(factoryPtr)
        }

        return WalletBarcode.__IWalletBarcodeFactory.CreateCustomWalletBarcode(streamToBarcodeImage)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets the [symbology](walletbarcodesymbology.md) used by the bar code.
     * @remarks
     * A *symbology* is the convention that defines the mapping between barcodes and the messages they represent. Barcodes for wallet items support several of the most common barcode symbologies, as defined by the values in [WalletBarcodeSymbology](walletbarcodesymbology.md). For other symbologies, you can provide your own barcode image (construct using [WalletBarcode(IRandomAccessStreamReference)](walletbarcode_walletbarcode_199548425.md)).
     * <!--in that case, is value Custom? Or Invalid? -->
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletbarcode.symbology
     * @type {Integer} 
     */
    Symbology {
        get => this.get_Symbology()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets a string representation of the barcode (its message).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletbarcode.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Symbology() {
        if (!this.HasProp("__IWalletBarcode")) {
            if ((queryResult := this.QueryInterface(IWalletBarcode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletBarcode := IWalletBarcode(outPtr)
        }

        return this.__IWalletBarcode.get_Symbology()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IWalletBarcode")) {
            if ((queryResult := this.QueryInterface(IWalletBarcode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletBarcode := IWalletBarcode(outPtr)
        }

        return this.__IWalletBarcode.get_Value()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Creates and returns a bitmap image stream for the barcode (or returns the custom image used during instantiation).
     * @remarks
     * If the [WalletBarcode](walletbarcode.md) object was instantiated using the [WalletBarcode](walletbarcode_walletbarcode_199548425.md) constructor that takes a custom image as a parameter, that custom image is returned on completion. Otherwise, an image of the system-defined barcode is created and then returned.
     * 
     * This method doesn't literally return an image object that's ready for UI, it returns a stream that defines a bitmap image. To actually set an image, you can use code similar to this:
     * 
     * ```xaml
     * <Button Content="Generate barcode" Click="Button_Click"/>
     * <Image x:Name="barcodeImage"/>
     * ```
     * 
     * ```csharp
     * private async void Button_Click(object sender, RoutedEventArgs e)
     * {
     *     var walletBarcode = new WalletBarcode(WalletBarcodeSymbology.Qr, "123123123123");
     * 
     *     IRandomAccessStreamReference streamRef = await walletBarcode.GetImageAsync();
     *     IRandomAccessStream stream = await streamRef.OpenReadAsync();
     * 
     *     var bitmapImage = new BitmapImage();
     *     await bitmapImage.SetSourceAsync(stream);
     *     barcodeImage.Source = bitmapImage;
     * }
     * ```
     * @returns {IAsyncOperation<IRandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletbarcode.getimageasync
     */
    GetImageAsync() {
        if (!this.HasProp("__IWalletBarcode")) {
            if ((queryResult := this.QueryInterface(IWalletBarcode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletBarcode := IWalletBarcode(outPtr)
        }

        return this.__IWalletBarcode.GetImageAsync()
    }

;@endregion Instance Methods
}
