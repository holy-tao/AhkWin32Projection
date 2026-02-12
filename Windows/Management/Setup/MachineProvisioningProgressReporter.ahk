#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMachineProvisioningProgressReporter.ahk
#Include .\IMachineProvisioningProgressReporterStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MachineProvisioningProgressReporter.ahk
#Include .\DeploymentSessionStateChangedEventArgs.ahk
#Include .\DeploymentSessionConnectionChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class MachineProvisioningProgressReporter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMachineProvisioningProgressReporter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMachineProvisioningProgressReporter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Uri} launchUri 
     * @param {DeploymentSessionHeartbeatRequested} heartbeatHandler 
     * @returns {MachineProvisioningProgressReporter} 
     */
    static GetForLaunchUri(launchUri, heartbeatHandler) {
        if (!MachineProvisioningProgressReporter.HasProp("__IMachineProvisioningProgressReporterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Setup.MachineProvisioningProgressReporter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMachineProvisioningProgressReporterStatics.IID)
            MachineProvisioningProgressReporter.__IMachineProvisioningProgressReporterStatics := IMachineProvisioningProgressReporterStatics(factoryPtr)
        }

        return MachineProvisioningProgressReporter.__IMachineProvisioningProgressReporterStatics.GetForLaunchUri(launchUri, heartbeatHandler)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Guid} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {Integer} 
     */
    SessionConnection {
        get => this.get_SessionConnection()
    }

    /**
     * @type {Integer} 
     */
    SessionState {
        get => this.get_SessionState()
    }

    OnSessionStateChanged {
        get {
            if(!this.HasProp("__OnSessionStateChanged")){
                this.__OnSessionStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b0ab7b86-bb33-5a2c-9417-61dc56e65665}"),
                    MachineProvisioningProgressReporter,
                    DeploymentSessionStateChangedEventArgs
                )
                this.__OnSessionStateChangedToken := this.add_SessionStateChanged(this.__OnSessionStateChanged.iface)
            }
            return this.__OnSessionStateChanged
        }
    }

    OnSessionConnectionChanged {
        get {
            if(!this.HasProp("__OnSessionConnectionChanged")){
                this.__OnSessionConnectionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3091fe0b-29c3-596c-bae3-aca1aed1a4dc}"),
                    MachineProvisioningProgressReporter,
                    DeploymentSessionConnectionChangedEventArgs
                )
                this.__OnSessionConnectionChangedToken := this.add_SessionConnectionChanged(this.__OnSessionConnectionChanged.iface)
            }
            return this.__OnSessionConnectionChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSessionStateChangedToken")) {
            this.remove_SessionStateChanged(this.__OnSessionStateChangedToken)
            this.__OnSessionStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSessionConnectionChangedToken")) {
            this.remove_SessionConnectionChanged(this.__OnSessionConnectionChangedToken)
            this.__OnSessionConnectionChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionId() {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.get_SessionId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionConnection() {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.get_SessionConnection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionState() {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.get_SessionState()
    }

    /**
     * 
     * @param {TypedEventHandler<MachineProvisioningProgressReporter, DeploymentSessionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionStateChanged(handler) {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.add_SessionStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionStateChanged(token) {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.remove_SessionStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MachineProvisioningProgressReporter, DeploymentSessionConnectionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionConnectionChanged(handler) {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.add_SessionConnectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionConnectionChanged(token) {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.remove_SessionConnectionChanged(token)
    }

    /**
     * 
     * @param {AgentProvisioningProgressReport} updateReport 
     * @returns {HRESULT} 
     */
    ReportProgress(updateReport) {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.ReportProgress(updateReport)
    }

    /**
     * 
     * @returns {IAsyncOperation<DevicePreparationExecutionContext>} 
     */
    GetDevicePreparationExecutionContextAsync() {
        if (!this.HasProp("__IMachineProvisioningProgressReporter")) {
            if ((queryResult := this.QueryInterface(IMachineProvisioningProgressReporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMachineProvisioningProgressReporter := IMachineProvisioningProgressReporter(outPtr)
        }

        return this.__IMachineProvisioningProgressReporter.GetDevicePreparationExecutionContextAsync()
    }

;@endregion Instance Methods
}
