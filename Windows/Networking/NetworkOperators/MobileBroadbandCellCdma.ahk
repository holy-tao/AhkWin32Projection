#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCellCdma.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents CDMA network provider/cell information including identifications as well as its respective signal strength.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCellCdma extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCellCdma

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCellCdma.IID

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
     * The range of this value is 0~65535; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.basestationid
     * @type {IReference<Integer>} 
     */
    BaseStationId {
        get => this.get_BaseStationId()
    }

    /**
     * Gets the base station PN Number. 
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~511; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.basestationpncode
     * @type {IReference<Integer>} 
     */
    BaseStationPNCode {
        get => this.get_BaseStationPNCode()
    }

    /**
     * Gets the base station latitude.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is -89.999931 ~ 90; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.basestationlatitude
     * @type {IReference<Float>} 
     */
    BaseStationLatitude {
        get => this.get_BaseStationLatitude()
    }

    /**
     * Gets the base station longitude.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 179.999931 ~ 180; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.basestationlongitude
     * @type {IReference<Float>} 
     */
    BaseStationLongitude {
        get => this.get_BaseStationLongitude()
    }

    /**
     * Gets the time elapsed since the location information from base station reached mobile station.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.basestationlastbroadcastgpstime
     * @type {IReference<TimeSpan>} 
     */
    BaseStationLastBroadcastGpsTime {
        get => this.get_BaseStationLastBroadcastGpsTime()
    }

    /**
     * Gets the network ID in CDMA only.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~65535; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.networkid
     * @type {IReference<Integer>} 
     */
    NetworkId {
        get => this.get_NetworkId()
    }

    /**
     * Gets the pilot signal strength in dB. 
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is -120~-25; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.pilotsignalstrengthindb
     * @type {IReference<Float>} 
     */
    PilotSignalStrengthInDB {
        get => this.get_PilotSignalStrengthInDB()
    }

    /**
     * Gets the system ID in CDMA only.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The range of this value is 0~32767; returns null if unknown.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellcdma.systemid
     * @type {IReference<Integer>} 
     */
    SystemId {
        get => this.get_SystemId()
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
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_BaseStationId()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_BaseStationPNCode() {
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_BaseStationPNCode()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_BaseStationLatitude() {
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_BaseStationLatitude()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_BaseStationLongitude() {
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_BaseStationLongitude()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_BaseStationLastBroadcastGpsTime() {
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_BaseStationLastBroadcastGpsTime()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_NetworkId() {
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_NetworkId()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PilotSignalStrengthInDB() {
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_PilotSignalStrengthInDB()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SystemId() {
        if (!this.HasProp("__IMobileBroadbandCellCdma")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellCdma.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellCdma := IMobileBroadbandCellCdma(outPtr)
        }

        return this.__IMobileBroadbandCellCdma.get_SystemId()
    }

;@endregion Instance Methods
}
