#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentSubscription.ahk
#Include .\ITargetedContentSubscriptionStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\TargetedContentSubscription.ahk
#Include .\TargetedContentChangedEventArgs.ahk
#Include .\TargetedContentAvailabilityChangedEventArgs.ahk
#Include .\TargetedContentStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Subscription object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscription
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentSubscription extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentSubscription

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentSubscription.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a TargetedContentContainer object for a subscriptionID.
     * @param {HSTRING} subscriptionId 
     * @returns {IAsyncOperation<TargetedContentSubscription>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscription.getasync
     */
    static GetAsync(subscriptionId) {
        if (!TargetedContentSubscription.HasProp("__ITargetedContentSubscriptionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.TargetedContent.TargetedContentSubscription")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITargetedContentSubscriptionStatics.IID)
            TargetedContentSubscription.__ITargetedContentSubscriptionStatics := ITargetedContentSubscriptionStatics(factoryPtr)
        }

        return TargetedContentSubscription.__ITargetedContentSubscriptionStatics.GetAsync(subscriptionId)
    }

    /**
     * Gets an object to TargetedContentSubscriptionOptions for a given subscription.
     * @param {HSTRING} subscriptionId 
     * @returns {TargetedContentSubscriptionOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscription.getoptions
     */
    static GetOptions(subscriptionId) {
        if (!TargetedContentSubscription.HasProp("__ITargetedContentSubscriptionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.TargetedContent.TargetedContentSubscription")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITargetedContentSubscriptionStatics.IID)
            TargetedContentSubscription.__ITargetedContentSubscriptionStatics := ITargetedContentSubscriptionStatics(factoryPtr)
        }

        return TargetedContentSubscription.__ITargetedContentSubscriptionStatics.GetOptions(subscriptionId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the ID of a Subscription.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscription.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Occurs when the content in this subscription changes.
     * @type {TypedEventHandler<TargetedContentSubscription, TargetedContentChangedEventArgs>}
    */
    OnContentChanged {
        get {
            if(!this.HasProp("__OnContentChanged")){
                this.__OnContentChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ef11d751-9d56-580d-8a9f-51ae7e8036e3}"),
                    TargetedContentSubscription,
                    TargetedContentChangedEventArgs
                )
                this.__OnContentChangedToken := this.add_ContentChanged(this.__OnContentChanged.iface)
            }
            return this.__OnContentChanged
        }
    }

    /**
     * Occurs when the availability of the content associated with the [TargetedContentSubscription](targetedcontentsubscription.md) changes.
     * @type {TypedEventHandler<TargetedContentSubscription, TargetedContentAvailabilityChangedEventArgs>}
    */
    OnAvailabilityChanged {
        get {
            if(!this.HasProp("__OnAvailabilityChanged")){
                this.__OnAvailabilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{99929904-138a-59ac-a11a-fe0042f0fd50}"),
                    TargetedContentSubscription,
                    TargetedContentAvailabilityChangedEventArgs
                )
                this.__OnAvailabilityChangedToken := this.add_AvailabilityChanged(this.__OnAvailabilityChanged.iface)
            }
            return this.__OnAvailabilityChanged
        }
    }

    /**
     * Event invoked when TargetedContentSubscription State has changed.
     * @type {TypedEventHandler<TargetedContentSubscription, TargetedContentStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c4d5acbe-f65b-5fa4-9242-d2860de85d52}"),
                    TargetedContentSubscription,
                    TargetedContentStateChangedEventArgs
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnContentChangedToken")) {
            this.remove_ContentChanged(this.__OnContentChangedToken)
            this.__OnContentChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAvailabilityChangedToken")) {
            this.remove_AvailabilityChanged(this.__OnAvailabilityChangedToken)
            this.__OnAvailabilityChanged.iface.Dispose()
        }

        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.get_Id()
    }

    /**
     * Returns a TargetedContentContainer object for a TargetedContentSubscription.
     * @returns {IAsyncOperation<TargetedContentContainer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscription.getcontentcontainerasync
     */
    GetContentContainerAsync() {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.GetContentContainerAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<TargetedContentSubscription, TargetedContentChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentChanged(handler) {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.add_ContentChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ContentChanged(cookie) {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.remove_ContentChanged(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<TargetedContentSubscription, TargetedContentAvailabilityChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailabilityChanged(handler) {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.add_AvailabilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AvailabilityChanged(cookie) {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.remove_AvailabilityChanged(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<TargetedContentSubscription, TargetedContentStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StateChanged(cookie) {
        if (!this.HasProp("__ITargetedContentSubscription")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscription := ITargetedContentSubscription(outPtr)
        }

        return this.__ITargetedContentSubscription.remove_StateChanged(cookie)
    }

;@endregion Instance Methods
}
