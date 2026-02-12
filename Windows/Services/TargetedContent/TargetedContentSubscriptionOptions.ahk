#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentSubscriptionOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents options for a subscription in form of CloudQuery Parameters, Local Filters and Partial Content Availability.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscriptionoptions
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentSubscriptionOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentSubscriptionOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentSubscriptionOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of a Subscription.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscriptionoptions.subscriptionid
     * @type {HSTRING} 
     */
    SubscriptionId {
        get => this.get_SubscriptionId()
    }

    /**
     * Gets or Sets the Partial Content Availability for the TargetedContentSubscription object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscriptionoptions.allowpartialcontentavailability
     * @type {Boolean} 
     */
    AllowPartialContentAvailability {
        get => this.get_AllowPartialContentAvailability()
        set => this.put_AllowPartialContentAvailability(value)
    }

    /**
     * Gets a collection of Cloud Query parameters for the TargetedContentSubscription object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscriptionoptions.cloudqueryparameters
     * @type {IMap<HSTRING, HSTRING>} 
     */
    CloudQueryParameters {
        get => this.get_CloudQueryParameters()
    }

    /**
     * Gets a collection of Local Filters for the TargetedContentSubscription object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscriptionoptions.localfilters
     * @type {IVector<HSTRING>} 
     */
    LocalFilters {
        get => this.get_LocalFilters()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubscriptionId() {
        if (!this.HasProp("__ITargetedContentSubscriptionOptions")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscriptionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscriptionOptions := ITargetedContentSubscriptionOptions(outPtr)
        }

        return this.__ITargetedContentSubscriptionOptions.get_SubscriptionId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowPartialContentAvailability() {
        if (!this.HasProp("__ITargetedContentSubscriptionOptions")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscriptionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscriptionOptions := ITargetedContentSubscriptionOptions(outPtr)
        }

        return this.__ITargetedContentSubscriptionOptions.get_AllowPartialContentAvailability()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowPartialContentAvailability(value) {
        if (!this.HasProp("__ITargetedContentSubscriptionOptions")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscriptionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscriptionOptions := ITargetedContentSubscriptionOptions(outPtr)
        }

        return this.__ITargetedContentSubscriptionOptions.put_AllowPartialContentAvailability(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_CloudQueryParameters() {
        if (!this.HasProp("__ITargetedContentSubscriptionOptions")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscriptionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscriptionOptions := ITargetedContentSubscriptionOptions(outPtr)
        }

        return this.__ITargetedContentSubscriptionOptions.get_CloudQueryParameters()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_LocalFilters() {
        if (!this.HasProp("__ITargetedContentSubscriptionOptions")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscriptionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscriptionOptions := ITargetedContentSubscriptionOptions(outPtr)
        }

        return this.__ITargetedContentSubscriptionOptions.get_LocalFilters()
    }

    /**
     * Updates the TargetedContentSubscriptionOptions object for a subscription.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentsubscriptionoptions.update
     */
    Update() {
        if (!this.HasProp("__ITargetedContentSubscriptionOptions")) {
            if ((queryResult := this.QueryInterface(ITargetedContentSubscriptionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentSubscriptionOptions := ITargetedContentSubscriptionOptions(outPtr)
        }

        return this.__ITargetedContentSubscriptionOptions.Update()
    }

;@endregion Instance Methods
}
