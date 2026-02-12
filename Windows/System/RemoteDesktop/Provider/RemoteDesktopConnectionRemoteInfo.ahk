#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteDesktopConnectionRemoteInfo.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IRemoteDesktopConnectionRemoteInfoStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteDesktopConnectionRemoteInfo.ahk
#Include .\PerformLocalActionRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a remote desktop connection on the remote desktop.
  * 
  * > [!IMPORTANT]
  * > The **RemoteDesktopConnectionRemoteInfo** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * Get an instance of this class by calling [GetForLaunchUri](xref:Windows.System.RemoteDesktop.Provider.RemoteDesktopConnectionRemoteInfo.GetForLaunchUri(Windows.Foundation.Uri,Windows.UI.WindowId)).
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class RemoteDesktopConnectionRemoteInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteDesktopConnectionRemoteInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteDesktopConnectionRemoteInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a value indicating if the switching APIs of **RemoteDesktopConnectionRemoteInfo** are supported on the version of Windows the app is running on.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo.isswitchsupported
     */
    static IsSwitchSupported() {
        if (!RemoteDesktopConnectionRemoteInfo.HasProp("__IRemoteDesktopConnectionRemoteInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Provider.RemoteDesktopConnectionRemoteInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteDesktopConnectionRemoteInfoStatics.IID)
            RemoteDesktopConnectionRemoteInfo.__IRemoteDesktopConnectionRemoteInfoStatics := IRemoteDesktopConnectionRemoteInfoStatics(factoryPtr)
        }

        return RemoteDesktopConnectionRemoteInfo.__IRemoteDesktopConnectionRemoteInfoStatics.IsSwitchSupported()
    }

    /**
     * Retrieves a [RemoteDesktopConnectionRemoteInfo](/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo) associated with a remote desktop connection
     * @remarks
     * This call is made by the remote desktop host service running on the remote desktop.
     * @param {Uri} launchUri The launch URI containing information about the remote desktop session. This URI is passed over a network connection from the remote desktop client running on the local machine to the host service running on the remote machine.
     * @returns {RemoteDesktopConnectionRemoteInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo.getforlaunchuri
     */
    static GetForLaunchUri(launchUri) {
        if (!RemoteDesktopConnectionRemoteInfo.HasProp("__IRemoteDesktopConnectionRemoteInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Provider.RemoteDesktopConnectionRemoteInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteDesktopConnectionRemoteInfoStatics.IID)
            RemoteDesktopConnectionRemoteInfo.__IRemoteDesktopConnectionRemoteInfoStatics := IRemoteDesktopConnectionRemoteInfoStatics(factoryPtr)
        }

        return RemoteDesktopConnectionRemoteInfo.__IRemoteDesktopConnectionRemoteInfoStatics.GetForLaunchUri(launchUri)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSwitchToLocalSessionRequestedToken")) {
            this.remove_SwitchToLocalSessionRequested(this.__OnSwitchToLocalSessionRequestedToken)
            this.__OnSwitchToLocalSessionRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPerformLocalActionRequestedToken")) {
            this.remove_PerformLocalActionRequested(this.__OnPerformLocalActionRequestedToken)
            this.__OnPerformLocalActionRequested.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Notifies the OS on the remote desktop that the user has switched to the remote desktop, allowing the OS to display UI reflecting the switch.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo.reportswitched
     */
    ReportSwitched() {
        if (!this.HasProp("__IRemoteDesktopConnectionRemoteInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionRemoteInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionRemoteInfo := IRemoteDesktopConnectionRemoteInfo(outPtr)
        }

        return this.__IRemoteDesktopConnectionRemoteInfo.ReportSwitched()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteDesktopConnectionRemoteInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SwitchToLocalSessionRequested(handler) {
        if (!this.HasProp("__IRemoteDesktopConnectionRemoteInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionRemoteInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionRemoteInfo := IRemoteDesktopConnectionRemoteInfo(outPtr)
        }

        return this.__IRemoteDesktopConnectionRemoteInfo.add_SwitchToLocalSessionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SwitchToLocalSessionRequested(token) {
        if (!this.HasProp("__IRemoteDesktopConnectionRemoteInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionRemoteInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionRemoteInfo := IRemoteDesktopConnectionRemoteInfo(outPtr)
        }

        return this.__IRemoteDesktopConnectionRemoteInfo.remove_SwitchToLocalSessionRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteDesktopConnectionRemoteInfo, PerformLocalActionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PerformLocalActionRequested(handler) {
        if (!this.HasProp("__IRemoteDesktopConnectionRemoteInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionRemoteInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionRemoteInfo := IRemoteDesktopConnectionRemoteInfo(outPtr)
        }

        return this.__IRemoteDesktopConnectionRemoteInfo.add_PerformLocalActionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PerformLocalActionRequested(token) {
        if (!this.HasProp("__IRemoteDesktopConnectionRemoteInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionRemoteInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionRemoteInfo := IRemoteDesktopConnectionRemoteInfo(outPtr)
        }

        return this.__IRemoteDesktopConnectionRemoteInfo.remove_PerformLocalActionRequested(token)
    }

    /**
     * Closes the **RemoteDesktopConnectionRemoteInfo** and cleans up associated resources.
     * @remarks
     * For C++, use Close(). For C# and Visual Basic, use Dispose().
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo.close
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
