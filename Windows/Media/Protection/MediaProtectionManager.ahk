#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaProtectionManager.ahk
#Include .\ServiceRequestedEventHandler.ahk
#Include .\MediaProtectionManager.ahk
#Include .\ServiceRequestedEventArgs.ahk
#Include .\RebootNeededEventHandler.ahk
#Include .\ComponentLoadFailedEventHandler.ahk
#Include .\ComponentLoadFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains a content protection manager object for an application that handles protected media content.
 * @remarks
 * The MediaProtectionManager can be passed to the media playback infrastructure in either of two ways: 
 * + As an attribute for a `<video>` or `<audio>` tag using the [msSetMediaProtectionManager](/previous-versions/hh772532(v=vs.85)) method.
 * + Directly to a media playback API. The MediaProtectionManager object is notified of content enabler objects. These objects must be processed by the application, to establish access to protected content. Each MediaProtectionManager object is associated with a single instance of playback.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.mediaprotectionmanager
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class MediaProtectionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaProtectionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaProtectionManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a PropertySet object containing any properties attached to the protection manager.
     * @remarks
     * The following properties are defined:<table>
     *    <tr><th>Name</th><th>Type</th><th>Description</th></tr>
     *    <tr><td>Windows.Media.Protection.VideoFrameAccessCertificate</td><td>UINT8 Array</td><td>Application certificate for accessing frames in frame server mode.</td></tr>
     *    <tr><td>Windows.Media.Protection.MediaProtectionSystemId</td><td>GUID</td><td>Protection System ID</td></tr>
     *    <tr><td>Windows.Media.Protection.MediaProtectionSystemContext</td><td>UINT8 Array</td><td>Data associated with protection system for the current content.</td></tr>
     *    <tr><td>Windows.Media.Protection.MediaProtectionSystemIdMapping</td><td>IPropertySet</td><td>Returns a mapping of the protection system id to the string for activating the trusted input object. The string for the protection system id must be in the format of a GUID (include {}) in upper case. This maps to a class name in the content protection system.</td></tr>
     *    <tr><td>Windows.Media.Protection.MediaProtectionContainerGuid</td><td>GUID</td><td>Specifies the Digital Rights Management (DRM) scheme.</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.mediaprotectionmanager.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Fires when a service is requested.
     * @type {ServiceRequestedEventHandler}
    */
    OnServiceRequested {
        get {
            if(!this.HasProp("__OnServiceRequested")){
                this.__OnServiceRequested := WinRTEventHandler(
                    ServiceRequestedEventHandler,
                    ServiceRequestedEventHandler.IID,
                    MediaProtectionManager,
                    ServiceRequestedEventArgs
                )
                this.__OnServiceRequestedToken := this.add_ServiceRequested(this.__OnServiceRequested.iface)
            }
            return this.__OnServiceRequested
        }
    }

    /**
     * Fires when a reboot is needed after the component is renewed.
     * @type {RebootNeededEventHandler}
    */
    OnRebootNeeded {
        get {
            if(!this.HasProp("__OnRebootNeeded")){
                this.__OnRebootNeeded := WinRTEventHandler(
                    RebootNeededEventHandler,
                    RebootNeededEventHandler.IID,
                    MediaProtectionManager
                )
                this.__OnRebootNeededToken := this.add_RebootNeeded(this.__OnRebootNeeded.iface)
            }
            return this.__OnRebootNeeded
        }
    }

    /**
     * Fires when the load of binary data fails.
     * @type {ComponentLoadFailedEventHandler}
    */
    OnComponentLoadFailed {
        get {
            if(!this.HasProp("__OnComponentLoadFailed")){
                this.__OnComponentLoadFailed := WinRTEventHandler(
                    ComponentLoadFailedEventHandler,
                    ComponentLoadFailedEventHandler.IID,
                    MediaProtectionManager,
                    ComponentLoadFailedEventArgs
                )
                this.__OnComponentLoadFailedToken := this.add_ComponentLoadFailed(this.__OnComponentLoadFailed.iface)
            }
            return this.__OnComponentLoadFailed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaProtectionManager](mediaprotectionmanager.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.MediaProtectionManager")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnServiceRequestedToken")) {
            this.remove_ServiceRequested(this.__OnServiceRequestedToken)
            this.__OnServiceRequested.iface.Dispose()
        }

        if(this.HasProp("__OnRebootNeededToken")) {
            this.remove_RebootNeeded(this.__OnRebootNeededToken)
            this.__OnRebootNeeded.iface.Dispose()
        }

        if(this.HasProp("__OnComponentLoadFailedToken")) {
            this.remove_ComponentLoadFailed(this.__OnComponentLoadFailedToken)
            this.__OnComponentLoadFailed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {ServiceRequestedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServiceRequested(handler) {
        if (!this.HasProp("__IMediaProtectionManager")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionManager := IMediaProtectionManager(outPtr)
        }

        return this.__IMediaProtectionManager.add_ServiceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ServiceRequested(cookie) {
        if (!this.HasProp("__IMediaProtectionManager")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionManager := IMediaProtectionManager(outPtr)
        }

        return this.__IMediaProtectionManager.remove_ServiceRequested(cookie)
    }

    /**
     * 
     * @param {RebootNeededEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RebootNeeded(handler) {
        if (!this.HasProp("__IMediaProtectionManager")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionManager := IMediaProtectionManager(outPtr)
        }

        return this.__IMediaProtectionManager.add_RebootNeeded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_RebootNeeded(cookie) {
        if (!this.HasProp("__IMediaProtectionManager")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionManager := IMediaProtectionManager(outPtr)
        }

        return this.__IMediaProtectionManager.remove_RebootNeeded(cookie)
    }

    /**
     * 
     * @param {ComponentLoadFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ComponentLoadFailed(handler) {
        if (!this.HasProp("__IMediaProtectionManager")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionManager := IMediaProtectionManager(outPtr)
        }

        return this.__IMediaProtectionManager.add_ComponentLoadFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ComponentLoadFailed(cookie) {
        if (!this.HasProp("__IMediaProtectionManager")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionManager := IMediaProtectionManager(outPtr)
        }

        return this.__IMediaProtectionManager.remove_ComponentLoadFailed(cookie)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaProtectionManager")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionManager := IMediaProtectionManager(outPtr)
        }

        return this.__IMediaProtectionManager.get_Properties()
    }

;@endregion Instance Methods
}
