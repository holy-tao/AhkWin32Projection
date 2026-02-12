#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedPosPrinter.ahk
#Include .\IClaimedPosPrinter2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ClaimedPosPrinter.ahk
#Include .\PosPrinterReleaseDeviceRequestedEventArgs.ahk
#Include .\ClaimedPosPrinterClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represent a point-of-service printer that has been claimed for use.
 * @remarks
 * To get an instance of the ClaimedPosPrinter class, use the [PosPrinter.ClaimPrinterAsync](posprinter_claimprinterasync_1994037670.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedPosPrinter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedPosPrinter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedPosPrinter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier string of the claimed point-of-service printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets whether the printer is powered on for use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets or sets a numeric value that indicates the character set that the application wants to use for printing characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.characterset
     * @type {Integer} 
     */
    CharacterSet {
        get => this.get_CharacterSet()
        set => this.put_CharacterSet(value)
    }

    /**
     * Gets whether the cover of the point-of-service printer is currently open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.iscoveropen
     * @type {Boolean} 
     */
    IsCoverOpen {
        get => this.get_IsCoverOpen()
    }

    /**
     * Gets or sets whether the driver or provider can map Unicode characters to characters that the point-of-service printer can print, or just sends the low byte of the Unicode character to the printer directly.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.ischaractersetmappingenabled
     * @type {Boolean} 
     */
    IsCharacterSetMappingEnabled {
        get => this.get_IsCharacterSetMappingEnabled()
        set => this.put_IsCharacterSetMappingEnabled(value)
    }

    /**
     * Gets or sets the mapping mode of the point-of-service printer that the app wants to use. The mapping mode defines the unit of measure used for other printer properties, such as line height and line spacing.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.mapmode
     * @type {Integer} 
     */
    MapMode {
        get => this.get_MapMode()
        set => this.put_MapMode(value)
    }

    /**
     * Gets an object that represents the receipt station for a claimed point-of-service printer.
     * 
     * The receipt station is used to print transaction information that is typically given to the customer, or for store reports. The receipt station contains either a knife to automatically cut the paper between transactions, or a tear bar to manually cut the paper.
     * 
     * There is only one instance of this object per [ClaimedPosPrinter](claimedposprinter.md) instance. Additionally, this is only valid to access if [ReceiptPrinterCapabilities.IsPrinterPresent](receiptprintercapabilities_isprinterpresent.md) indicates it is present.
     * @remarks
     * You should check the value of the [ReceiptPrinterCapabilities.IsPrinterPresent](receiptprintercapabilities_isprinterpresent.md) property before you try to use the ClaimedPosPrinter.Receipt property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.receipt
     * @type {ClaimedReceiptPrinter} 
     */
    Receipt {
        get => this.get_Receipt()
    }

    /**
     * Gets an object that represents the slip station for a claimed point-of-service printer.
     * 
     * The slip station is used to print information on a form that is typically given to the customer, or to print validation information on a form. The form type is usually a check or credit card slip.
     * 
     * There is only one instance of this object per [ClaimedPosPrinter](claimedposprinter.md) instance. Additionally, this is only valid to access if [SlipPrinterCapabilities.IsPrinterPresent](slipprintercapabilities_isprinterpresent.md) indicates it is present.
     * @remarks
     * You should check the value of the [SlipPrinterCapabilities.IsPrinterPresent](slipprintercapabilities_isprinterpresent.md) property before you try to use the ClaimedPosPrinter.Slip property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.slip
     * @type {ClaimedSlipPrinter} 
     */
    Slip {
        get => this.get_Slip()
    }

    /**
     * Gets an object that represents the journal station for a claimed point-of-service printer.
     * 
     * The journal station is used for simple text messages that log transaction and activity information kept by the store for audit and other purposes.
     * 
     * There is only one instance of this object per [ClaimedPosPrinter](claimedposprinter.md) instance. Additionally, this is only valid to access if [JournalPrinterCapabilities.IsPrinterPresent](journalprintercapabilities_isprinterpresent.md) indicates it is present.
     * @remarks
     * You should check the value of the [JournalPrinterCapabilities.IsPrinterPresent](journalprintercapabilities_isprinterpresent.md) property before you try to use the ClaimedPosPrinter.Journal property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.journal
     * @type {ClaimedJournalPrinter} 
     */
    Journal {
        get => this.get_Journal()
    }

    /**
     * Occurs when a point-of-service printer gets a request to release its exclusive claim.
     * @remarks
     * When this event occurs, the app has a two-second window of time to call the [RetainDeviceAsync](claimedposprinter_retaindeviceasync_1460106534.md) so that the app can keep exclusive claim on the device. Alternatively, the app can call [Close](claimedposprinter_close_811482585.md) to release the claim and end the window immediately.
     * @type {TypedEventHandler<ClaimedPosPrinter, PosPrinterReleaseDeviceRequestedEventArgs>}
    */
    OnReleaseDeviceRequested {
        get {
            if(!this.HasProp("__OnReleaseDeviceRequested")){
                this.__OnReleaseDeviceRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{31424f6f-cfeb-5031-8a95-bea59b09e584}"),
                    ClaimedPosPrinter,
                    PosPrinterReleaseDeviceRequestedEventArgs
                )
                this.__OnReleaseDeviceRequestedToken := this.add_ReleaseDeviceRequested(this.__OnReleaseDeviceRequested.iface)
            }
            return this.__OnReleaseDeviceRequested
        }
    }

    /**
     * Event that is raised when the **ClaimedPosPrinter** is closed.
     * @remarks
     * When an app is suspended, all **ClaimedPosPrinter** objects are closed. This event can be useful to determine when printer connections need to be re-established.
     * @type {TypedEventHandler<ClaimedPosPrinter, ClaimedPosPrinterClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5a2247b1-84ac-55f3-a26b-d37c551ad58e}"),
                    ClaimedPosPrinter,
                    ClaimedPosPrinterClosedEventArgs
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
        if(this.HasProp("__OnReleaseDeviceRequestedToken")) {
            this.remove_ReleaseDeviceRequested(this.__OnReleaseDeviceRequestedToken)
            this.__OnReleaseDeviceRequested.iface.Dispose()
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
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_IsEnabled()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSet(value) {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.put_CharacterSet(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSet() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_CharacterSet()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCoverOpen() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_IsCoverOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCharacterSetMappingEnabled(value) {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.put_IsCharacterSetMappingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCharacterSetMappingEnabled() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_IsCharacterSetMappingEnabled()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MapMode(value) {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.put_MapMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MapMode() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_MapMode()
    }

    /**
     * 
     * @returns {ClaimedReceiptPrinter} 
     */
    get_Receipt() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_Receipt()
    }

    /**
     * 
     * @returns {ClaimedSlipPrinter} 
     */
    get_Slip() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_Slip()
    }

    /**
     * 
     * @returns {ClaimedJournalPrinter} 
     */
    get_Journal() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.get_Journal()
    }

    /**
     * Notifies the underlying hardware asynchronously to power on for use.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.enableasync
     */
    EnableAsync() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.EnableAsync()
    }

    /**
     * Notifies the underlying hardware to turn off.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.disableasync
     */
    DisableAsync() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.DisableAsync()
    }

    /**
     * Retains the claim on the point-of-service printer asynchronously, usually in response to the [ReleaseDeviceRequested](claimedposprinter_releasedevicerequested.md) event.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.retaindeviceasync
     */
    RetainDeviceAsync() {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.RetainDeviceAsync()
    }

    /**
     * Resets the specified statistics to zero for all statistics for the point-of-service printer that can be reset.
     * @remarks
     * This method represents a change in state.
     * @param {IIterable<HSTRING>} statisticsCategories A list of the names of the statistics that you want to reset.
     * 
     * 
     * + An empty string ("") retrieves all statistics.
     * + "U_" retrieves all UnifiedPOS-defined statistics.
     * + "M_" retrieves all manufacturer-defined statistics.
     * + *Name1* and/or *Name2* retrieves specific named statistics as defined by the UnifiedPOS or manufacturer.
     * + Any combination of individual and group names (*Name3*, "U_", "M_").
     *  .
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.resetstatisticsasync
     */
    ResetStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.ResetStatisticsAsync(statisticsCategories)
    }

    /**
     * Updates the specified statistics for the point-of-service printer.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} statistics The statistics to update.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.updatestatisticsasync
     */
    UpdateStatisticsAsync(statistics) {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.UpdateStatisticsAsync(statistics)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedPosPrinter, PosPrinterReleaseDeviceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.add_ReleaseDeviceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReleaseDeviceRequested(token) {
        if (!this.HasProp("__IClaimedPosPrinter")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter := IClaimedPosPrinter(outPtr)
        }

        return this.__IClaimedPosPrinter.remove_ReleaseDeviceRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedPosPrinter, ClaimedPosPrinterClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IClaimedPosPrinter2")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter2 := IClaimedPosPrinter2(outPtr)
        }

        return this.__IClaimedPosPrinter2.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IClaimedPosPrinter2")) {
            if ((queryResult := this.QueryInterface(IClaimedPosPrinter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedPosPrinter2 := IClaimedPosPrinter2(outPtr)
        }

        return this.__IClaimedPosPrinter2.remove_Closed(token)
    }

    /**
     * Disposes the claimed point-of-service printer object synchronously, releases the exclusive claim on the printer and disables it. For C++ and JavaScript, use Close(). For C# and Visual Basic, use Dispose().
     * @remarks
     * You cannot call [Close](../windows.foundation/iclosable_close_811482585.md) methods through Visual C++ component extensions (C++/CX) on Windows Runtime class instances where the class implemented [IClosable](../windows.foundation/iclosable.md). Instead, Visual C++ component extensions (C++/CX) code for runtime classes should call the destructor or set the last reference to **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedposprinter.close
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
