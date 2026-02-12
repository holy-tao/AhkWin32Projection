#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides capabilities information for the magnetic stripe reader.
 * @remarks
 * This object is accessed when you retrieve the [Capabilities](magneticstripereader_capabilities.md) property of the [MagneticStripeReader](magneticstripereader.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReaderCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReaderCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of card authentication data that is supported by the device.
     * @remarks
     * An empty string indicates that the device does not support authentication.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.cardauthentication
     * @type {HSTRING} 
     */
    CardAuthentication {
        get => this.get_CardAuthentication()
    }

    /**
     * Gets the supported encryption algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.supportedencryptionalgorithms
     * @type {Integer} 
     */
    SupportedEncryptionAlgorithms {
        get => this.get_SupportedEncryptionAlgorithms()
    }

    /**
     * Gets the authentication level supported by the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.authenticationlevel
     * @type {Integer} 
     */
    AuthenticationLevel {
        get => this.get_AuthenticationLevel()
    }

    /**
     * Indicates whether the device supports ISO cards.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.isisosupported
     * @type {Boolean} 
     */
    IsIsoSupported {
        get => this.get_IsIsoSupported()
    }

    /**
     * Indicates whether device supports JIS Type-I cards.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.isjisonesupported
     * @type {Boolean} 
     */
    IsJisOneSupported {
        get => this.get_IsJisOneSupported()
    }

    /**
     * Indicates whether the device supports JIS Type-II cards.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.isjistwosupported
     * @type {Boolean} 
     */
    IsJisTwoSupported {
        get => this.get_IsJisTwoSupported()
    }

    /**
     * Gets the power reporting capabilities of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.powerreportingtype
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * Indicates whether the device supports reporting of usage statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.isstatisticsreportingsupported
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * Indicates whether the device supports updating of usage statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.isstatisticsupdatingsupported
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * Indicates whether the device is capable of masking track data.
     * @remarks
     * When IsTrackDataMaskingSupported is true and encryption is enabled, the data returned from a data event contains masked data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.istrackdatamaskingsupported
     * @type {Boolean} 
     */
    IsTrackDataMaskingSupported {
        get => this.get_IsTrackDataMaskingSupported()
    }

    /**
     * Indicates whether the devices is able to transmit start and end sentinels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercapabilities.istransmitsentinelssupported
     * @type {Boolean} 
     */
    IsTransmitSentinelsSupported {
        get => this.get_IsTransmitSentinelsSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CardAuthentication() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_CardAuthentication()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedEncryptionAlgorithms() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_SupportedEncryptionAlgorithms()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationLevel() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_AuthenticationLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIsoSupported() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_IsIsoSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsJisOneSupported() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_IsJisOneSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsJisTwoSupported() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_IsJisTwoSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerReportingType() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_PowerReportingType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_IsStatisticsReportingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_IsStatisticsUpdatingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrackDataMaskingSupported() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_IsTrackDataMaskingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransmitSentinelsSupported() {
        if (!this.HasProp("__IMagneticStripeReaderCapabilities")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReaderCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReaderCapabilities := IMagneticStripeReaderCapabilities(outPtr)
        }

        return this.__IMagneticStripeReaderCapabilities.get_IsTransmitSentinelsSupported()
    }

;@endregion Instance Methods
}
