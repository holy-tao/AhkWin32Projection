#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRatedContentDescription.ahk
#Include .\IRatedContentDescriptionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a piece of content. An app creates a **RatedContentDescription** object, for each piece of content to be used in the [GetRestrictionLevelAsync](ratedcontentrestrictions_getrestrictionlevelasync_1038888445.md) and [RequestContentAccessAsync](ratedcontentrestrictions_requestcontentaccessasync_637668410.md) methods.
 * @remarks
 * If a piece of content doesn't have a 3rd-party rating, nor a Store age rating, the app must pass NULL as the rating.
 * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentdescription
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class RatedContentDescription extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRatedContentDescription

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRatedContentDescription.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the **RatedContentDescription** class.
     * @remarks
     * Returns E_INVALIDARG, if an invalid value is provided.
     * @param {HSTRING} id The ID of the content, as specified by the app developer.
     * @param {HSTRING} title The title of the content.
     * @param {Integer} category Specifies the type of a piece of content, defined by [RatedContentCategory](ratedcontentcategory.md).
     * @returns {RatedContentDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentdescription.#ctor
     */
    static Create(id, title, category) {
        if (!RatedContentDescription.HasProp("__IRatedContentDescriptionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.ContentRestrictions.RatedContentDescription")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatedContentDescriptionFactory.IID)
            RatedContentDescription.__IRatedContentDescriptionFactory := IRatedContentDescriptionFactory(factoryPtr)
        }

        return RatedContentDescription.__IRatedContentDescriptionFactory.Create(id, title, category)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The unique content ID of a piece of content, in the app's content catalog.
     * @remarks
     * The ID must be a length between 1 and 100 characters, and can't be empty or contain only spaces.
     * 
     * Returns E_INVALIDARG, if an invalid value is provided.
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentdescription.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * The display title of a piece of content.
     * @remarks
     * The ID must be a length between 1 and 100 characters, and can't be empty or contain only spaces.
     * 
     * Returns E_INVALIDARG, if an invalid value is provided.
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentdescription.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * The thumbnail image associated with the content.
     * @remarks
     * Accepted image formats are JPEG, BMP, and PNG.
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentdescription.image
     * @type {IRandomAccessStreamReference} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * Specifies the type of a piece of content, defined by [RatedContentCategory](ratedcontentcategory.md).
     * @remarks
     * Returns E_INVALIDARG, if an invalid value is provided.
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentdescription.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
        set => this.put_Category(value)
    }

    /**
     * Provides all existing third-party and Microsoft Store age ratings for a piece of content.
     * @remarks
     * If a piece of content doesn’t have neither a third-party rating nor a Store age rating, the app must pass NULL as the rating. If NULL rating is provided, the [RequestContentAccessAsync](ratedcontentrestrictions_requestcontentaccessasync_637668410.md) method will display a **Content blocked by Family Safety** dialog, with options to request a parental override.
     * 
     * Family Safety uses the [ContentRestrictionBrowsePolicy.GeographicRegion](contentrestrictionsbrowsepolicy_geographicregion.md) and [RatedContentDescription.Category](ratedcontentdescription_category.md) properties, to determine the appropriate rating system for a piece of content. If  contain a rating value in this rating system, then it’s used as the content rating. If  don’t contain value in this rating system, the Store age rating value is used. If it’s not available, the content is considered Not rated, for the Family Safety content settings region, and [RequestContentAccessAsync](ratedcontentrestrictions_requestcontentaccessasync_637668410.md) method will display a **Content blocked by Family Safety** dialog, with options to request a parental override. For more info, see [Using content ratings](/previous-versions/windows/apps/dn481558(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.ratedcontentdescription.ratings
     * @type {IVector<HSTRING>} 
     */
    Ratings {
        get => this.get_Ratings()
        set => this.put_Ratings(value)
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
    get_Id() {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.put_Title(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Image() {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.get_Image()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.put_Image(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Category() {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.get_Category()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Category(value) {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.put_Category(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Ratings() {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.get_Ratings()
    }

    /**
     * 
     * @param {IVector<HSTRING>} value 
     * @returns {HRESULT} 
     */
    put_Ratings(value) {
        if (!this.HasProp("__IRatedContentDescription")) {
            if ((queryResult := this.QueryInterface(IRatedContentDescription.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatedContentDescription := IRatedContentDescription(outPtr)
        }

        return this.__IRatedContentDescription.put_Ratings(value)
    }

;@endregion Instance Methods
}
