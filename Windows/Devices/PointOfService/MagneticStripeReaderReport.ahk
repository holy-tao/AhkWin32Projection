#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains data from the recently swiped card.
 * @remarks
 * This object is accessed when you retrieve the Report property of [MagneticStripeReaderBankCardDataReceivedEventArgs](magneticstripereaderbankcarddatareceivedeventargs.md), [MagneticStripeReaderAamvaCardDataReceivedEventArgs](magneticstripereaderaamvacarddatareceivedeventargs.md), or [MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs](magneticstripereadervendorspecificcarddatareceivedeventargs.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReaderReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReaderReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the card type identifier for the recently swiped card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.cardtype
     * @type {Integer} 
     */
    CardType {
        get => this.get_CardType()
    }

    /**
     * Gets the track data for Track 1.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.track1
     * @type {MagneticStripeReaderTrackData} 
     */
    Track1 {
        get => this.get_Track1()
    }

    /**
     * Gets the track data for Track 2.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.track2
     * @type {MagneticStripeReaderTrackData} 
     */
    Track2 {
        get => this.get_Track2()
    }

    /**
     * Gets the track data for Track 3.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.track3
     * @type {MagneticStripeReaderTrackData} 
     */
    Track3 {
        get => this.get_Track3()
    }

    /**
     * Gets the track data for Track 4.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.track4
     * @type {MagneticStripeReaderTrackData} 
     */
    Track4 {
        get => this.get_Track4()
    }

    /**
     * Gets a dictionary of properties for the recently swiped card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.properties
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the card authentication information for the recently swiped card.
     * @remarks
     * The information and internal format of this property vary among services. This property is empty if the device does not support authentication. Otherwise, the value of this property is encrypted using the encryption algorithm in [DataEncryptionAlgorithm](claimedmagneticstripereader_dataencryptionalgorithm.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.cardauthenticationdata
     * @type {IBuffer} 
     */
    CardAuthenticationData {
        get => this.get_CardAuthenticationData()
    }

    /**
     * Gets the length of the raw [CardAuthenticationData](magneticstripereaderreport_cardauthenticationdata.md) before it is encrypted.
     * @remarks
     * Many encryption algorithms require padding of the input data before it can be encrypted. This property contains the length of the original unpadded data before it is encrypted. It may be needed to restore the original data after decryption.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.cardauthenticationdatalength
     * @type {Integer} 
     */
    CardAuthenticationDataLength {
        get => this.get_CardAuthenticationDataLength()
    }

    /**
     * Gets the additional security or encryption information for the recently swiped card.
     * @remarks
     * The information content and internal format of this property vary among encryption algorithms. For example, for DUKPT this property contains the DUKPT sequence number. This property is empty if the encryption algorithm does not require it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderreport.additionalsecurityinformation
     * @type {IBuffer} 
     */
    AdditionalSecurityInformation {
        get => this.get_AdditionalSecurityInformation()
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
    get_CardType() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_CardType()
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track1() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_Track1()
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track2() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_Track2()
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track3() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_Track3()
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track4() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_Track4()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Properties() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_Properties()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CardAuthenticationData() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_CardAuthenticationData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CardAuthenticationDataLength() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_CardAuthenticationDataLength()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AdditionalSecurityInformation() {
        if (!this.HasProp("__IMagneticStripeReaderReport")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderReport := IMagneticStripeReaderReport(outPtr)
        }

        return this.__IMagneticStripeReaderReport.get_AdditionalSecurityInformation()
    }

;@endregion Instance Methods
}
