#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderTrackData.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the track data obtained following a card swipe.
 * @remarks
 * This object is accessed when you retrieve the [Track1](magneticstripereaderreport_track1.md), [Track2](magneticstripereaderreport_track2.md), [Track3](magneticstripereaderreport_track3.md), and [Track4](magneticstripereaderreport_track4.md) properties of the [MagneticStripeReaderReport](magneticstripereaderreport.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadertrackdata
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderTrackData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReaderTrackData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReaderTrackData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the raw or decoded data from the swiped card.
     * @remarks
     * If [IsDecodeDataEnabled](claimedmagneticstripereader_isdecodedataenabled.md) is true, then Data contains decoded data.
     * 
     * If [IsTransmitSentinelsEnabled](claimedmagneticstripereader_istransmitsentinelsenabled.md) is false, then Data contains the track data between sentinels, but not including the start and end sentinels. If [IsTransmitSentinelsEnabled](claimedmagneticstripereader_istransmitsentinelsenabled.md) is true, then the track data includes the start and end sentinels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadertrackdata.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the discretionary data from the swiped card.
     * @remarks
     * The array will always be empty if [IsDecodeDataEnabled](claimedmagneticstripereader_isdecodedataenabled.md) propety is false.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadertrackdata.discretionarydata
     * @type {IBuffer} 
     */
    DiscretionaryData {
        get => this.get_DiscretionaryData()
    }

    /**
     * Gets the encrypted data from the swiped card.
     * @remarks
     * This property is empty if the [DataEncryptionAlgorithm](claimedmagneticstripereader_dataencryptionalgorithm.md) is set to None.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadertrackdata.encrypteddata
     * @type {IBuffer} 
     */
    EncryptedData {
        get => this.get_EncryptedData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IMagneticStripeReaderTrackData")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderTrackData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderTrackData := IMagneticStripeReaderTrackData(outPtr)
        }

        return this.__IMagneticStripeReaderTrackData.get_Data()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DiscretionaryData() {
        if (!this.HasProp("__IMagneticStripeReaderTrackData")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderTrackData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderTrackData := IMagneticStripeReaderTrackData(outPtr)
        }

        return this.__IMagneticStripeReaderTrackData.get_DiscretionaryData()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_EncryptedData() {
        if (!this.HasProp("__IMagneticStripeReaderTrackData")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderTrackData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderTrackData := IMagneticStripeReaderTrackData(outPtr)
        }

        return this.__IMagneticStripeReaderTrackData.get_EncryptedData()
    }

;@endregion Instance Methods
}
