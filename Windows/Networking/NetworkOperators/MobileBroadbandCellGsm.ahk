#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCellGsm.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents GSM network provider/cell information including identifications as well as its respective signal strength.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCellGsm extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCellGsm

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCellGsm.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the base station ID. 
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~63; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm.basestationid
     * @type {IReference<Integer>} 
     */
    BaseStationId {
        get => this.get_BaseStationId()
    }

    /**
     * Gets the cell ID.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * Returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm.cellid
     * @type {IReference<Integer>} 
     */
    CellId {
        get => this.get_CellId()
    }

    /**
     * Gets the Absolute Radio Frequency Channel Number for serving cell.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~1023; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm.channelnumber
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm.locationareacode
     * @type {IReference<Integer>} 
     */
    LocationAreaCode {
        get => this.get_LocationAreaCode()
    }

    /**
     * Gets a concatenated string of MCC and MNC
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * Returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the received signal strength in dB.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is -110~49; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm.receivedsignalstrengthindbm
     * @type {IReference<Float>} 
     */
    ReceivedSignalStrengthInDBm {
        get => this.get_ReceivedSignalStrengthInDBm()
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellgsm.timingadvanceinbitperiods
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
    get_BaseStationId() {
        if (!this.HasProp("__IMobileBroadbandCellGsm")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellGsm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellGsm := IMobileBroadbandCellGsm(outPtr)
        }

        return this.__IMobileBroadbandCellGsm.get_BaseStationId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CellId() {
        if (!this.HasProp("__IMobileBroadbandCellGsm")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellGsm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellGsm := IMobileBroadbandCellGsm(outPtr)
        }

        return this.__IMobileBroadbandCellGsm.get_CellId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChannelNumber() {
        if (!this.HasProp("__IMobileBroadbandCellGsm")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellGsm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellGsm := IMobileBroadbandCellGsm(outPtr)
        }

        return this.__IMobileBroadbandCellGsm.get_ChannelNumber()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LocationAreaCode() {
        if (!this.HasProp("__IMobileBroadbandCellGsm")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellGsm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellGsm := IMobileBroadbandCellGsm(outPtr)
        }

        return this.__IMobileBroadbandCellGsm.get_LocationAreaCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IMobileBroadbandCellGsm")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellGsm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellGsm := IMobileBroadbandCellGsm(outPtr)
        }

        return this.__IMobileBroadbandCellGsm.get_ProviderId()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ReceivedSignalStrengthInDBm() {
        if (!this.HasProp("__IMobileBroadbandCellGsm")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellGsm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellGsm := IMobileBroadbandCellGsm(outPtr)
        }

        return this.__IMobileBroadbandCellGsm.get_ReceivedSignalStrengthInDBm()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TimingAdvanceInBitPeriods() {
        if (!this.HasProp("__IMobileBroadbandCellGsm")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellGsm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellGsm := IMobileBroadbandCellGsm(outPtr)
        }

        return this.__IMobileBroadbandCellGsm.get_TimingAdvanceInBitPeriods()
    }

;@endregion Instance Methods
}
