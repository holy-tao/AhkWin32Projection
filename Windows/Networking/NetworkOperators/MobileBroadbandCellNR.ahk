#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCellNR.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents a collection of properties for a 5G-NR cell.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCellNR extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCellNR

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCellNR.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the cell identity.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.cellid
     * @type {IReference<Integer>} 
     */
    CellId {
        get => this.get_CellId()
    }

    /**
     * Gets the absolute radio frequency channel number.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.channelnumber
     * @type {IReference<Integer>} 
     */
    ChannelNumber {
        get => this.get_ChannelNumber()
    }

    /**
     * Gets the physical cell identity.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.physicalcellid
     * @type {IReference<Integer>} 
     */
    PhysicalCellId {
        get => this.get_PhysicalCellId()
    }

    /**
     * Gets the provider ID (a concatenation of MCC and MNC).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the average reference signal received power in dBm.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.referencesignalreceivedpowerindbm
     * @type {IReference<Float>} 
     */
    ReferenceSignalReceivedPowerInDBm {
        get => this.get_ReferenceSignalReceivedPowerInDBm()
    }

    /**
     * Gets the average reference signal received quality in dBm.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.referencesignalreceivedqualityindbm
     * @type {IReference<Float>} 
     */
    ReferenceSignalReceivedQualityInDBm {
        get => this.get_ReferenceSignalReceivedQualityInDBm()
    }

    /**
     * Gets the timing advance in ns.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.timingadvanceinnanoseconds
     * @type {IReference<Integer>} 
     */
    TimingAdvanceInNanoseconds {
        get => this.get_TimingAdvanceInNanoseconds()
    }

    /**
     * Gets the tracking area code (TAC).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.trackingareacode
     * @type {IReference<Integer>} 
     */
    TrackingAreaCode {
        get => this.get_TrackingAreaCode()
    }

    /**
     * Gets the average reference signal-to-noise and interference Ratio (SNIR) in db.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr.signaltonoiseratioindb
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
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_CellId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChannelNumber() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_ChannelNumber()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PhysicalCellId() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_PhysicalCellId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_ProviderId()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReferenceSignalReceivedPowerInDBm() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_ReferenceSignalReceivedPowerInDBm()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReferenceSignalReceivedQualityInDBm() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_ReferenceSignalReceivedQualityInDBm()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TimingAdvanceInNanoseconds() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_TimingAdvanceInNanoseconds()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TrackingAreaCode() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_TrackingAreaCode()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_SignalToNoiseRatioInDB() {
        if (!this.HasProp("__IMobileBroadbandCellNR")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellNR.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellNR := IMobileBroadbandCellNR(outPtr)
        }

        return this.__IMobileBroadbandCellNR.get_SignalToNoiseRatioInDB()
    }

;@endregion Instance Methods
}
