#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICurrentAppSimulatorWithCampaignId.ahk
#Include .\ICurrentAppSimulatorWithConsumables.ahk
#Include .\ICurrentAppSimulator.ahk
#Include .\ICurrentAppSimulatorStaticsWithFiltering.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines methods and properties used to instantiate an object that you can use to get simulated license info during testing.
  * 
  * > [!NOTE]
  * > The **CurrentAppSimulator** class and the other types in the [Windows.ApplicationModel.Store](windows_applicationmodel_store.md) namespace are no longer being updated with new features. If your project targets **Windows 10 Anniversary Edition (10.0; Build 14393)** or a later release in Visual Studio (that is, you are targeting Windows 10, version 1607, or later), we recommend that you use the [Windows.Services.Store](../windows.services.store/windows_services_store.md) namespace instead. For more information, see [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials). The **CurrentAppSimulator** class is not supported in Windows desktop applications that use the [Desktop Bridge](https://developer.microsoft.com/windows/bridges/desktop) or in apps or games that use a development sandbox in [Partner Center](https://partner.microsoft.com/dashboard) (for example, this is the case for any game that integrates with Xbox Live). These products must use the [Windows.Services.Store](../windows.services.store/windows_services_store.md) namespace to implement in-app purchases and trials.
 * @remarks
 * Until the app has been listed in the Microsoft Store, the [CurrentApp](currentapp.md) object won't work in the app. Use the CurrentAppSimulator to test your app's licensing and in-app products while you develop your app. After you test your app, and before you submit it to the Microsoft Store, you must replace the instances of CurrentAppSimulator with [CurrentApp](currentapp.md). Your app will fail certification if it uses CurrentAppSimulator.
 * 
 * When the CurrentAppSimulator is used, the initial licensing state of the app is described in a file named WindowsStoreProxy.xml. CurrentAppSimulator methods that alter the license state, for example by buying a license or handling an in-app purchase, only update the license state of the object in memory. The contents of WindowsStoreProxy.xml are not changed. When the app starts again, the license state reverts to what is described in WindowsStoreProxy.xml.
 * 
 * For more information about the WindowsStoreProxy.xml file, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class CurrentAppSimulator extends IInspectable {
;@region Static Properties
    /**
     * Gets the simulated license metadata for the current app as provided by the simulation.
     * @remarks
     * Uses the **LicenseInformation** element in the WindowsStoreProxy.xml file as the data source for the members of the returned object. For more information, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
     * 
     * This API does not require a network connection.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.licenseinformation
     * @type {LicenseInformation} 
     */
    static LicenseInformation {
        get => CurrentAppSimulator.get_LicenseInformation()
    }

    /**
     * Gets the simulated Uniform Resource Identifier (URI) that represents a Microsoft Store listing page for the current app.
     * @remarks
     * Gets the value of the **LinkUri** element in the WindowsStoreProxy.xml file. For more information, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.linkuri
     * @type {Uri} 
     */
    static LinkUri {
        get => CurrentAppSimulator.get_LinkUri()
    }

    /**
     * Gets a simulated app ID. Since [CurrentAppSimulator](currentappsimulator.md) is intended only for testing during app development, the returned CurrentAppSimulator.AppId will contain only 0's.
     * 
     * Once your app is listed on the Windows Store, [CurrentApp.AppId](currentapp_appid.md) will get the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) generated during app on-boarding and used to list your app within the Windows Store catalog.
     * 
     * > [!NOTE]
     * > App updates or changes to the app description will not result in a change to the [CurrentApp.AppId](currentapp_appid.md).
     * @remarks
     * Uses the **AppId** element in the WindowsStoreProxy.xml file as the data source for the members of the returned object. For more information, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.appid
     * @type {Guid} 
     */
    static AppId {
        get => CurrentAppSimulator.get_AppId()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the promotion campaign ID for the current app.
     * @remarks
     * Starting in Windows 10, you can seed the installation URL for your app with an ID that represents a custom promotion campaign. This enables you to publicize the installation URL in different locations and use the campaign ID to determine which location the customer clicked on the installation URL. Use the GetAppPurchaseCampaignIdAsync method to retrieve the campaign ID for the current app. For more information about custom app promotion campaigns, see [Create a custom app promotion campaign](/windows/uwp/publish/create-a-custom-app-promotion-campaign).
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.getapppurchasecampaignidasync
     */
    static GetAppPurchaseCampaignIdAsync() {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulatorWithCampaignId")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulatorWithCampaignId.IID)
            CurrentAppSimulator.__ICurrentAppSimulatorWithCampaignId := ICurrentAppSimulatorWithCampaignId(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulatorWithCampaignId.GetAppPurchaseCampaignIdAsync()
    }

    /**
     * Simulates notifying the Microsoft Store that the purchase of a consumable add-on (also called an in-app product or IAP) is fulfilled and that the user has the right to access the content.
     * @remarks
     * The product ID is the string that the app uses to identify the add-on. You enter the product ID when [submitting your add-on](/windows/uwp/publish/set-your-add-on-product-id) in [Partner Center](https://partner.microsoft.com/dashboard), where it is associated with the description, price tier and lifetime. For more information, see [How to use product IDs for add-ons in your code](/windows/uwp/monetize/in-app-purchases-and-trials#how-to-use-product-ids-for-add-ons-in-your-code).
     * 
     * A unique transaction ID is required for each instance of a consumable product that has been purchased more than once.
     * @param {HSTRING} productId The product ID of the consumable add-on to report as fulfilled.
     * @param {Guid} transactionId The transaction ID for the simulated purchase of the consumable add-on.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.reportconsumablefulfillmentasync
     */
    static ReportConsumableFulfillmentAsync(productId, transactionId) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulatorWithConsumables")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulatorWithConsumables.IID)
            CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables := ICurrentAppSimulatorWithConsumables(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables.ReportConsumableFulfillmentAsync(productId, transactionId)
    }

    /**
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * 
     * > [!NOTE]
     * > [RequestProductPurchaseAsync(String, Boolean) may be altered or unavailable for releases after Windows 8.1. Instead, use [RequestProductPurchaseAsync(String)](currentappsimulator_requestproductpurchaseasync_2091240017.md).
     * 
     * Creates the async operation that displays the UI that is used to simulate the purchase of an add-on (also called an in-app product or IAP) from the Microsoft Store.
     * @remarks
     * The remarks for [RequestProductPurchaseAsync(String)](currentappsimulator_requestproductpurchaseasync_2091240017.md) also apply to this overload.
     * 
     * To confirm whether the product license is active after a successful call to this overload, use the [LicenseInformation.IsActive](licenseinformation_isactive.md) property.
     * 
     * You can see an example of how to use this method in our [code sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Trial%20app%20and%20in-app%20purchase%20sample).
     * @param {HSTRING} productId The product ID (as defined by the simulation) of the add-on to purchase.
     * @returns {IAsyncOperation<PurchaseResults>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.requestproductpurchaseasync
     */
    static RequestProductPurchaseWithResultsAsync(productId) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulatorWithConsumables")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulatorWithConsumables.IID)
            CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables := ICurrentAppSimulatorWithConsumables(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables.RequestProductPurchaseWithResultsAsync(productId)
    }

    /**
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * 
     * Creates the async operation that displays the UI that is used to simulate the purchase of an add-on (also called an in-app product or IAP) from the Microsoft Store.
     * @remarks
     * Uses the **CurrentApp/ListingInformation/Product** element in the WindowsStoreProxy.xml file with the **ProductId** attribute that matches *ProductId* as the data source for the members of the returned object. If the purchase succeeds, the license state is updated only in memory. The contents of WindowsStoreProxy.xml are not changed. For more information, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
     * 
     * You can see an example of how to use this method in our [code sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Trial%20app%20and%20in-app%20purchase%20sample).
     * @param {HSTRING} productId The product ID (as defined by the simulation) of the add-on to purchase.
     * @param {HSTRING} offerId 
     * @param {ProductPurchaseDisplayProperties} displayProperties_ 
     * @returns {IAsyncOperation<PurchaseResults>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.requestproductpurchaseasync
     */
    static RequestProductPurchaseWithDisplayPropertiesAsync(productId, offerId, displayProperties_) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulatorWithConsumables")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulatorWithConsumables.IID)
            CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables := ICurrentAppSimulatorWithConsumables(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables.RequestProductPurchaseWithDisplayPropertiesAsync(productId, offerId, displayProperties_)
    }

    /**
     * Returns a list of purchased consumable in-app products that have not been fulfilled locally.
     * @returns {IAsyncOperation<IVectorView<UnfulfilledConsumable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.getunfulfilledconsumablesasync
     */
    static GetUnfulfilledConsumablesAsync() {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulatorWithConsumables")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulatorWithConsumables.IID)
            CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables := ICurrentAppSimulatorWithConsumables(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulatorWithConsumables.GetUnfulfilledConsumablesAsync()
    }

    /**
     * 
     * @returns {LicenseInformation} 
     */
    static get_LicenseInformation() {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.get_LicenseInformation()
    }

    /**
     * 
     * @returns {Uri} 
     */
    static get_LinkUri() {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.get_LinkUri()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_AppId() {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.get_AppId()
    }

    /**
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * 
     * Creates the async operation that simulates a user request to buy a full license for the current app.
     * @remarks
     * This method returns a success value even if:
     * + No network connection is available.
     * + The user cancels out of the dialog.
     * + The user's authentication fails.
     *  You should treat a success result as indicating the async process completed without errors. To ensure that the transaction itself was successful, check the **LicenseInformation** element in the returned receipt.
     * 
     * For more information about the contents of the receipt, see [Using receipts to verify product purchases](/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
     * @param {Boolean} includeReceipt Determines if the method should return the receipts for this app.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.requestapppurchaseasync
     */
    static RequestAppPurchaseAsync(includeReceipt) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.RequestAppPurchaseAsync(includeReceipt)
    }

    /**
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * 
     * Creates the async operation that displays the UI that is used to simulate the purchase of an add-on (also called an in-app product or IAP) from the Microsoft Store. This overload includes parameters you can use to display details for a specific offer within a large catalog of in-app purchases that is represented by a single product entry in the Store.
     * @remarks
     * The remarks for [RequestProductPurchaseAsync(String)](currentappsimulator_requestproductpurchaseasync_2091240017.md) also apply to this overload.
     * @param {HSTRING} productId The product ID (as defined by the simulation) of the add-on to purchase.
     * @param {Boolean} includeReceipt 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.requestproductpurchaseasync
     */
    static RequestProductPurchaseAsync(productId, includeReceipt) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.RequestProductPurchaseAsync(productId, includeReceipt)
    }

    /**
     * Loads the simulated app listing information asynchronously. 
     * 
     * The returned ListingInformation object contains listing information (for example, name, price, age rating) specific to the market the user currently resides in. Additionally, listing information for products available via in-app products is also provided.
     * 
     * > [!NOTE]
     * > For simulation purposes, this method uses the  element in the WindowsStoreProxy.xml file as the data source for the members of the returned object. For more info, see the code examples in [CurrentAppSimulator](currentappsimulator.md).
     * @remarks
     * Calling this method requires an internet connection.
     * @returns {IAsyncOperation<ListingInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.loadlistinginformationasync
     */
    static LoadListingInformationAsync() {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.LoadListingInformationAsync()
    }

    /**
     * Creates the async operation that the user can use to simulate requesting all receipts for this app and any in-app product purchases. For examples of how receipt information can be used, see [Using receipts to verify product purchases](/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
     * @remarks
     * For more information about the contents of the receipt, see [Using receipts to verify product purchases](/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.getappreceiptasync
     */
    static GetAppReceiptAsync() {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.GetAppReceiptAsync()
    }

    /**
     * Creates the async operation that the user can use to simulate requesting the receipt for the specified product ID. For examples of how receipt information can be used, see [Using receipts to verify product purchases](/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
     * @remarks
     * For more information about the contents of the receipt, see [Using receipts to verify product purchases](/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
     * @param {HSTRING} productId The unique identifier for the product. This ID is that was specified when the product was submitted for the app to the Store.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.getproductreceiptasync
     */
    static GetProductReceiptAsync(productId) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.GetProductReceiptAsync(productId)
    }

    /**
     * Reloads the simulator using a [StorageFile](../windows.storage/storagefile.md) containing the **WindowsStoreProxy.xml** file.
     * 
     * If you do not call this method to load your own file, the simulator will create/load (but not overwrite) a **WindowsStoreProxy.xml** file containing a set of default values.
     * @remarks
     * For more information about using this method, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
     * @param {StorageFile} simulatorSettingsFile The WindowsStoreProxy.xml file that the simulator uses.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.reloadsimulatorasync
     */
    static ReloadSimulatorAsync(simulatorSettingsFile) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulator")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulator.IID)
            CurrentAppSimulator.__ICurrentAppSimulator := ICurrentAppSimulator(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulator.ReloadSimulatorAsync(simulatorSettingsFile)
    }

    /**
     * Loads the simulated app listing information asynchronously, returning available in-app products in the [ProductListings](listinginformation_productlistings.md) collection that match any of the given products IDs.
     * @remarks
     * Uses the **ListingInformation** element in the WindowsStoreProxy.xml file as the data source for the members of the returned objects. For more information, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
     * 
     * Calling this method requires an internet connection.
     * @param {IIterable<HSTRING>} productIds The list of product IDs by which to filter the [ProductListings](listinginformation_productlistings.md) collection.
     * @returns {IAsyncOperation<ListingInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.loadlistinginformationbyproductidsasync
     */
    static LoadListingInformationByProductIdsAsync(productIds) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulatorStaticsWithFiltering")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulatorStaticsWithFiltering.IID)
            CurrentAppSimulator.__ICurrentAppSimulatorStaticsWithFiltering := ICurrentAppSimulatorStaticsWithFiltering(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulatorStaticsWithFiltering.LoadListingInformationByProductIdsAsync(productIds)
    }

    /**
     * Loads the simulated app listing information asynchronously, returning in-app products in the [ProductListings](listinginformation_productlistings.md) collection that match all supplied keywords.
     * @remarks
     * Uses the **ListingInformation** element in the WindowsStoreProxy.xml file as the data source for the members of the returned objects. For more information, see [Using the WindowsStoreProxy.xml file with CurrentAppSimulator](/windows/uwp/monetize/in-app-purchases-and-trials-using-the-windows-applicationmodel-store-namespace).
     * 
     * Calling this method requires an internet connection.
     * @param {IIterable<HSTRING>} keywords The list of keywords by which to filter the [ProductListings](listinginformation_productlistings.md) collection that is returned in the [ListingInformation](listinginformation.md) object.
     * @returns {IAsyncOperation<ListingInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.currentappsimulator.loadlistinginformationbykeywordsasync
     */
    static LoadListingInformationByKeywordsAsync(keywords) {
        if (!CurrentAppSimulator.HasProp("__ICurrentAppSimulatorStaticsWithFiltering")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.CurrentAppSimulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentAppSimulatorStaticsWithFiltering.IID)
            CurrentAppSimulator.__ICurrentAppSimulatorStaticsWithFiltering := ICurrentAppSimulatorStaticsWithFiltering(factoryPtr)
        }

        return CurrentAppSimulator.__ICurrentAppSimulatorStaticsWithFiltering.LoadListingInformationByKeywordsAsync(keywords)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
