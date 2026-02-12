#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandAntennaSar.ahk
#Include .\IMobileBroadbandAntennaSarFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the antenna on a broadband modem.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandantennasar
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandAntennaSar extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandAntennaSar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandAntennaSar.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of a [MobileBroadbandAntennaSar](mobilebroadbandantennasar.md).
     * @param {Integer} antennaIndex The identifier number of the antenna, in the form of a unique, zero-based index.
     * @param {Integer} sarBackoffIndex The OEM/IHV-variant value for SAR backoff, in the form of an index entry in the device OEM/IHV's mapping table.
     * @returns {MobileBroadbandAntennaSar} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandantennasar.#ctor
     */
    static CreateWithIndex(antennaIndex, sarBackoffIndex) {
        if (!MobileBroadbandAntennaSar.HasProp("__IMobileBroadbandAntennaSarFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandAntennaSar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMobileBroadbandAntennaSarFactory.IID)
            MobileBroadbandAntennaSar.__IMobileBroadbandAntennaSarFactory := IMobileBroadbandAntennaSarFactory(factoryPtr)
        }

        return MobileBroadbandAntennaSar.__IMobileBroadbandAntennaSarFactory.CreateWithIndex(antennaIndex, sarBackoffIndex)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier number of the antenna, in the form of a unique, zero-based index.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandantennasar.antennaindex
     * @type {Integer} 
     */
    AntennaIndex {
        get => this.get_AntennaIndex()
    }

    /**
     * Gets the OEM/IHV-variant value for SAR backoff, in the form of an index entry in the device OEM/IHV's mapping table.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandantennasar.sarbackoffindex
     * @type {Integer} 
     */
    SarBackoffIndex {
        get => this.get_SarBackoffIndex()
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
    get_AntennaIndex() {
        if (!this.HasProp("__IMobileBroadbandAntennaSar")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAntennaSar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAntennaSar := IMobileBroadbandAntennaSar(outPtr)
        }

        return this.__IMobileBroadbandAntennaSar.get_AntennaIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SarBackoffIndex() {
        if (!this.HasProp("__IMobileBroadbandAntennaSar")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAntennaSar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAntennaSar := IMobileBroadbandAntennaSar(outPtr)
        }

        return this.__IMobileBroadbandAntennaSar.get_SarBackoffIndex()
    }

;@endregion Instance Methods
}
