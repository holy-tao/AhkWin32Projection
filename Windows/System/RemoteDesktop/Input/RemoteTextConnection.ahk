#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteTextConnection.ahk
#Include .\IRemoteTextConnection2.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IRemoteTextConnectionFactory.ahk
#Include .\IRemoteTextConnectionFactory2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a connection between a Remote Desktop client application and the local computer's text input system. This connection can be used to enable text input virtualization.
 * @remarks
 * **RemoteTextConnection** is designed to enable text input virtualization with remote applications integrated with a local desktop. This scenario is called *Remote Programs* or *Remote Applications Integrated Locally (RAIL)*. Using **RemoteTextConnection** with full desktop remoting is not currently recommended and may result in undesirable behavior. When text input virtualization is enabled, built-in input methods provided by Windows (including IMEs) can be used for entering text in remote applications.
 * 
 * To enable text input virtualization, a Remote Desktop client application creates one **RemoteTextConnection** object for each remote session it connects to. Data packets are delivered through this object to and from the local computer's text input system in the following ways:
 * 
 * - The text input system sends data packets to the Remote Desktop client application via the [RemoteTextConnectionDataHandler](remotetextconnectiondatahandler.md) delegate. The Remote Desktop client application is responsible for creating this delegate and passing it to the [RemoteTextConnection](remotetextconnection_remotetextconnection_1474280690.md) constructor. The data packets from the text input system will conform to the RDP text input virtualization protocol. Messages received on this delegate will arrive on a background thread. When the client application receives data packets from the delegate, it should forward the packets to the remote RAIL server via the unidirectional, client-to-server [Dynamic Virtual Channel (DVC)](/windows/win32/termserv/dynamic-virtual-channels) for virtualized text input. This DVC is named `TextInput_ClientToServerDVC`.
 * 
 * - The Remote Desktop client application also needs to listen for data packets from the remote machine on the server-to-client text input DVC (named `TextInput_ServerToClientDVC`) and forward those data packets to the local computer's text input system via the [ReportDataReceived](remotetextconnection_reportdatareceived_1719701080.md) method. For more information about how Remote Desktop client applications support DVCs, see [Dynamic Virtual Channel (DVC)](/windows/win32/termserv/dynamic-virtual-channels) and the [tsvirtualchannels.h header file](/windows/win32/api/tsvirtualchannels/).
 * 
 * The only local input methods that **RemoteTextConnection** will integrate with remote applications are built-in input methods provided by Windows that use the next version of the [Text Services Framework](/windows/win32/tsf/text-services-framework) (including IMEs). These input methods are hosted by the text input system in a centralized process making integration feasible. Older Text Services Framework version 1 or IMM IMEs are not hosted in a centralized process and are not supported by text input virtualization. These older input methods must be installed directly on a remote system in order to work with applications remoted from that system. This is the same way Text Services Framework version 1 and IMM input methods are utilized when text input virtualization is not used.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnection
 * @namespace Windows.System.RemoteDesktop.Input
 * @version WindowsRuntime 1.4
 */
class RemoteTextConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteTextConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteTextConnection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [RemoteTextConnection](remotetextconnection.md) class specific to one remote session.
     * @param {Guid} connectionId Uniquely identifies a single remote session that the client application has connected to. The value only needs to be unique on the local system. The client will typically create this identifier using [CoCreateGuid](/windows/win32/api/combaseapi/nf-combaseapi-cocreateguid).
     * @param {RemoteTextConnectionDataHandler} pduForwarder Specifies a delegate that will be called back when the client machine text input system needs to send a message to a target on the remote machine.
     * @returns {RemoteTextConnection} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnection.#ctor
     */
    static CreateInstance(connectionId, pduForwarder) {
        if (!RemoteTextConnection.HasProp("__IRemoteTextConnectionFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Input.RemoteTextConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteTextConnectionFactory.IID)
            RemoteTextConnection.__IRemoteTextConnectionFactory := IRemoteTextConnectionFactory(factoryPtr)
        }

        return RemoteTextConnection.__IRemoteTextConnectionFactory.CreateInstance(connectionId, pduForwarder)
    }

    /**
     * 
     * @param {Guid} connectionId 
     * @param {RemoteTextConnectionDataHandler} pduForwarder 
     * @param {Integer} options 
     * @returns {RemoteTextConnection} 
     */
    static CreateInstance1(connectionId, pduForwarder, options) {
        if (!RemoteTextConnection.HasProp("__IRemoteTextConnectionFactory2")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Input.RemoteTextConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteTextConnectionFactory2.IID)
            RemoteTextConnection.__IRemoteTextConnectionFactory2 := IRemoteTextConnectionFactory2(factoryPtr)
        }

        return RemoteTextConnection.__IRemoteTextConnectionFactory2.CreateInstance(connectionId, pduForwarder, options)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Specifies whether text input virtualization is enabled for the Remote Desktop connection serviced by this **RemoteTextConnection** instance.
     * @remarks
     * If the Remote Desktop client application displays remote and local UI on the same thread, it may be desirable to set this value to false when the local UI has keyboard focus. This would enable built-in input methods provided by Windows to be used to enter text in the local UI. When this property is set to true, the built-in input methods will only work with the remote UI displayed on the foreground thread.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnection.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IRemoteTextConnection")) {
            if ((queryResult := this.QueryInterface(IRemoteTextConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteTextConnection := IRemoteTextConnection(outPtr)
        }

        return this.__IRemoteTextConnection.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IRemoteTextConnection")) {
            if ((queryResult := this.QueryInterface(IRemoteTextConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteTextConnection := IRemoteTextConnection(outPtr)
        }

        return this.__IRemoteTextConnection.put_IsEnabled(value)
    }

    /**
     * Registers a thread on which the Remote Desktop client application will present remote UI.
     * @remarks
     * When a registered thread becomes foreground, built-in input methods provided by Windows will communicate with the [RemoteTextConnection](remotetextconnection.md) that the thread was registered on, instead of with the local window. All local UI hosted on threads that have not been registered for text input virtualization via this method will continue to work with built-in input methods provided by Windows.
     * 
     * If a Remote Desktop client application hosts local and remote UI on the same thread, it may be necessary for the application to disable text input virtualization via the [IsEnabled](remotetextconnection_isenabled.md) property while the local UI is in focus.
     * @param {Integer} threadId The ID of a thread on which a remote application's content will be presented.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnection.registerthread
     */
    RegisterThread(threadId) {
        if (!this.HasProp("__IRemoteTextConnection")) {
            if ((queryResult := this.QueryInterface(IRemoteTextConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteTextConnection := IRemoteTextConnection(outPtr)
        }

        return this.__IRemoteTextConnection.RegisterThread(threadId)
    }

    /**
     * Unregisters a thread registered via [RegisterThread](remotetextconnection_registerthread_1329467690.md) when cleaning up, or when that thread will no longer host remote UI.
     * @param {Integer} threadId The ID of a thread that will no longer present remote content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnection.unregisterthread
     */
    UnregisterThread(threadId) {
        if (!this.HasProp("__IRemoteTextConnection")) {
            if ((queryResult := this.QueryInterface(IRemoteTextConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteTextConnection := IRemoteTextConnection(outPtr)
        }

        return this.__IRemoteTextConnection.UnregisterThread(threadId)
    }

    /**
     * Forwards a data packet received over the `TextInput_ServerToClientDVC` [Dynamic Virtual Channel (DVC)](/windows/win32/termserv/dynamic-virtual-channels) to the local machine’s text input service.
     * @param {Integer} pduData_length 
     * @param {Pointer<Integer>} pduData A memory buffer containing a data packet received over the `TextInput_ServerToClientDVC` DVC. The data packet conforms to the RDP text input virtualization protocol.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnection.reportdatareceived
     */
    ReportDataReceived(pduData_length, pduData) {
        if (!this.HasProp("__IRemoteTextConnection")) {
            if ((queryResult := this.QueryInterface(IRemoteTextConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteTextConnection := IRemoteTextConnection(outPtr)
        }

        return this.__IRemoteTextConnection.ReportDataReceived(pduData_length, pduData)
    }

    /**
     * 
     * @param {Integer} scanCode 
     * @param {Integer} attributes 
     * @returns {HRESULT} 
     */
    ReportPredictedKeyEvent(scanCode, attributes) {
        if (!this.HasProp("__IRemoteTextConnection2")) {
            if ((queryResult := this.QueryInterface(IRemoteTextConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteTextConnection2 := IRemoteTextConnection2(outPtr)
        }

        return this.__IRemoteTextConnection2.ReportPredictedKeyEvent(scanCode, attributes)
    }

    /**
     * Closes the [RemoteTextConnection](remotetextconnection.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnection.close
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
