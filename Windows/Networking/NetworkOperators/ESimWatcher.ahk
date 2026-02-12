#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ESimWatcher.ahk
#Include .\ESimAddedEventArgs.ahk
#Include .\ESimRemovedEventArgs.ahk
#Include .\ESimUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A class used to enumerate the eSIMs carried by a device and to watch for eSIMs being added to the device, removed from it, or updated.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimwatcher
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the eSIM watcher.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Occurs when an [ESim](esim.md) is added to the device.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @type {TypedEventHandler<ESimWatcher, ESimAddedEventArgs>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f99b94ba-d4d0-5c43-b174-ffd7e6e5131c}"),
                    ESimWatcher,
                    ESimAddedEventArgs
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Occurs when the watcher has finished enumerating the collection of [ESim](esim.md) objects carried by the device.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @type {TypedEventHandler<ESimWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b52d4068-1dda-5baa-b76b-a7bc478db5f2}"),
                    ESimWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Occurs when an [ESim](esim.md) is removed from the device.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @type {TypedEventHandler<ESimWatcher, ESimRemovedEventArgs>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a8b7e917-3ac3-54e1-9e26-21f83c6097d2}"),
                    ESimWatcher,
                    ESimRemovedEventArgs
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * Occurs when the eSIM watcher is stopped.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @type {TypedEventHandler<ESimWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b52d4068-1dda-5baa-b76b-a7bc478db5f2}"),
                    ESimWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

    /**
     * Occurs when an [ESim](esim.md) on the device is updated.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @type {TypedEventHandler<ESimWatcher, ESimUpdatedEventArgs>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e93527e9-ea10-5aa7-b8aa-fea866294704}"),
                    ESimWatcher,
                    ESimUpdatedEventArgs
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAddedToken")) {
            this.remove_Added(this.__OnAddedToken)
            this.__OnAdded.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnRemovedToken")) {
            this.remove_Removed(this.__OnRemovedToken)
            this.__OnRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.get_Status()
    }

    /**
     * Starts the eSIM watcher watching for eSIMs being added to the device, removed from it, or updated.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimwatcher.start
     */
    Start() {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.Start()
    }

    /**
     * Stops the eSIM watcher watching for eSIMs being added to the device, removed from it, or updated.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<ESimWatcher, ESimAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ESimWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ESimWatcher, ESimRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ESimWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ESimWatcher, ESimUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IESimWatcher")) {
            if ((queryResult := this.QueryInterface(IESimWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimWatcher := IESimWatcher(outPtr)
        }

        return this.__IESimWatcher.remove_Updated(token)
    }

;@endregion Instance Methods
}
