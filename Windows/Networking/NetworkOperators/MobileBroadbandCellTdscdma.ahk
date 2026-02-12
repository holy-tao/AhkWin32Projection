#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCellTdscdma.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents TDSCDMA network provider/cell information including identifications as well as its respective signal strength.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCellTdscdma extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCellTdscdma

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCellTdscdma.IID

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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.cellid
     * @type {IReference<Integer>} 
     */
    CellId {
        get => this.get_CellId()
    }

    /**
     * Gets the cell parameter ID. 
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~127; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.cellparameterid
     * @type {IReference<Integer>} 
     */
    CellParameterId {
        get => this.get_CellParameterId()
    }

    /**
     * Gets the channel number for serving cell.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~16383; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.channelnumber
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.locationareacode
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
     * The range of this value is 46~173; returns null if unknown
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.pathlossindb
     * @type {IReference<Float>} 
     */
    PathLossInDB {
        get => this.get_PathLossInDB()
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.providerid
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
     * The range of this value is -128~-25; returns null if unknown
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.receivedsignalcodepowerindbm
     * @type {IReference<Float>} 
     */
    ReceivedSignalCodePowerInDBm {
        get => this.get_ReceivedSignalCodePowerInDBm()
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcelltdscdma.timingadvanceinbitperiods
     * @type {IReference<Integer>} 
     */
    TimingAdvanceInBitPeriods {
        get => this.get_TimingAdvanceInBitPeriods()
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
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_CellId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CellParameterId() {
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_CellParameterId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChannelNumber() {
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_ChannelNumber()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LocationAreaCode() {
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_LocationAreaCode()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PathLossInDB() {
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_PathLossInDB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_ProviderId()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReceivedSignalCodePowerInDBm() {
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_ReceivedSignalCodePowerInDBm()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TimingAdvanceInBitPeriods() {
        if (!this.HasProp("__IMobileBroadbandCellTdscdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellTdscdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellTdscdma := IMobileBroadbandCellTdscdma(outPtr)
        }

        return this.__IMobileBroadbandCellTdscdma.get_TimingAdvanceInBitPeriods()
    }

;@endregion Instance Methods
}
