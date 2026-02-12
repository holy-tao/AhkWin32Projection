#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandCellsInfo.ahk
#Include .\IMobileBroadbandCellsInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Retrieves the serving and neighboring network cell information including respective signal strength and cell tower identification information.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandCellsInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandCellsInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandCellsInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a read-only array of neighboring [**MobileBroadbandCellCdma**](mobilebroadbandcellcdma.md containing all CDMA providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.neighboringcellscdma
     * @type {IVectorView<MobileBroadbandCellCdma>} 
     */
    NeighboringCellsCdma {
        get => this.get_NeighboringCellsCdma()
    }

    /**
     * Gets a read-only array of neighboring [MobileBroadbandCellGsm](mobilebroadbandcellgsm.md) containing all GSM providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.neighboringcellsgsm
     * @type {IVectorView<MobileBroadbandCellGsm>} 
     */
    NeighboringCellsGsm {
        get => this.get_NeighboringCellsGsm()
    }

    /**
     * Gets a read-only array of neighboring [MobileBroadbandCellLte](mobilebroadbandcelllte.md) containing all LTE providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.neighboringcellslte
     * @type {IVectorView<MobileBroadbandCellLte>} 
     */
    NeighboringCellsLte {
        get => this.get_NeighboringCellsLte()
    }

    /**
     * Gets a read-only array of neighboring [MobileBroadbandCellTdscdma](mobilebroadbandcelltdscdma.md) containing all TDSCMA providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.neighboringcellstdscdma
     * @type {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    NeighboringCellsTdscdma {
        get => this.get_NeighboringCellsTdscdma()
    }

    /**
     * Gets a read-only array of neighboring [MobileBroadbandCellUmts](mobilebroadbandcellumts.md) containing all UMTS providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.neighboringcellsumts
     * @type {IVectorView<MobileBroadbandCellUmts>} 
     */
    NeighboringCellsUmts {
        get => this.get_NeighboringCellsUmts()
    }

    /**
     * Gets a read-only array of serving [MobileBroadbandCellCdma](mobilebroadbandcellcdma.md) containing all CDMA providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.servingcellscdma
     * @type {IVectorView<MobileBroadbandCellCdma>} 
     */
    ServingCellsCdma {
        get => this.get_ServingCellsCdma()
    }

    /**
     * Gets a read-only array of neighboring [MobileBroadbandCellGsm](mobilebroadbandcellgsm.md) containing all GSM providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.servingcellsgsm
     * @type {IVectorView<MobileBroadbandCellGsm>} 
     */
    ServingCellsGsm {
        get => this.get_ServingCellsGsm()
    }

    /**
     * Gets a read-only array of neighboring [MobileBroadbandCellLte](mobilebroadbandcelllte.md) containing all LTE providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.servingcellslte
     * @type {IVectorView<MobileBroadbandCellLte>} 
     */
    ServingCellsLte {
        get => this.get_ServingCellsLte()
    }

    /**
     * Gets a read-only array of serving [MobileBroadbandCellTdscdma](mobilebroadbandcelltdscdma.md) containing all TDSCMA providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.servingcellstdscdma
     * @type {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    ServingCellsTdscdma {
        get => this.get_ServingCellsTdscdma()
    }

    /**
     * Gets a read-only array of serving [MobileBroadbandCellUmts](mobilebroadbandcellumts.md) containing all UMTS providers.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If not available or unknown, the size of array is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.servingcellsumts
     * @type {IVectorView<MobileBroadbandCellUmts>} 
     */
    ServingCellsUmts {
        get => this.get_ServingCellsUmts()
    }

    /**
     * Gets a collection of [MobileBroadbandCellNR](/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr) objects, each representing a collection of properties for a neighboring 5G-NR cell.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.neighboringcellsnr
     * @type {IVectorView<MobileBroadbandCellNR>} 
     */
    NeighboringCellsNR {
        get => this.get_NeighboringCellsNR()
    }

    /**
     * Gets a collection of [MobileBroadbandCellNR](/uwp/api/windows.networking.networkoperators.mobilebroadbandcellnr) objects, each representing a collection of properties for a serving 5G-NR cell.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandcellsinfo.servingcellsnr
     * @type {IVectorView<MobileBroadbandCellNR>} 
     */
    ServingCellsNR {
        get => this.get_ServingCellsNR()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellCdma>} 
     */
    get_NeighboringCellsCdma() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_NeighboringCellsCdma()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellGsm>} 
     */
    get_NeighboringCellsGsm() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_NeighboringCellsGsm()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellLte>} 
     */
    get_NeighboringCellsLte() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_NeighboringCellsLte()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    get_NeighboringCellsTdscdma() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_NeighboringCellsTdscdma()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellUmts>} 
     */
    get_NeighboringCellsUmts() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_NeighboringCellsUmts()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellCdma>} 
     */
    get_ServingCellsCdma() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_ServingCellsCdma()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellGsm>} 
     */
    get_ServingCellsGsm() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_ServingCellsGsm()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellLte>} 
     */
    get_ServingCellsLte() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_ServingCellsLte()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    get_ServingCellsTdscdma() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_ServingCellsTdscdma()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellUmts>} 
     */
    get_ServingCellsUmts() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo := IMobileBroadbandCellsInfo(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo.get_ServingCellsUmts()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellNR>} 
     */
    get_NeighboringCellsNR() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo2 := IMobileBroadbandCellsInfo2(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo2.get_NeighboringCellsNR()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellNR>} 
     */
    get_ServingCellsNR() {
        if (!this.HasProp("__IMobileBroadbandCellsInfo2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandCellsInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandCellsInfo2 := IMobileBroadbandCellsInfo2(outPtr)
        }

        return this.__IMobileBroadbandCellsInfo2.get_ServingCellsNR()
    }

;@endregion Instance Methods
}
