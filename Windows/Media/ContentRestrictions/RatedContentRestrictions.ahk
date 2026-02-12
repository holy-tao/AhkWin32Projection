#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRatedContentRestrictions.ahk
#Include .\IRatedContentRestrictionsFactory.ahk
#Include ..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains all behavior and functionality related to a user's Family Safety content settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentrestrictions
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class RatedContentRestrictions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRatedContentRestrictions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRatedContentRestrictions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the **RatedContentRestrictions** class, with the specified age rating the app uses, to restrict content usage.
     * @remarks
     * Restrictions are enforced based on the minimum user’s overall Family Safety age rating (expressed by [PreferredAgeRating](contentrestrictionsbrowsepolicy_preferredagerating.md)), and the app-specific age rating value used in this constructor.
     * @param {Integer} maxAgeRating The max age rating.
     * @returns {RatedContentRestrictions} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentrestrictions.#ctor
     */
    static CreateWithMaxAgeRating(maxAgeRating) {
        if (!RatedContentRestrictions.HasProp("__IRatedContentRestrictionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.ContentRestrictions.RatedContentRestrictions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatedContentRestrictionsFactory.IID)
            RatedContentRestrictions.__IRatedContentRestrictionsFactory := IRatedContentRestrictionsFactory(factoryPtr)
        }

        return RatedContentRestrictions.__IRatedContentRestrictionsFactory.CreateWithMaxAgeRating(maxAgeRating)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Initializes a new instance of the **RatedContentRestrictions** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.ContentRestrictions.RatedContentRestrictions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRestrictionsChangedToken")) {
            this.remove_RestrictionsChanged(this.__OnRestrictionsChangedToken)
            this.__OnRestrictionsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets information that is used filter an app's content catalog.
     * @returns {IAsyncOperation<ContentRestrictionsBrowsePolicy>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentrestrictions.getbrowsepolicyasync
     */
    GetBrowsePolicyAsync() {
        if (!this.HasProp("__IRatedContentRestrictions")) {
            if ((queryResult := this.QueryInterface(IRatedContentRestrictions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentRestrictions := IRatedContentRestrictions(outPtr)
        }

        return this.__IRatedContentRestrictions.GetBrowsePolicyAsync()
    }

    /**
     * Gets the policy that applies to a piece of content, for content browsing and consumption.
     * @param {RatedContentDescription} RatedContentDescription_ The rated content info.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentrestrictions.getrestrictionlevelasync
     */
    GetRestrictionLevelAsync(RatedContentDescription_) {
        if (!this.HasProp("__IRatedContentRestrictions")) {
            if ((queryResult := this.QueryInterface(IRatedContentRestrictions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentRestrictions := IRatedContentRestrictions(outPtr)
        }

        return this.__IRatedContentRestrictions.GetRestrictionLevelAsync(RatedContentDescription_)
    }

    /**
     * Determines whether the user is allowed to consume a piece of content.
     * @remarks
     * If the content is not allowed, this method will display a **Content blocked by Family Safety** dialog with options to request a parental override. Apps are expected to take no action if this method returns false.
     * @param {RatedContentDescription} RatedContentDescription_ The rated content info.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentrestrictions.requestcontentaccessasync
     */
    RequestContentAccessAsync(RatedContentDescription_) {
        if (!this.HasProp("__IRatedContentRestrictions")) {
            if ((queryResult := this.QueryInterface(IRatedContentRestrictions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentRestrictions := IRatedContentRestrictions(outPtr)
        }

        return this.__IRatedContentRestrictions.RequestContentAccessAsync(RatedContentDescription_)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RestrictionsChanged(handler) {
        if (!this.HasProp("__IRatedContentRestrictions")) {
            if ((queryResult := this.QueryInterface(IRatedContentRestrictions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentRestrictions := IRatedContentRestrictions(outPtr)
        }

        return this.__IRatedContentRestrictions.add_RestrictionsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RestrictionsChanged(token) {
        if (!this.HasProp("__IRatedContentRestrictions")) {
            if ((queryResult := this.QueryInterface(IRatedContentRestrictions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentRestrictions := IRatedContentRestrictions(outPtr)
        }

        return this.__IRatedContentRestrictions.remove_RestrictionsChanged(token)
    }

;@endregion Instance Methods
}
