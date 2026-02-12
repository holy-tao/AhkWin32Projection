#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentRestrictionsBrowsePolicy.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information used to filter an app's content catalog.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.contentrestrictionsbrowsepolicy
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class ContentRestrictionsBrowsePolicy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentRestrictionsBrowsePolicy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentRestrictionsBrowsePolicy.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the region of the user's content restrictions.
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.contentrestrictionsbrowsepolicy.geographicregion
     * @type {HSTRING} 
     */
    GeographicRegion {
        get => this.get_GeographicRegion()
    }

    /**
     * Gets the maximum allowed age rating level to show in a content catalog. No content rated above this level should be displayed. For example, if the **MaxBrowsableAgeRating** is 13, MPAA:R rated movies should not be displayed.
     * @remarks
     * If user doesn’t have any content restrictions enforced by Family Safety, the return value is NULL. The app is still expected to call [RequestContentAccessAsync](ratedcontentrestrictions_requestcontentaccessasync_637668410.md) for every piece of content a user is trying to use.
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.contentrestrictionsbrowsepolicy.maxbrowsableagerating
     * @type {IReference<Integer>} 
     */
    MaxBrowsableAgeRating {
        get => this.get_MaxBrowsableAgeRating()
    }

    /**
     * Gets the maximum allowed rating level for content consumption.
     * @remarks
     * Apps may choose to tailor their content catalog based on this value. For example, an app may show more movies appropriate for young children to a user whose preferred rating is 6, even though the user’s maximum allowed browse rating may be 12.
     * 
     * If user doesn’t have any content restrictions enforced by Family Safety the return value is NULL. The app is still expected to call [RequestContentAccessAsync](ratedcontentrestrictions_requestcontentaccessasync_637668410.md) for every piece of content a user is trying to use.
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.contentrestrictionsbrowsepolicy.preferredagerating
     * @type {IReference<Integer>} 
     */
    PreferredAgeRating {
        get => this.get_PreferredAgeRating()
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
    get_GeographicRegion() {
        if (!this.HasProp("__IContentRestrictionsBrowsePolicy")) {
            if ((queryResult := this.QueryInterface(IContentRestrictionsBrowsePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentRestrictionsBrowsePolicy := IContentRestrictionsBrowsePolicy(outPtr)
        }

        return this.__IContentRestrictionsBrowsePolicy.get_GeographicRegion()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxBrowsableAgeRating() {
        if (!this.HasProp("__IContentRestrictionsBrowsePolicy")) {
            if ((queryResult := this.QueryInterface(IContentRestrictionsBrowsePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentRestrictionsBrowsePolicy := IContentRestrictionsBrowsePolicy(outPtr)
        }

        return this.__IContentRestrictionsBrowsePolicy.get_MaxBrowsableAgeRating()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PreferredAgeRating() {
        if (!this.HasProp("__IContentRestrictionsBrowsePolicy")) {
            if ((queryResult := this.QueryInterface(IContentRestrictionsBrowsePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentRestrictionsBrowsePolicy := IContentRestrictionsBrowsePolicy(outPtr)
        }

        return this.__IContentRestrictionsBrowsePolicy.get_PreferredAgeRating()
    }

;@endregion Instance Methods
}
