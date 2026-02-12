#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerProviderConnection.ahk
#Include .\IBarcodeScannerProviderConnection2.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\BarcodeScannerProviderConnection.ahk
#Include .\BarcodeScannerEnableScannerRequestEventArgs.ahk
#Include .\BarcodeScannerDisableScannerRequestEventArgs.ahk
#Include .\BarcodeScannerSetActiveSymbologiesRequestEventArgs.ahk
#Include .\BarcodeScannerStartSoftwareTriggerRequestEventArgs.ahk
#Include .\BarcodeScannerStopSoftwareTriggerRequestEventArgs.ahk
#Include .\BarcodeScannerGetSymbologyAttributesRequestEventArgs.ahk
#Include .\BarcodeScannerSetSymbologyAttributesRequestEventArgs.ahk
#Include .\BarcodeScannerHideVideoPreviewRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a connection to a barcode scanner provider client.
 * @remarks
 * Use the instance of this class provided by the Connection property of the BarcodeScannerProviderTriggerDetails object passed to your background task on activation.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerProviderConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerProviderConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerProviderConnection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the barcode scanner provider connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the video device ID that represents the camera lens associated with the barcode scanner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.videodeviceid
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
    }

    /**
     * Gets the supported symbologies of the barcode scanner provider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.supportedsymbologies
     * @type {IVector<Integer>} 
     */
    SupportedSymbologies {
        get => this.get_SupportedSymbologies()
    }

    /**
     * Gets or sets the company name of the barcode scanner provider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.companyname
     * @type {HSTRING} 
     */
    CompanyName {
        get => this.get_CompanyName()
        set => this.put_CompanyName(value)
    }

    /**
     * Gets or sets the name of the barcode scanner provider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the version of the barcode scanner provider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.version
     * @type {HSTRING} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * Raised when the client app attempts to enable the barcode scanner.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerEnableScannerRequestEventArgs>}
    */
    OnEnableScannerRequested {
        get {
            if(!this.HasProp("__OnEnableScannerRequested")){
                this.__OnEnableScannerRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{44f1a2dc-3f2a-5338-b58e-fcc2709d07a7}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerEnableScannerRequestEventArgs
                )
                this.__OnEnableScannerRequestedToken := this.add_EnableScannerRequested(this.__OnEnableScannerRequested.iface)
            }
            return this.__OnEnableScannerRequested
        }
    }

    /**
     * Raised when the client app attempts to disable the barcode scanner.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerDisableScannerRequestEventArgs>}
    */
    OnDisableScannerRequested {
        get {
            if(!this.HasProp("__OnDisableScannerRequested")){
                this.__OnDisableScannerRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d801fc9f-851f-5a8a-9558-a3df780339b0}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerDisableScannerRequestEventArgs
                )
                this.__OnDisableScannerRequestedToken := this.add_DisableScannerRequested(this.__OnDisableScannerRequested.iface)
            }
            return this.__OnDisableScannerRequested
        }
    }

    /**
     * Raised when the client app attempts to set the barcode symbologies for the device to use.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerSetActiveSymbologiesRequestEventArgs>}
    */
    OnSetActiveSymbologiesRequested {
        get {
            if(!this.HasProp("__OnSetActiveSymbologiesRequested")){
                this.__OnSetActiveSymbologiesRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9dc3de50-d6f6-58b2-9093-d6090b8323fe}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerSetActiveSymbologiesRequestEventArgs
                )
                this.__OnSetActiveSymbologiesRequestedToken := this.add_SetActiveSymbologiesRequested(this.__OnSetActiveSymbologiesRequested.iface)
            }
            return this.__OnSetActiveSymbologiesRequested
        }
    }

    /**
     * Raised when the client app attempts to signal the barcode scanner to start scanning.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerStartSoftwareTriggerRequestEventArgs>}
    */
    OnStartSoftwareTriggerRequested {
        get {
            if(!this.HasProp("__OnStartSoftwareTriggerRequested")){
                this.__OnStartSoftwareTriggerRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{16220e79-8b03-5498-9983-b93568921676}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerStartSoftwareTriggerRequestEventArgs
                )
                this.__OnStartSoftwareTriggerRequestedToken := this.add_StartSoftwareTriggerRequested(this.__OnStartSoftwareTriggerRequested.iface)
            }
            return this.__OnStartSoftwareTriggerRequested
        }
    }

    /**
     * Raised when the client app attempts to signal the barcode scanner to stop scanning.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerStopSoftwareTriggerRequestEventArgs>}
    */
    OnStopSoftwareTriggerRequested {
        get {
            if(!this.HasProp("__OnStopSoftwareTriggerRequested")){
                this.__OnStopSoftwareTriggerRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d695be73-bf91-5036-95d2-159032c94cb3}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerStopSoftwareTriggerRequestEventArgs
                )
                this.__OnStopSoftwareTriggerRequestedToken := this.add_StopSoftwareTriggerRequested(this.__OnStopSoftwareTriggerRequested.iface)
            }
            return this.__OnStopSoftwareTriggerRequested
        }
    }

    /**
     * Raised when the client app attempts to get the attributes of a barcode symbology.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerGetSymbologyAttributesRequestEventArgs>}
    */
    OnGetBarcodeSymbologyAttributesRequested {
        get {
            if(!this.HasProp("__OnGetBarcodeSymbologyAttributesRequested")){
                this.__OnGetBarcodeSymbologyAttributesRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e590f9b4-1481-5945-b5bd-0ab4b10a4b5f}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerGetSymbologyAttributesRequestEventArgs
                )
                this.__OnGetBarcodeSymbologyAttributesRequestedToken := this.add_GetBarcodeSymbologyAttributesRequested(this.__OnGetBarcodeSymbologyAttributesRequested.iface)
            }
            return this.__OnGetBarcodeSymbologyAttributesRequested
        }
    }

    /**
     * Raised when the client app attempts to set the attributes of a barcode symbology.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerSetSymbologyAttributesRequestEventArgs>}
    */
    OnSetBarcodeSymbologyAttributesRequested {
        get {
            if(!this.HasProp("__OnSetBarcodeSymbologyAttributesRequested")){
                this.__OnSetBarcodeSymbologyAttributesRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0c9b13f0-5d9f-56ca-8989-0746bd811a21}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerSetSymbologyAttributesRequestEventArgs
                )
                this.__OnSetBarcodeSymbologyAttributesRequestedToken := this.add_SetBarcodeSymbologyAttributesRequested(this.__OnSetBarcodeSymbologyAttributesRequested.iface)
            }
            return this.__OnSetBarcodeSymbologyAttributesRequested
        }
    }

    /**
     * Raised when the client app attempts to hide a video preview window.
     * @type {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerHideVideoPreviewRequestEventArgs>}
    */
    OnHideVideoPreviewRequested {
        get {
            if(!this.HasProp("__OnHideVideoPreviewRequested")){
                this.__OnHideVideoPreviewRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f3679d04-d6d9-5e95-b674-1135bfd4f42f}"),
                    BarcodeScannerProviderConnection,
                    BarcodeScannerHideVideoPreviewRequestEventArgs
                )
                this.__OnHideVideoPreviewRequestedToken := this.add_HideVideoPreviewRequested(this.__OnHideVideoPreviewRequested.iface)
            }
            return this.__OnHideVideoPreviewRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnEnableScannerRequestedToken")) {
            this.remove_EnableScannerRequested(this.__OnEnableScannerRequestedToken)
            this.__OnEnableScannerRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDisableScannerRequestedToken")) {
            this.remove_DisableScannerRequested(this.__OnDisableScannerRequestedToken)
            this.__OnDisableScannerRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSetActiveSymbologiesRequestedToken")) {
            this.remove_SetActiveSymbologiesRequested(this.__OnSetActiveSymbologiesRequestedToken)
            this.__OnSetActiveSymbologiesRequested.iface.Dispose()
        }

        if(this.HasProp("__OnStartSoftwareTriggerRequestedToken")) {
            this.remove_StartSoftwareTriggerRequested(this.__OnStartSoftwareTriggerRequestedToken)
            this.__OnStartSoftwareTriggerRequested.iface.Dispose()
        }

        if(this.HasProp("__OnStopSoftwareTriggerRequestedToken")) {
            this.remove_StopSoftwareTriggerRequested(this.__OnStopSoftwareTriggerRequestedToken)
            this.__OnStopSoftwareTriggerRequested.iface.Dispose()
        }

        if(this.HasProp("__OnGetBarcodeSymbologyAttributesRequestedToken")) {
            this.remove_GetBarcodeSymbologyAttributesRequested(this.__OnGetBarcodeSymbologyAttributesRequestedToken)
            this.__OnGetBarcodeSymbologyAttributesRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSetBarcodeSymbologyAttributesRequestedToken")) {
            this.remove_SetBarcodeSymbologyAttributesRequested(this.__OnSetBarcodeSymbologyAttributesRequestedToken)
            this.__OnSetBarcodeSymbologyAttributesRequested.iface.Dispose()
        }

        if(this.HasProp("__OnHideVideoPreviewRequestedToken")) {
            this.remove_HideVideoPreviewRequested(this.__OnHideVideoPreviewRequestedToken)
            this.__OnHideVideoPreviewRequested.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoDeviceId() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.get_VideoDeviceId()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SupportedSymbologies() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.get_SupportedSymbologies()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CompanyName() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.get_CompanyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CompanyName(value) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.put_CompanyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Version() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.get_Version()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Version(value) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.put_Version(value)
    }

    /**
     * Starts the connection for data transfer.
     * @remarks
     * Call this method to indicate that all event handlers have been set and the provider is ready to start handling requests.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.start
     */
    Start() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.Start()
    }

    /**
     * Sends a barcode scanner data report to the client app.
     * @param {BarcodeScannerReport} report The barcode scanner data.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.reportscanneddataasync
     */
    ReportScannedDataAsync(report) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.ReportScannedDataAsync(report)
    }

    /**
     * Sends a barcode scanner trigger state update to the client app during a scanning operation.
     * @param {Integer} state The barcode scanner trigger state. Possible values are defined in [BarcodeScannerTriggerState](barcodescannertriggerstate.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.reporttriggerstateasync
     */
    ReportTriggerStateAsync(state) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.ReportTriggerStateAsync(state)
    }

    /**
     * Sends an error report to the client app.
     * @param {UnifiedPosErrorData} errorData The error information.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.reporterrorasync
     */
    ReportErrorAsync(errorData) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.ReportErrorAsync(errorData)
    }

    /**
     * Sends an error report to the client app.
     * @param {UnifiedPosErrorData} errorData The error information.
     * @param {Boolean} isRetriable 
     * @param {BarcodeScannerReport} scanReport 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.reporterrorasync
     */
    ReportErrorAsyncWithScanReport(errorData, isRetriable, scanReport) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.ReportErrorAsyncWithScanReport(errorData, isRetriable, scanReport)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerEnableScannerRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnableScannerRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_EnableScannerRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnableScannerRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_EnableScannerRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerDisableScannerRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisableScannerRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_DisableScannerRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisableScannerRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_DisableScannerRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerSetActiveSymbologiesRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SetActiveSymbologiesRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_SetActiveSymbologiesRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SetActiveSymbologiesRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_SetActiveSymbologiesRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerStartSoftwareTriggerRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StartSoftwareTriggerRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_StartSoftwareTriggerRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StartSoftwareTriggerRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_StartSoftwareTriggerRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerStopSoftwareTriggerRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StopSoftwareTriggerRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_StopSoftwareTriggerRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StopSoftwareTriggerRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_StopSoftwareTriggerRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerGetSymbologyAttributesRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GetBarcodeSymbologyAttributesRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_GetBarcodeSymbologyAttributesRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GetBarcodeSymbologyAttributesRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_GetBarcodeSymbologyAttributesRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerSetSymbologyAttributesRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SetBarcodeSymbologyAttributesRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_SetBarcodeSymbologyAttributesRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SetBarcodeSymbologyAttributesRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_SetBarcodeSymbologyAttributesRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerProviderConnection, BarcodeScannerHideVideoPreviewRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HideVideoPreviewRequested(handler) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.add_HideVideoPreviewRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HideVideoPreviewRequested(token) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection := IBarcodeScannerProviderConnection(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection.remove_HideVideoPreviewRequested(token)
    }

    /**
     * Creates a new [BarcodeScannerFrameReader](barcodescannerframereader.md) instance that returns frames in the preferred format when possible.
     * @remarks
     * If the requested format cannot be returned by the camera, frames will be returned using a default supported format. To ensure that the returned frames conform to a particular format, check the [Format](barcodescannervideoframe_format.md) property on the returned [BarcodeScannerVideoFrame](barcodescannervideoframe.md) objects.
     * @returns {IAsyncOperation<BarcodeScannerFrameReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.createframereaderasync
     */
    CreateFrameReaderAsync() {
        if (!this.HasProp("__IBarcodeScannerProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection2 := IBarcodeScannerProviderConnection2(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection2.CreateFrameReaderAsync()
    }

    /**
     * Creates a new [BarcodeScannerFrameReader](barcodescannerframereader.md) instance that returns frames in the preferred format and size when possible.
     * @remarks
     * If the requested format or size cannot be returned by the camera, frames will be returned using a default supported format and/or size. To ensure that the returned frames conform to a particular format or size, check the [Format](barcodescannervideoframe_format.md), [Height](barcodescannervideoframe_height.md) and [Width](barcodescannervideoframe_width.md) properties on the returned [BarcodeScannerVideoFrame](barcodescannervideoframe.md) objects.
     * @param {Integer} preferredFormat_ The preferred image format as a [BitmapPixelFormat](../windows.graphics.imaging/bitmappixelformat.md).
     * @returns {IAsyncOperation<BarcodeScannerFrameReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.createframereaderasync
     */
    CreateFrameReaderWithFormatAsync(preferredFormat_) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection2 := IBarcodeScannerProviderConnection2(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection2.CreateFrameReaderWithFormatAsync(preferredFormat_)
    }

    /**
     * Creates a new [BarcodeScannerFrameReader](barcodescannerframereader.md) instance.
     * @param {Integer} preferredFormat_ 
     * @param {BitmapSize} preferredSize 
     * @returns {IAsyncOperation<BarcodeScannerFrameReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.createframereaderasync
     */
    CreateFrameReaderWithFormatAndSizeAsync(preferredFormat_, preferredSize) {
        if (!this.HasProp("__IBarcodeScannerProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderConnection2 := IBarcodeScannerProviderConnection2(outPtr)
        }

        return this.__IBarcodeScannerProviderConnection2.CreateFrameReaderWithFormatAndSizeAsync(preferredFormat_, preferredSize)
    }

    /**
     * Closes the barcode scanner provider connection session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerproviderconnection.close
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
