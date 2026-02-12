#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreCollectionData.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides additional data for a product SKU that the user has an entitlement to use.
 * @remarks
 * The [StoreSku.CollectionData](storesku_collectiondata.md) property returns an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreCollectionData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreCollectionData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreCollectionData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the product SKU is a trial version.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.istrial
     * @type {Boolean} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     * Gets the promotion campaign ID that is associated with the product SKU.
     * @remarks
     * Starting in Windows 10, you can seed the installation URL for your app with an ID that represents a custom promotion campaign. This enables you to publicize the installation URL in different locations and use the campaign ID to determine which location the customer clicked on the installation URL. Use the CampaignId property to retrieve the campaign ID for an app. For more information about custom app promotion campaigns, see [Create a custom app promotion campaign](/windows/uwp/publish/create-a-custom-app-promotion-campaign).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.campaignid
     * @type {HSTRING} 
     */
    CampaignId {
        get => this.get_CampaignId()
    }

    /**
     * Gets the developer offer ID that is associated with the product SKU.
     * @remarks
     * If you specified a *devOfferId* value in the [ExtendedJsonData](storepurchaseproperties_extendedjsondata.md) property of the [StorePurchaseProperties](storepurchaseproperties.md) object that you passed to the **RequestPurchaseAsync** method when you purchased the product, you can retrieve that value by using this property.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.developerofferid
     * @type {HSTRING} 
     */
    DeveloperOfferId {
        get => this.get_DeveloperOfferId()
    }

    /**
     * Gets the date on which the product SKU was acquired.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.acquireddate
     * @type {DateTime} 
     */
    AcquiredDate {
        get => this.get_AcquiredDate()
    }

    /**
     * Gets the start date of the trial for the product SKU, if the SKU is a trial version or a durable add-on that expires after a set duration.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.startdate
     * @type {DateTime} 
     */
    StartDate {
        get => this.get_StartDate()
    }

    /**
     * Gets the end date of the trial for the product SKU, if the SKU is a trial version or a durable add-on that expires after a set duration.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.enddate
     * @type {DateTime} 
     */
    EndDate {
        get => this.get_EndDate()
    }

    /**
     * Gets the remaining trial time for the usage-limited trial that is associated with this product SKU.
     * @remarks
     * This property is intended to be used by developers who have configured their app as a **usage-limited trial** in [Partner Center](https://partner.microsoft.com/dashboard). Usage-limited trials are currently available only to some developer accounts in Xbox managed partner programs.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.trialtimeremaining
     * @type {TimeSpan} 
     */
    TrialTimeRemaining {
        get => this.get_TrialTimeRemaining()
    }

    /**
     * Gets complete collection data for the product SKU in JSON format.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StoreCollectionData](storecollectiondata.md) object as a JSON-formatted string in your code. For more information about the structure of the data, see [Data schemas for Store products](/windows/uwp/monetize/data-schemas-for-store-products).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecollectiondata.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrial() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_IsTrial()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CampaignId() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_CampaignId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeveloperOfferId() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_DeveloperOfferId()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_AcquiredDate() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_AcquiredDate()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartDate() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_StartDate()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_EndDate() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_EndDate()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrialTimeRemaining() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_TrialTimeRemaining()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStoreCollectionData")) {
            if ((queryResult := this.QueryInterface(IStoreCollectionData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCollectionData := IStoreCollectionData(outPtr)
        }

        return this.__IStoreCollectionData.get_ExtendedJsonData()
    }

;@endregion Instance Methods
}
