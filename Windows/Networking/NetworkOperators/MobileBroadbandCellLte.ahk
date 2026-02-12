#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCellLte.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents LTE network provider/cell information including identifications as well as its respective signal strength.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCellLte extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCellLte

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCellLte.IID

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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.cellid
     * @type {IReference<Integer>} 
     */
    CellId {
        get => this.get_CellId()
    }

    /**
     * Gets the UNTRA Absolute Radio Frequency Channel Number for serving cell.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~65535; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.channelnumber
     * @type {IReference<Integer>} 
     */
    ChannelNumber {
        get => this.get_ChannelNumber()
    }

    /**
     * Gets the pysical cell ID.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~503; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.physicalcellid
     * @type {IReference<Integer>} 
     */
    PhysicalCellId {
        get => this.get_PhysicalCellId()
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the average Reference Signal Received Power in dBm.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is -140~44; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.referencesignalreceivedpowerindbm
     * @type {IReference<Float>} 
     */
    ReferenceSignalReceivedPowerInDBm {
        get => this.get_ReferenceSignalReceivedPowerInDBm()
    }

    /**
     * Gets the average Reference Signal Received Quality in dBm.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is -20~-3; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.referencesignalreceivedqualityindbm
     * @type {IReference<Float>} 
     */
    ReferenceSignalReceivedQualityInDBm {
        get => this.get_ReferenceSignalReceivedQualityInDBm()
    }

    /**
     * Gets the Timing Advance in bit periods, where a bit period is 48/13us.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~255; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.timingadvanceinbitperiods
     * @type {IReference<Integer>} 
     */
    TimingAdvanceInBitPeriods {
        get => this.get_TimingAdvanceInBitPeriods()
    }

    /**
     * Gets the Tracking Area Code.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~65535; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelllte.trackingareacode
     * @type {IReference<Integer>} 
     */
    TrackingAreaCode {
        get => this.get_TrackingAreaCode()
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
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_CellId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChannelNumber() {
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_ChannelNumber()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PhysicalCellId() {
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_PhysicalCellId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_ProviderId()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReferenceSignalReceivedPowerInDBm() {
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_ReferenceSignalReceivedPowerInDBm()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReferenceSignalReceivedQualityInDBm() {
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_ReferenceSignalReceivedQualityInDBm()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TimingAdvanceInBitPeriods() {
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_TimingAdvanceInBitPeriods()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TrackingAreaCode() {
        if (!this.HasProp("__IMobileBroadbandCellLte")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellLte.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellLte := IMobileBroadbandCellLte(outPtr)
        }

        return this.__IMobileBroadbandCellLte.get_TrackingAreaCode()
    }

;@endregion Instance Methods
}
