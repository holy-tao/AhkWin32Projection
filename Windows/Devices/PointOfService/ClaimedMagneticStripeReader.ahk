#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedMagneticStripeReader.ahk
#Include .\IClaimedMagneticStripeReader2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ClaimedMagneticStripeReader.ahk
#Include .\MagneticStripeReaderBankCardDataReceivedEventArgs.ahk
#Include .\MagneticStripeReaderAamvaCardDataReceivedEventArgs.ahk
#Include .\MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs.ahk
#Include ..\..\Foundation\EventHandler.ahk
#Include .\MagneticStripeReaderErrorOccurredEventArgs.ahk
#Include .\ClaimedMagneticStripeReaderClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the claimed magnetic stripe reader.
 * @remarks
 * This object is created when [ClaimReaderAsync](magneticstripereader_claimreaderasync_1639218756.md) method completes.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedMagneticStripeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedMagneticStripeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedMagneticStripeReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the claimed magnetic stripe reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Indicates whether the magnetic stripe reader is ready to receive data events.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets or sets a Boolean value that indicates whether the magnetic stripe reader is disabled after receiving the data from the most recently swiped card.
     * @remarks
     * IsDisabledOnDataReceived provides the application the option to disable the magnetic stripe reader after receiving the data. When set to true, the device is disabled as soon as it receives the data from the most recently swiped card. The application must call [EnableAsync](claimedmagneticstripereader_enableasync_208845947.md) to get the device ready for the next data event.
     * 
     * This property is initialized to false.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.isdisabledondatareceived
     * @type {Boolean} 
     */
    IsDisabledOnDataReceived {
        get => this.get_IsDisabledOnDataReceived()
        set => this.put_IsDisabledOnDataReceived(value)
    }

    /**
     * Indicates whether to provide raw or decoded data from the most recently swiped card.
     * @remarks
     * Use this property to decide whether to pass the data from the card swipe in the original raw form or to decode it first.
     * 
     * If set to true, each byte of track data is mapped from its original encoded bit sequence, as it exists in the magnetic card, to its corresponding decoded ASCII bit sequence. This conversion is not relevant to 7-bit format, which is not encoded.
     * 
     * For each card type, the decoding takes place as follows:<table>
     *    <tr><th>Card type</th><th>Track data property</th><th>Raw data format</th><th>Raw bytes</th><th>Decoded Values</th></tr>
     *    <tr><td>ISO</td><td>Track 1 data</td><td>6-bit</td><td>0x00-0x3F</td><td>0x20 through 0x5F</td></tr>
     *    <tr><td>ISO</td><td>Track 2 data</td><td>4-bit</td><td>0x00-0x3F</td><td>0x30 through 0x3F</td></tr>
     *    <tr><td>ISO</td><td>Track 3 data</td><td>4-bit</td><td>0x00-0x3F</td><td>0x30 through 0x3F</td></tr>
     *    <tr><td>JIS-I</td><td>Track 1 data</td><td>6-bit</td><td>0x00-0x3F</td><td>0x20 through 0x5F</td></tr>
     *    <tr><td>JIS-I</td><td>Track 1 data</td><td>7-bit</td><td>0x00-0x7F</td><td>Data unaltered</td></tr>
     *    <tr><td>JIS-I</td><td>Track 2 data</td><td>4-bit</td><td>0x00-0x0F</td><td>0x20 through 0x3F</td></tr>
     *    <tr><td>JIS-I</td><td>Track 3 data</td><td>4-bit</td><td>0x00-0x0F</td><td>0x20 through 0x3F</td></tr>
     *    <tr><td>JIS-I</td><td>Track 3 data</td><td>7-bit</td><td>0x00-0x7F</td><td>Data unaltered</td></tr>
     *    <tr><td>JIS-II</td><td>Track 4 data</td><td>7-bit</td><td>0x00-0x7F</td><td>Data unaltered</td></tr>
     *    <tr><td>AAMVA</td><td>Track 1 data</td><td>6-bit</td><td>0x00-0x3F</td><td>0x20 through 0x5F</td></tr>
     *    <tr><td>AAMVA</td><td>Track 2 data</td><td>4-bit</td><td>0x00-0x0F</td><td>0x30 through 0x3F</td></tr>
     *    <tr><td>AAMVA</td><td>Track 3 data</td><td>6-bit</td><td>0x00-0x3F</td><td>0x20 through 0x5F</td></tr>
     * </table>
     * 
     * This property is initialized to false.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.isdecodedataenabled
     * @type {Boolean} 
     */
    IsDecodeDataEnabled {
        get => this.get_IsDecodeDataEnabled()
        set => this.put_IsDecodeDataEnabled(value)
    }

    /**
     * Indicates whether the device is authenticated.
     * @remarks
     * This property is only valid in the devices that support authentication.
     * 
     * When the device authentication state changes, the [StatusUpdated](magneticstripereader_statusupdated.md) event occurs to indicate the change.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.isdeviceauthenticated
     * @type {Boolean} 
     */
    IsDeviceAuthenticated {
        get => this.get_IsDeviceAuthenticated()
    }

    /**
     * Gets or sets the [MagneticStripeReaderEncryptionAlgorithms](magneticstripereaderencryptionalgorithms.md) that will be used to encrypt the track data.
     * @remarks
     * This property can only be updated when the device is opened and claimed; it cannot be updated when the device is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.dataencryptionalgorithm
     * @type {Integer} 
     */
    DataEncryptionAlgorithm {
        get => this.get_DataEncryptionAlgorithm()
        set => this.put_DataEncryptionAlgorithm(value)
    }

    /**
     * Gets or sets the track data that the application wants to receive following a card swipe.
     * @remarks
     * TracksToRead determines which tracks the application wants to receive following a card swipe. This does not indicate the capability of the device hardware; instead, it is an application configurable property representing which tracks to read. There are cases when the desired data cannot be obtained, such as cards not having data for a particular track.
     * 
     * Decreasing the required number of tracks may provide a greater success rate and somewhat greater responsiveness by removing the processing for inaccessible data.
     * 
     * This property is initialized for all tracks (Track1 | Track 2 | Track3 | Track4).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.trackstoread
     * @type {Integer} 
     */
    TracksToRead {
        get => this.get_TracksToRead()
        set => this.put_TracksToRead(value)
    }

    /**
     * Indicates whether the track data contains start and end sentinel values.
     * @remarks
     * This property is initialized to false.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.istransmitsentinelsenabled
     * @type {Boolean} 
     */
    IsTransmitSentinelsEnabled {
        get => this.get_IsTransmitSentinelsEnabled()
        set => this.put_IsTransmitSentinelsEnabled(value)
    }

    /**
     * Occurs when a bank card is swiped.
     * @remarks
     * An application can register for this event handler to get the bank card data each time a bank card is swiped through the magnetic stripe reader.
     * @type {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderBankCardDataReceivedEventArgs>}
    */
    OnBankCardDataReceived {
        get {
            if(!this.HasProp("__OnBankCardDataReceived")){
                this.__OnBankCardDataReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6a41d015-245e-51ba-bd6c-44775d70bfa2}"),
                    ClaimedMagneticStripeReader,
                    MagneticStripeReaderBankCardDataReceivedEventArgs
                )
                this.__OnBankCardDataReceivedToken := this.add_BankCardDataReceived(this.__OnBankCardDataReceived.iface)
            }
            return this.__OnBankCardDataReceived
        }
    }

    /**
     * Occurs when a motor vehicle card is swiped.
     * @remarks
     * An application can register for this event handler to receive data from driver licenses or other cards formatted according to American Association Motor Vehicles Administrators (AAMVA) card specification.
     * @type {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderAamvaCardDataReceivedEventArgs>}
    */
    OnAamvaCardDataReceived {
        get {
            if(!this.HasProp("__OnAamvaCardDataReceived")){
                this.__OnAamvaCardDataReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{29e08f92-c3ab-57ea-aaba-789f792d7a46}"),
                    ClaimedMagneticStripeReader,
                    MagneticStripeReaderAamvaCardDataReceivedEventArgs
                )
                this.__OnAamvaCardDataReceivedToken := this.add_AamvaCardDataReceived(this.__OnAamvaCardDataReceived.iface)
            }
            return this.__OnAamvaCardDataReceived
        }
    }

    /**
     * Occurs when a vendor-specific card is swiped.
     * @type {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs>}
    */
    OnVendorSpecificDataReceived {
        get {
            if(!this.HasProp("__OnVendorSpecificDataReceived")){
                this.__OnVendorSpecificDataReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{959124ba-ee44-560c-8183-61c6a2308d8f}"),
                    ClaimedMagneticStripeReader,
                    MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs
                )
                this.__OnVendorSpecificDataReceivedToken := this.add_VendorSpecificDataReceived(this.__OnVendorSpecificDataReceived.iface)
            }
            return this.__OnVendorSpecificDataReceived
        }
    }

    /**
     * Occurs when the device gets a request to release its exclusive claim.
     * @type {EventHandler<ClaimedMagneticStripeReader>}
    */
    OnReleaseDeviceRequested {
        get {
            if(!this.HasProp("__OnReleaseDeviceRequested")){
                this.__OnReleaseDeviceRequested := WinRTEventHandler(
                    EventHandler,
                    Guid("{9bea3b31-001f-5b6e-9649-e7bce592aa95}"),
                    IInspectable,
                    ClaimedMagneticStripeReader
                )
                this.__OnReleaseDeviceRequestedToken := this.add_ReleaseDeviceRequested(this.__OnReleaseDeviceRequested.iface)
            }
            return this.__OnReleaseDeviceRequested
        }
    }

    /**
     * Occurs when the magnetic stripe reader detects an error when reading a card.
     * @type {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderErrorOccurredEventArgs>}
    */
    OnErrorOccurred {
        get {
            if(!this.HasProp("__OnErrorOccurred")){
                this.__OnErrorOccurred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1464a1e6-9d92-547e-b4ac-f255ac85f950}"),
                    ClaimedMagneticStripeReader,
                    MagneticStripeReaderErrorOccurredEventArgs
                )
                this.__OnErrorOccurredToken := this.add_ErrorOccurred(this.__OnErrorOccurred.iface)
            }
            return this.__OnErrorOccurred
        }
    }

    /**
     * Event that is raised when the **ClaimedMagneticStripeReader** is closed.
     * @remarks
     * When an app is suspended, all **ClaimedMagneticStripeReader** objects are closed. This event can be useful to determine when magnetic stripe reader connections need to be re-established.
     * @type {TypedEventHandler<ClaimedMagneticStripeReader, ClaimedMagneticStripeReaderClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9132fe4d-a48a-5578-8e76-9ec03a62f94a}"),
                    ClaimedMagneticStripeReader,
                    ClaimedMagneticStripeReaderClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBankCardDataReceivedToken")) {
            this.remove_BankCardDataReceived(this.__OnBankCardDataReceivedToken)
            this.__OnBankCardDataReceived.iface.Dispose()
        }

        if(this.HasProp("__OnAamvaCardDataReceivedToken")) {
            this.remove_AamvaCardDataReceived(this.__OnAamvaCardDataReceivedToken)
            this.__OnAamvaCardDataReceived.iface.Dispose()
        }

        if(this.HasProp("__OnVendorSpecificDataReceivedToken")) {
            this.remove_VendorSpecificDataReceived(this.__OnVendorSpecificDataReceivedToken)
            this.__OnVendorSpecificDataReceived.iface.Dispose()
        }

        if(this.HasProp("__OnReleaseDeviceRequestedToken")) {
            this.remove_ReleaseDeviceRequested(this.__OnReleaseDeviceRequestedToken)
            this.__OnReleaseDeviceRequested.iface.Dispose()
        }

        if(this.HasProp("__OnErrorOccurredToken")) {
            this.remove_ErrorOccurred(this.__OnErrorOccurredToken)
            this.__OnErrorOccurred.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDisabledOnDataReceived(value) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.put_IsDisabledOnDataReceived(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledOnDataReceived() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_IsDisabledOnDataReceived()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDecodeDataEnabled(value) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.put_IsDecodeDataEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecodeDataEnabled() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_IsDecodeDataEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeviceAuthenticated() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_IsDeviceAuthenticated()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataEncryptionAlgorithm(value) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.put_DataEncryptionAlgorithm(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataEncryptionAlgorithm() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_DataEncryptionAlgorithm()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TracksToRead(value) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.put_TracksToRead(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TracksToRead() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_TracksToRead()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTransmitSentinelsEnabled(value) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.put_IsTransmitSentinelsEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransmitSentinelsEnabled() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.get_IsTransmitSentinelsEnabled()
    }

    /**
     * Gets the magnetic stripe reader into a ready state to receive data events.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.enableasync
     */
    EnableAsync() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.EnableAsync()
    }

    /**
     * Puts the [ClaimedMagneticStripeReader](claimedmagneticstripereader.md) into a state where it cannot receive data events.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.disableasync
     */
    DisableAsync() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.DisableAsync()
    }

    /**
     * Retains exclusive claim to the magnetic stripe reader.
     * @remarks
     * When the application receives a request to release its exclusive claim to the magnetic stripe reader, it must call RetainDevice, otherwise it will lose its claim to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.retaindevice
     */
    RetainDevice() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.RetainDevice()
    }

    /**
     * Sets the type of error to report by the [ErrorOccurred](claimedmagneticstripereader_erroroccurred.md) event.
     * @param {Integer} value Error reporting type.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.seterrorreportingtype
     */
    SetErrorReportingType(value) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.SetErrorReportingType(value)
    }

    /**
     * Retrieves a challenge token from the device.
     * @remarks
     * This method is only valid for devices that support authentication.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.retrievedeviceauthenticationdataasync
     */
    RetrieveDeviceAuthenticationDataAsync() {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.RetrieveDeviceAuthenticationDataAsync()
    }

    /**
     * Puts the device into an authenticated state.
     * @remarks
     * The method is only valid for devices that support authentication.
     * 
     * To authenticate a device, the application calls the [RetrieveDeviceAuthenticationDataAsync](claimedmagneticstripereader_retrievedeviceauthenticationdataasync_1404266163.md) method to retrieve a challenge token. The application typically passes this token to another entity that has special knowledge of a shared secret and is able to create a proper response token. This response token is then passed into the AuthenticateDeviceAsync method that uses it to validate the authentication request.
     * @param {Integer} responseToken_length 
     * @param {Pointer<Integer>} responseToken A buffer containing the response token generated from the challenge token retrieved from a previous call to the [RetrieveDeviceAuthenticationDataAsync](claimedmagneticstripereader_retrievedeviceauthenticationdataasync_1404266163.md) method.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.authenticatedeviceasync
     */
    AuthenticateDeviceAsync(responseToken_length, responseToken) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.AuthenticateDeviceAsync(responseToken_length, responseToken)
    }

    /**
     * Puts the device into an unauthenticated state.
     * @remarks
     * When successful, the [IsDeviceAuthenticated](claimedmagneticstripereader_isdeviceauthenticated.md) property changes to false.
     * @param {Integer} responseToken_length 
     * @param {Pointer<Integer>} responseToken A buffer containing the response token generated from the challenge token retrieved from a previous call to the [RetrieveDeviceAuthenticationDataAsync](claimedmagneticstripereader_retrievedeviceauthenticationdataasync_1404266163.md) method.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.deauthenticatedeviceasync
     */
    DeAuthenticateDeviceAsync(responseToken_length, responseToken) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.DeAuthenticateDeviceAsync(responseToken_length, responseToken)
    }

    /**
     * Provides a new encryption key to the device.
     * @remarks
     * This method is only used for those encryption algorithms in which the new key values are sent to the terminal as a field in standard messages from the host.
     * @param {HSTRING} key The HEX-ASCII or base64-encoded value for the new key.
     * @param {HSTRING} keyName The name used to identify the key.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.updatekeyasync
     */
    UpdateKeyAsync(key, keyName) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.UpdateKeyAsync(key, keyName)
    }

    /**
     * Resets the specified statistics to zero for all statistics that can be reset.
     * @param {IIterable<HSTRING>} statisticsCategories The list of names of the statistics to reset. 
     * + An empty string ("") resets all statistics.
     * + "U_" resets all UnifiedPOS-defined statistics.
     * + "M_" resets all manufacturer-defined statistics.
     * + "name1" and/or "name2" resets specific named statistics as defined by the UnifiedPOS or manufacturer.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.resetstatisticsasync
     */
    ResetStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.ResetStatisticsAsync(statisticsCategories)
    }

    /**
     * Updates the specified statistics.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} statistics The list of key-value pairs of statistics to update. 
     * + An empty string ("", "value1") sets all statistics that can be set to value1.
     * + "U_", "value2" sets all UnifiedPOS defined statistics that can be set to value2.
     * + "M_", "value3" sets all manufacturer defined statistics that can be set to value3.
     * + "name1", "value4" sets specific named statistics as defined by the UnifiedPOS or manufacturer to value4.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.updatestatisticsasync
     */
    UpdateStatisticsAsync(statistics) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.UpdateStatisticsAsync(statistics)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderBankCardDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BankCardDataReceived(handler) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.add_BankCardDataReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BankCardDataReceived(token) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.remove_BankCardDataReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderAamvaCardDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AamvaCardDataReceived(handler) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.add_AamvaCardDataReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AamvaCardDataReceived(token) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.remove_AamvaCardDataReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VendorSpecificDataReceived(handler) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.add_VendorSpecificDataReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VendorSpecificDataReceived(token) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.remove_VendorSpecificDataReceived(token)
    }

    /**
     * 
     * @param {EventHandler<ClaimedMagneticStripeReader>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.add_ReleaseDeviceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReleaseDeviceRequested(token) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.remove_ReleaseDeviceRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorOccurred(handler) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.add_ErrorOccurred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorOccurred(token) {
        if (!this.HasProp("__IClaimedMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader := IClaimedMagneticStripeReader(outPtr)
        }

        return this.__IClaimedMagneticStripeReader.remove_ErrorOccurred(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, ClaimedMagneticStripeReaderClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IClaimedMagneticStripeReader2")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader2 := IClaimedMagneticStripeReader2(outPtr)
        }

        return this.__IClaimedMagneticStripeReader2.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IClaimedMagneticStripeReader2")) {
            if ((queryResult := this.QueryInterface(IClaimedMagneticStripeReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedMagneticStripeReader2 := IClaimedMagneticStripeReader2(outPtr)
        }

        return this.__IClaimedMagneticStripeReader2.remove_Closed(token)
    }

    /**
     * Releases the exclusive claim to the magnetic strip reader.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedmagneticstripereader.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
