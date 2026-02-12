#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCellUmts.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents UMTS network provider/cell information including identifications as well as its respective signal strength.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCellUmts extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCellUmts

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCellUmts.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the cell ID.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * Returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.cellid
     * @type {IReference<Integer>} 
     */
    CellId {
        get => this.get_CellId()
    }

    /**
     * Gets the UTRAN Absolute Radio Frequency Channel Number for serving cell.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~16383; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.channelnumber
     * @type {IReference<Integer>} 
     */
    ChannelNumber {
        get => this.get_ChannelNumber()
    }

    /**
     * Gets the Location Area Code (LAC).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~65535; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.locationareacode
     * @type {IReference<Integer>} 
     */
    LocationAreaCode {
        get => this.get_LocationAreaCode()
    }

    /**
     * Gets the path loss in dB. 
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 46~173; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.pathlossindb
     * @type {IReference<Float>} 
     */
    PathLossInDB {
        get => this.get_PathLossInDB()
    }

    /**
     * Gets the primary scrambling code of serving cell.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~511; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.primaryscramblingcode
     * @type {IReference<Integer>} 
     */
    PrimaryScramblingCode {
        get => this.get_PrimaryScramblingCode()
    }

    /**
     * Gets a concatenated string of MCC and MNC.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * Returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the received signal code power in dBm. 
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is -120~-25; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.receivedsignalcodepowerindbm
     * @type {IReference<Float>} 
     */
    ReceivedSignalCodePowerInDBm {
        get => this.get_ReceivedSignalCodePowerInDBm()
    }

    /**
     * Gets the signal to noise ratio in dB. 
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * This value is the ratio of the received energy per PN chip for the CPICH to the total received power spectral density at the antenna. 
     * The range of this value is -50~0; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellumts.signaltonoiseratioindb
     * @type {IReference<Float>} 
     */
    SignalToNoiseRatioInDB {
        get => this.get_SignalToNoiseRatioInDB()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CellId() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_CellId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChannelNumber() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_ChannelNumber()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LocationAreaCode() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_LocationAreaCode()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PathLossInDB() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_PathLossInDB()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PrimaryScramblingCode() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_PrimaryScramblingCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_ProviderId()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReceivedSignalCodePowerInDBm() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_ReceivedSignalCodePowerInDBm()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_SignalToNoiseRatioInDB() {
        if (!this.HasProp("__IMobileBroadbandCellUmts")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellUmts.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellUmts := IMobileBroadbandCellUmts(outPtr)
        }

        return this.__IMobileBroadbandCellUmts.get_SignalToNoiseRatioInDB()
    }

;@endregion Instance Methods
}
