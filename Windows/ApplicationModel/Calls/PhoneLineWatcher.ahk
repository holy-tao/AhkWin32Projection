#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLineWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PhoneLineWatcher.ahk
#Include .\PhoneLineWatcherEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a class that monitors for new/removed/updated phone lines on the device and notifies listeners about any changes.
 * @remarks
 * A phone line is a line that a user can use to either receive inbound or place outbound phone calls. A single device can have multiple lines. For example, the system creates a separate line specifically for VoIP applications that enables initiating an outbound call.
 * 
 * The system automatically detects the available lines on boot and then dynamically detects lines as lines are created or changed. The PhoneLineWatcher class provides a mechanism for applications to receive events as new phone lines are detected and react to the changes.
 * 
 * This class implements the watcher pattern.
 * 
 * You can retrieve an instance of this class by calling [RequestLineWatcher](phonecallstore_requestlinewatcher_489228512.md).
 * 
 * The following example shows how to enumerate through all the current phone lines. 
 * 
 * 
 * 
 * [!code-csharp[GetLinesCS](../windows.applicationmodel.calls/code/ApplicationModel.Calls/cs/Scenario1.cs#SnippetGetLinesCS)]
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinewatcher
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLineWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLineWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get the current status of the [PhoneLineWatcher](phonelinewatcher.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinewatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Occurs when the [PhoneLineWatcher](phonelinewatcher.md) instance detects a new phone line on the device.
     * @type {TypedEventHandler<PhoneLineWatcher, PhoneLineWatcherEventArgs>}
    */
    OnLineAdded {
        get {
            if(!this.HasProp("__OnLineAdded")){
                this.__OnLineAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{727cff26-a887-5361-8924-95f7bab4e25d}"),
                    PhoneLineWatcher,
                    PhoneLineWatcherEventArgs
                )
                this.__OnLineAddedToken := this.add_LineAdded(this.__OnLineAdded.iface)
            }
            return this.__OnLineAdded
        }
    }

    /**
     * Occurs when the [PhoneLineWatcher](phonelinewatcher.md) instance detects that a phone line has been removed from the device.
     * @remarks
     * In general, cellular lines can never be removed. This event is more likely to occur when a VoIP line is removed, which typically happens when the associated applications is uninstalled.
     * @type {TypedEventHandler<PhoneLineWatcher, PhoneLineWatcherEventArgs>}
    */
    OnLineRemoved {
        get {
            if(!this.HasProp("__OnLineRemoved")){
                this.__OnLineRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{727cff26-a887-5361-8924-95f7bab4e25d}"),
                    PhoneLineWatcher,
                    PhoneLineWatcherEventArgs
                )
                this.__OnLineRemovedToken := this.add_LineRemoved(this.__OnLineRemoved.iface)
            }
            return this.__OnLineRemoved
        }
    }

    /**
     * Occurs when the [PhoneLineWatcher](phonelinewatcher.md) instance detects that a phone line has been updated on the device.
     * @remarks
     * Cases where a phone line is updated include when the metadata for a phone line changes, such as with voice mail count or registration status.
     * @type {TypedEventHandler<PhoneLineWatcher, PhoneLineWatcherEventArgs>}
    */
    OnLineUpdated {
        get {
            if(!this.HasProp("__OnLineUpdated")){
                this.__OnLineUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{727cff26-a887-5361-8924-95f7bab4e25d}"),
                    PhoneLineWatcher,
                    PhoneLineWatcherEventArgs
                )
                this.__OnLineUpdatedToken := this.add_LineUpdated(this.__OnLineUpdated.iface)
            }
            return this.__OnLineUpdated
        }
    }

    /**
     * Occurs when the [PhoneLineWatcher](phonelinewatcher.md) instance completes an enumeration of all the phone lines on the device.
     * @remarks
     * Phone lines can be added, removed, or updated to a device at any time. This event only indicates that an enumeration of the phone lines has been completed at a given point in time.
     * 
     * This event is only generated once per [PhoneLineWatcher](phonelinewatcher.md) instance.
     * @type {TypedEventHandler<PhoneLineWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d55ce56a-23ac-5185-bf76-2808ec83c78b}"),
                    PhoneLineWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Occurs when the [PhoneLineWatcher](phonelinewatcher.md) instance stops monitoring the device for changes to the phone lines.
     * @type {TypedEventHandler<PhoneLineWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d55ce56a-23ac-5185-bf76-2808ec83c78b}"),
                    PhoneLineWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLineAddedToken")) {
            this.remove_LineAdded(this.__OnLineAddedToken)
            this.__OnLineAdded.iface.Dispose()
        }

        if(this.HasProp("__OnLineRemovedToken")) {
            this.remove_LineRemoved(this.__OnLineRemovedToken)
            this.__OnLineRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnLineUpdatedToken")) {
            this.remove_LineUpdated(this.__OnLineUpdatedToken)
            this.__OnLineUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts listening for changes to the phone lines on the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinewatcher.start
     */
    Start() {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.Start()
    }

    /**
     * Stops listening for changes to the phone lines on the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinewatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLineWatcher, PhoneLineWatcherEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LineAdded(handler) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.add_LineAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LineAdded(token) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.remove_LineAdded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLineWatcher, PhoneLineWatcherEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LineRemoved(handler) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.add_LineRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LineRemoved(token) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.remove_LineRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLineWatcher, PhoneLineWatcherEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LineUpdated(handler) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.add_LineUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LineUpdated(token) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.remove_LineUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLineWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLineWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPhoneLineWatcher")) {
            if ((queryResult := this.QueryInterface(IPhoneLineWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineWatcher := IPhoneLineWatcher(outPtr)
        }

        return this.__IPhoneLineWatcher.get_Status()
    }

;@endregion Instance Methods
}
