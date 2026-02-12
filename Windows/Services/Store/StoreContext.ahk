#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreContext.ahk
#Include .\IStoreContext2.ahk
#Include .\IStoreContext3.ahk
#Include .\IStoreContext4.ahk
#Include .\IStoreContext5.ahk
#Include .\IStoreContextStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\StoreContext.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides members you can use to access and manage Microsoft Store-related data for the current app. For example, you can use members of this class to get Microsoft Store listing and license info for the current app, purchase the current app or products that are offered by the app, or download and install package updates for the app.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * > [!NOTE]
 * > This class and the rest of the [Windows.Services.Store](windows_services_store.md) namespace was introduced in Windows 10, version 1607. This class can only be used in projects that target **Windows 10 Anniversary Edition (10.0; Build 14393)** or a later release in Visual Studio. If your project targets an earlier version of Windows 10, you must use the [Windows.ApplicationModel.Store](../windows.applicationmodel.store/windows_applicationmodel_store.md) namespace instead of the [Windows.Services.Store](windows_services_store.md) namespace. For more information, see [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials).
 * 
 * The StoreContext class is the main entry point to the [Windows.Services.Store](windows_services_store.md) namespace. Use members of this class to perform tasks such as getting Microsoft Store listing and license info for the current app, purchasing the current app or add-ons that are offered by the app, or downloading and installing package updates for the app. Other classes and types in this namespace represent items such as add-ons for the app, licenses for the app and its add-ons, and Microsoft Store listing info for the app.
 * 
 * To get a StoreContext object, use one of these static methods:
 * 
 * + [GetDefault](storecontext_getdefault_846721868.md): Use this method in single-user apps (that is, apps that run only in the context of the user that launched the app). This method gets a StoreContext object that you can use to access and manage Microsoft Store-related data for the user. Most Universal Windows Platform (UWP) apps are single-user apps.
 * 
 *   ```csharp
 *   Windows.Services.Store.StoreContext context = StoreContext.GetDefault();
 *   ```
 * 
 * + [GetForUser](storecontext_getforuser_2058550280.md): Use this method in multi-user apps. This method gets a StoreContext object that you can use to access and manage Microsoft Store-related data for a specific user. For more information about multi-user apps, see [Introduction to multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
 * 
 *   ```csharp
 *   var users = await Windows.System.User.FindAllAsync();
 *   Windows.Services.Store.StoreContext context = StoreContext.GetForUser(users[0]);
 *   ```
 * 
 * After you have a StoreContext object, you can start calling methods to purchase an app or add-on for the current user and other tasks. For more information, see the following articles:
 * + [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials)
 * + [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons)
 * + [Get license info for apps and add-ons](/windows/uwp/monetize/get-license-info-for-apps-and-add-ons)
 * + [Enable in-app purchases of apps and add-ons](/windows/uwp/monetize/enable-in-app-purchases-of-apps-and-add-ons)
 * + [Enable consumable add-on purchases](/windows/uwp/monetize/enable-consumable-add-on-purchases)
 * + [Implement a trial version of your app](/windows/uwp/monetize/implement-a-trial-version-of-your-app)
 * 
 * You can also use a StoreContext object to download and install package updates for the app. For more information, see [Download and install package updates for your app](/windows/uwp/packaging/self-install-package-updates).
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreContext.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [StoreContext](storecontext.md) object that can be used to access and manage Microsoft Store-related data for the current user in the context of the current app.
     * @remarks
     * If your app is a single-user app (that is, it runs only in the context of the user that launched the app), use the GetDefault method to get a [StoreContext](storecontext.md) object that you can use to access and manage Microsoft Store-related data for the user. Most Universal Windows Platform (UWP) apps are single-user apps. For more information about this method, see [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials).
     * 
     * If your app is a multi-user app, use the [GetForUser](storecontext_getforuser_2058550280.md) method to get a [StoreContext](storecontext.md) object for a specific user.
     * @returns {StoreContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getdefault
     */
    static GetDefault() {
        if (!StoreContext.HasProp("__IStoreContextStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Store.StoreContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreContextStatics.IID)
            StoreContext.__IStoreContextStatics := IStoreContextStatics(factoryPtr)
        }

        return StoreContext.__IStoreContextStatics.GetDefault()
    }

    /**
     * Gets a [StoreContext](storecontext.md) object that can be used to access and manage Microsoft Store-related data for the specified user in the context of the current app.
     * @remarks
     * If your app is a multi-user app, use the GetForUser method to get a [StoreContext](storecontext.md) object that you can use to access and manage Microsoft Store-related data for a specific user who is signed in with their Microsoft account while using the app. For more information about this method, see [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials). For more information about multi-user apps, see [Introduction to multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * 
     * If your app is a single-user app (that is, it runs only in the context of the user that launched the app), use the [GetDefault](storecontext_getdefault_846721868.md) method to get a [StoreContext](storecontext.md) object for the current user. Most Universal Windows Platform (UWP) apps are single-user apps.
     * @param {User} user_ An object that identifies the user whose Microsoft Store-related data you want to access and manage.
     * @returns {StoreContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getforuser
     */
    static GetForUser(user_) {
        if (!StoreContext.HasProp("__IStoreContextStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Store.StoreContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreContextStatics.IID)
            StoreContext.__IStoreContextStatics := IStoreContextStatics(factoryPtr)
        }

        return StoreContext.__IStoreContextStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets info about the user that is associated with the current [StoreContext](storecontext.md) object in a multi-user app.
     * @remarks
     * This property is only intended to be used in the context of a [multi-user app](/windows/uwp/xbox-apps/multi-user-applications). In this scenario, the **User** property returns the same [User](../windows.system/user.md) object that you passed to the [GetForUser](storecontext_getforuser_2058550280.md) method when you created the [StoreContext](storecontext.md) object for a specific user.
     * 
     * If your app is a single-user app, (that is, it runs only in the context of the user that launched the app), this property returns **null**.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets a value that indicates whether package updates for the current app can be downloaded without displaying a notification UI to the user.
     * @remarks
     * This property can return false in the following scenarios:
     * * The user has disabled the **Update apps automatically** setting in the Store.
     * * The user is on a metered network.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.cansilentlydownloadstorepackageupdates
     * @type {Boolean} 
     */
    CanSilentlyDownloadStorePackageUpdates {
        get => this.get_CanSilentlyDownloadStorePackageUpdates()
    }

    /**
     * Raised when the status of the app's license changes (for example, the trial period has expired or the user has purchased the full version of the app).
     * @remarks
     * When this event is raised, you can get the latest app license from the Microsoft Store by calling the [GetAppLicenseAsync](storecontext_getapplicenseasync_1472711008.md) method. The [StoreAppLicense](storeapplicense.md) object returned by this method also contains the latest add-on licenses for the app in the [AddOnLicenses](storeapplicense_addonlicenses.md) property. 
     * 
     * For more information about the OfflineLicensesChanged event, including a code example, see [Implement a trial version of your app](/windows/uwp/monetize/implement-a-trial-version-of-your-app).
     * 
     * > [!NOTE]
     * > This event is the equivalent of the [LicenseChanged](../windows.applicationmodel.store/licenseinformation_licensechanged.md) event in the [Windows.ApplicationModel.Store](../windows.applicationmodel.store/windows_applicationmodel_store.md) namespace.
     * @type {TypedEventHandler<StoreContext, IInspectable>}
    */
    OnOfflineLicensesChanged {
        get {
            if(!this.HasProp("__OnOfflineLicensesChanged")){
                this.__OnOfflineLicensesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d5a00ac7-082d-547c-a04b-2540c1cde97a}"),
                    StoreContext,
                    IInspectable
                )
                this.__OnOfflineLicensesChangedToken := this.add_OfflineLicensesChanged(this.__OnOfflineLicensesChanged.iface)
            }
            return this.__OnOfflineLicensesChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOfflineLicensesChangedToken")) {
            this.remove_OfflineLicensesChanged(this.__OnOfflineLicensesChangedToken)
            this.__OnOfflineLicensesChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.get_User()
    }

    /**
     * 
     * @param {TypedEventHandler<StoreContext, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OfflineLicensesChanged(handler) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.add_OfflineLicensesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OfflineLicensesChanged(token) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.remove_OfflineLicensesChanged(token)
    }

    /**
     * Retrieves a Microsoft Store ID key that can be used to grant entitlements for free products on behalf of the current user.
     * @remarks
     * Publishers with catalogs of in-app purchases can use the Microsoft Store ID key in service-to-service calls to the Microsoft Store purchase API to grant entitlements for free products on behalf of the current user. An *entitlement* represents the customer's right to use an app or add-on that is published through the Microsoft Store. For more information, see [Manage product entitlements from a service](/windows/uwp/monetize/view-and-grant-products-from-a-service).
     * @param {HSTRING} serviceTicket An Azure Active Directory access token that identifies the publisher of the current app. For more information about generating this token, see [Manage product entitlements from a service](/windows/uwp/monetize/view-and-grant-products-from-a-service).
     * @param {HSTRING} publisherUserId An anonymous ID that identifies the current user in the context of services that you manage as the publisher of the current app. If you maintain user IDs in the context of your services, you can use this parameter to associate your ID for the current user with the new Microsoft Store ID key (the user ID will be embedded in the key). Otherwise, if you don't need to associate a user ID with the Microsoft Store ID key, you can pass any string value.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getcustomerpurchaseidasync
     */
    GetCustomerPurchaseIdAsync(serviceTicket, publisherUserId) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetCustomerPurchaseIdAsync(serviceTicket, publisherUserId)
    }

    /**
     * Retrieves a Microsoft Store ID key that can be used to query for product entitlements or to consume product entitlements that are owned by the current user.
     * @remarks
     * Publishers with catalogs of in-app purchases can use the Microsoft Store ID key in service-to-service calls to the Microsoft Store collections API to query for product entitlements or to consume product entitlements that are owned by the current user. An *entitlement* represents the customer's right to use an app or add-on that is published through the Microsoft Store. For more information, see [Manage product entitlements from a service](/windows/uwp/monetize/view-and-grant-products-from-a-service).
     * @param {HSTRING} serviceTicket An Azure Active Directory access token that identifies the publisher of the current app. For more information about generating this token, see [Manage product entitlements from a service](/windows/uwp/monetize/view-and-grant-products-from-a-service).
     * @param {HSTRING} publisherUserId An anonymous ID that identifies the current user in the context of services that you manage as the publisher of the current app. If you maintain user IDs in the context of your services, you can use this parameter to associate your ID for the current user with the new Microsoft Store ID key (the user ID will be embedded in the key). Otherwise, if you don't need to associate a user ID with the Microsoft Store ID key, you can pass any string value.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getcustomercollectionsidasync
     */
    GetCustomerCollectionsIdAsync(serviceTicket, publisherUserId) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetCustomerCollectionsIdAsync(serviceTicket, publisherUserId)
    }

    /**
     * Gets license info for the current app, including licenses for add-ons for the current app.
     * @remarks
     * The [StoreAppLicense](storeapplicense.md) object returned by this method provides access to licenses for add-ons and other info, such as whether the license is active. If this method is called while the device is offline, it returns the cached value of the current licenses on the device. The [OfflineLicensesChanged](storecontext_offlinelicenseschanged.md) event is raised when the status of the app's license changes.
     * 
     * For more information about using this method, including code examples, see [Get license info for apps and add-ons](/windows/uwp/monetize/get-license-info-for-apps-and-add-ons) and [Implement a trial version of your app](/windows/uwp/monetize/implement-a-trial-version-of-your-app).
     * @returns {IAsyncOperation<StoreAppLicense>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getapplicenseasync
     */
    GetAppLicenseAsync() {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetAppLicenseAsync()
    }

    /**
     * Gets Microsoft Store listing info for the current app and provides access to a method that you can use to purchase the app for the current user.
     * @remarks
     * For more information about using this method, including a code example, see [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons).
     * @returns {IAsyncOperation<StoreProductResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getstoreproductforcurrentappasync
     */
    GetStoreProductForCurrentAppAsync() {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetStoreProductForCurrentAppAsync()
    }

    /**
     * Gets Microsoft Store listing info for the specified products that are associated with the current app, with the option to use a filter for the query.
     * @remarks
     * To return info only for products that can currently be purchased from within the current app, add the ```Purchase``` filter string to the [ActionFilters](storeproductoptions_actionfilters.md) property of the object you pass to the *storeProductOptions* parameter. To get info for all the specified products that are associated with the current app, regardless of whether they are currently available for purchase, use the [GetStoreProductsAsync](storecontext_getstoreproductsasync_1035651645.md) overload instead.
     * 
     * The Store ID for a product is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the product. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * 
     * For more information about using this method, including a code example, see [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons).
     * @param {IIterable<HSTRING>} productKinds An array of strings that specify the types of products for which you want to retrieve listing info. For a list of the supported string values, see the [ProductKind](storeproduct_productkind.md) property.
     * @param {IIterable<HSTRING>} storeIds An array of the Store ID strings for the products for which you want to retrieve listing info.
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getstoreproductsasync
     */
    GetStoreProductsAsync(productKinds, storeIds) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetStoreProductsAsync(productKinds, storeIds)
    }

    /**
     * Gets Microsoft Store listing info for the products that can be purchased from within the current app.
     * @remarks
     * For more information about using this method, including a code example, see [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons).
     * @param {IIterable<HSTRING>} productKinds An array of strings that specify the types of products you want to get. For a list of the supported string values, see the [ProductKind](storeproduct_productkind.md) property.
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getassociatedstoreproductsasync
     */
    GetAssociatedStoreProductsAsync(productKinds) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetAssociatedStoreProductsAsync(productKinds)
    }

    /**
     * Gets Microsoft Store listing info for the products that can be purchased from within the current app. This method supports paging to return the results.
     * @remarks
     * This method is similar to [GetAssociatedStoreProductsAsync](storecontext_getassociatedstoreproductsasync_1833928682.md), with the difference that it enables you to use paging to retrieve the products. For more information about using [GetAssociatedStoreProductsAsync](storecontext_getassociatedstoreproductsasync_1833928682.md), including a code example, see [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons).
     * 
     * Use the [HasMoreResults](storeproductpagedqueryresult_hasmoreresults.md) of the [StoreProductPagedQueryResult](storeproductpagedqueryresult.md) return value to determine whether there are additional pages of results, and use the [GetNextAsync](storeproductpagedqueryresult_getnextasync_1854313260.md) method to get the next page of results.
     * 
     * > [!NOTE]
     * > Always use [HasMoreResults](storeproductpagedqueryresult_hasmoreresults.md) to determine if there are more pages available, even if the current page of data contains fewer items than *maxItemsToRetrievePerPage*. To provide faster results, the service can return fewer items in a page than *maxItemsToRetrievePerPage* even if there are more pages of data available.
     * @param {IIterable<HSTRING>} productKinds An array of strings that specify the types of products you want to get. For a list of the supported string values, see the [ProductKind](storeproduct_productkind.md) property.
     * @param {Integer} maxItemsToRetrievePerPage The maximum number of products to return in each page of results.
     * @returns {IAsyncOperation<StoreProductPagedQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getassociatedstoreproductswithpagingasync
     */
    GetAssociatedStoreProductsWithPagingAsync(productKinds, maxItemsToRetrievePerPage) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetAssociatedStoreProductsWithPagingAsync(productKinds, maxItemsToRetrievePerPage)
    }

    /**
     * Gets Microsoft Store info for the add-ons of the current app for which the user has purchased.
     * @remarks
     * For more information about using this method, including a code example, see [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons).
     * 
     * If the current user is not signed in to the Store, the [ExtendedError](storeproductqueryresult_extendederror.md) property of the [StoreProductQueryResult](storeproductqueryresult.md) return value will return the error code 0x80070525 (**ERROR_NO_SUCH_USER**).
     * @param {IIterable<HSTRING>} productKinds An array of strings that specify the types of add-ons for which you want to retrieve info. For a list of the supported string values, see the [ProductKind](storeproduct_productkind.md) property.
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getusercollectionasync
     */
    GetUserCollectionAsync(productKinds) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetUserCollectionAsync(productKinds)
    }

    /**
     * Gets Microsoft Store info for the add-ons of the current app for which the user has purchased. This method supports paging to return the results.
     * @remarks
     * This method is similar to [GetUserCollectionAsync](storecontext_getusercollectionasync_822351662.md), with the difference that it enables you to use paging to retrieve the add-ons. For more information about using [GetUserCollectionAsync](storecontext_getusercollectionasync_822351662.md), including a code example, see [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons).
     * 
     * Use the [HasMoreResults](storeproductpagedqueryresult_hasmoreresults.md) of the [StoreProductPagedQueryResult](storeproductpagedqueryresult.md) object to determine whether there are additional pages of results, and use the [GetNextAsync](storeproductpagedqueryresult_getnextasync_1854313260.md) method to get the next page of results.
     * 
     * If the current user is not signed in to the Store, the [ExtendedError](storeproductpagedqueryresult_extendederror.md) property of the [StoreProductPagedQueryResult](storeproductpagedqueryresult.md) return value will return the error code 0x80070525 (**ERROR_NO_SUCH_USER**).
     * 
     * > [!NOTE]
     * > Always use [HasMoreResults](storeproductpagedqueryresult_hasmoreresults.md) to determine if there are more pages available, even if the current page of data contains fewer items than *maxItemsToRetrievePerPage*. To provide faster results, the service can return fewer items in a page than *maxItemsToRetrievePerPage* even if there are more pages of data available.
     * @param {IIterable<HSTRING>} productKinds An array of strings that specify the types of add-ons for which you want to retrieve info. For a list of the supported string values, see the [ProductKind](storeproduct_productkind.md) property.
     * @param {Integer} maxItemsToRetrievePerPage The maximum number of add-ons to return in each page of results.
     * @returns {IAsyncOperation<StoreProductPagedQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getusercollectionwithpagingasync
     */
    GetUserCollectionWithPagingAsync(productKinds, maxItemsToRetrievePerPage) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetUserCollectionWithPagingAsync(productKinds, maxItemsToRetrievePerPage)
    }

    /**
     * Reports a consumable add-on for the current app as fulfilled in the Microsoft Store.
     * @remarks
     * After the user has used a consumable add-on in your app, use this method to report the add-on as fulfilled in the Microsoft Store. The Store ID for the add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the add-on. For more information about using this method, including a code example, see [Enable consumable add-on purchases](/windows/uwp/monetize/enable-consumable-add-on-purchases).
     * 
     * The *trackingId* parameter is used to help ensure that each fulfillment operation is handled exactly once by the Microsoft Store. For example, consider a scenario where you call ReportConsumableFulfillmentAsync with a given pair of *productStoreId* and *trackingId* values, the Microsoft Store successfully marks the consumable as fulfilled, but there is a network connectivity issue that prevents your app from receiving and handling the response. The next time your app retries the same ReportConsumableFulfillmentAsync call with the same pair of *productStoreId* and *trackingId* values after it regains connectivity, the Microsoft Store will report the transaction as successful without charging the user again. The *trackingId* parameter can be retrieved via the [TrackingId](storeconsumableresult_trackingid.md) property of the [StoreConsumableResult](storeconsumableresult.md) return value.
     * @param {HSTRING} productStoreId The Store ID of the consumable add-on that you want to report as fulfilled.
     * @param {Integer} quantity The number of units of the consumable add-on that you want to report as fulfilled. For a Store-managed consumable (that is, a consumable where Microsoft keeps track of the balance), specify the number of units that have been consumed. For a developer-managed consumable (that is, a consumable where the developer keeps track of the balance), specify 1.
     * @param {Guid} trackingId A developer-supplied [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that identifies the specific transaction that the fulfillment operation is associated with for tracking purposes. For more information, see the remarks.
     * @returns {IAsyncOperation<StoreConsumableResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.reportconsumablefulfillmentasync
     */
    ReportConsumableFulfillmentAsync(productStoreId, quantity, trackingId) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.ReportConsumableFulfillmentAsync(productStoreId, quantity, trackingId)
    }

    /**
     * Gets the remaining balance for the specified consumable add-on for the current app.
     * @remarks
     * For more information about using this method, including a code example, see [Enable consumable add-on purchases](/windows/uwp/monetize/enable-consumable-add-on-purchases).
     * @param {HSTRING} productStoreId The Store ID for the add-on (as provided by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the add-on).
     * @returns {IAsyncOperation<StoreConsumableResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getconsumablebalanceremainingasync
     */
    GetConsumableBalanceRemainingAsync(productStoreId) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetConsumableBalanceRemainingAsync(productStoreId)
    }

    /**
     * Acquires a license for the specified downloadable content (DLC) add-on package for the current app.
     * @remarks
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @param {Package} optionalPackage The DLC add-on package for which to acquire a license.
     * @returns {IAsyncOperation<StoreAcquireLicenseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.acquirestorelicenseforoptionalpackageasync
     */
    AcquireStoreLicenseForOptionalPackageAsync(optionalPackage) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.AcquireStoreLicenseForOptionalPackageAsync(optionalPackage)
    }

    /**
     * Requests the purchase for the specified app or add-on and displays the UI that is used to complete the transaction via the Microsoft Store. This method provides the option to specify additional details for a specific offer within a large catalog of products that are represented by a single listing in the Microsoft Store, including the product name to display to the user during the purchase.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @remarks
     * The Store ID for an app or add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the app or add-on.
     * @param {HSTRING} storeId The Store ID of the app or the add-on that you want to purchase for the current user.
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestpurchaseasync
     */
    RequestPurchaseAsync(storeId) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.RequestPurchaseAsync(storeId)
    }

    /**
     * Requests the purchase for the specified app or add-on and displays the UI that is used to complete the transaction via the Microsoft Store.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @remarks
     * For more information about using this method, including a code example, see [Enable in-app purchases of apps and add-ons](/windows/uwp/monetize/enable-in-app-purchases-of-apps-and-add-ons).
     * 
     * The Store ID for an app or add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the app or add-on.
     * @param {HSTRING} storeId The Store ID of the app or the add-on that you want to purchase for the current user.
     * @param {StorePurchaseProperties} storePurchaseProperties_ 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestpurchaseasync
     */
    RequestPurchaseWithPurchasePropertiesAsync(storeId, storePurchaseProperties_) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.RequestPurchaseWithPurchasePropertiesAsync(storeId, storePurchaseProperties_)
    }

    /**
     * Gets the collection of packages for the current app that have updates available for download from the Microsoft Store, including optional packages for the app.
     * @remarks
     * For more information about using this method, including a code example, see [Download and install package updates for your app](/windows/uwp/packaging/self-install-package-updates).
     * 
     * After you call GetAppAndOptionalStorePackageUpdatesAsync to determine which packages have updates available, you can call [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md) to download the updated packages or you can call [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md) to download and install the updated packages.
     * 
     * > [!IMPORTANT]
     * > Optional packages and downloadable content (DLC) packages are not available to all developer accounts.
     * @returns {IAsyncOperation<IVectorView<StorePackageUpdate>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getappandoptionalstorepackageupdatesasync
     */
    GetAppAndOptionalStorePackageUpdatesAsync() {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.GetAppAndOptionalStorePackageUpdatesAsync()
    }

    /**
     * Attempts to download the specified package updates for the current app from the Microsoft Store. This method also displays a UI dialog that requests permission for the operation.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * @remarks
     * To get the list of packages that have updates available, use the [GetAppAndOptionalStorePackageUpdatesAsync](storecontext_getappandoptionalstorepackageupdatesasync_399599716.md) method. After you download the packages, you can install them by using the [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md) method. For more information about using this method, including a code example, see [Download and install package updates for your app](/windows/uwp/packaging/self-install-package-updates).
     * 
     * This operation will not block. The [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) object returned by this method will complete after the update packages are downloaded.
     * 
     * When you call this method, the OS displays a dialog that tells the user that an app update is available to download and asks the user's permission to proceed with the download. If the user does not grant permission to start the download, the [OverallState](storepackageupdateresult_overallstate.md) property of the [StorePackageUpdateResult](storepackageupdateresult.md) return value has the value **Canceled**.
     * 
     * The method that you assign to handle [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) notifications is called one time for each step in the download process for each package in this request. The [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) handler receives a [StorePackageUpdateStatus](storepackageupdatestatus.md) argument that provides info about the update package that raised the progress notification.
     * @param {IIterable<StorePackageUpdate>} storePackageUpdates The set of [StorePackageUpdate](storepackageupdate.md) objects that represent the updated packages to download.
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestdownloadstorepackageupdatesasync
     */
    RequestDownloadStorePackageUpdatesAsync(storePackageUpdates) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.RequestDownloadStorePackageUpdatesAsync(storePackageUpdates)
    }

    /**
     * Attempts to download and install the specified package updates for the current app from the Microsoft Store. This method also displays a UI dialog that requests permission for the operation.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * @remarks
     * To get the list of packages that have updates available, use the [GetAppAndOptionalStorePackageUpdatesAsync](storecontext_getappandoptionalstorepackageupdatesasync_399599716.md) method. If you have already downloaded package updates by using [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md), this method will install the updates without trying to download them again. For more information about using this method, including a code example, see [Download and install package updates for your app](/windows/uwp/packaging/self-install-package-updates).
     * 
     * This operation will not block. The [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) object returned by this method will complete after the update packages are downloaded and installed.
     * 
     * When you call this method, the OS displays the following UI:
     * 
     *   * The OS displays a dialog that tells the user that an app update is available to download and asks the user's permission to proceed with the download. If the user does not grant permission to start the download, the [OverallState](storepackageupdateresult_overallstate.md) property of the [StorePackageUpdateResult](storepackageupdateresult.md) return value has the value **Canceled**.
     * 
     *   * After the updated packages are downloaded, the OS displays another dialog that tells the user that the app update is waiting to be installed and asks the user's permission to proceed with the installation. This dialog warns the user that the app might need to restart. If the user does not grant permission to start the installation, the [OverallState](storepackageupdateresult_overallstate.md) property of the [StorePackageUpdateResult](storepackageupdateresult.md) return value has the value **Canceled**.
     * @param {IIterable<StorePackageUpdate>} storePackageUpdates The set of [StorePackageUpdate](storepackageupdate.md) objects that represent the updated packages to download and install.
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestdownloadandinstallstorepackageupdatesasync
     */
    RequestDownloadAndInstallStorePackageUpdatesAsync(storePackageUpdates) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.RequestDownloadAndInstallStorePackageUpdatesAsync(storePackageUpdates)
    }

    /**
     * Attempts to download and install the specified downloadable content (DLC) packages for the current app from the Microsoft Store, with the specified install options. This method also displays a UI dialog that requests permission for the operation.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * @remarks
     * Use this method to download and install new DLC packages for the current app. This overload provides the option to specify whether or not the OS can force the app to restart after installing the DLC packages by setting the [AllowForcedAppRestart](storepackageinstalloptions_allowforcedapprestart.md) property of the *storePackageInstallOptions* parameter.
     * 
     * When you call this method, the OS displays a dialog that tells the user that an app package is available to download and install, and asks the user's permission to proceed with the operation. If the user does not grant permission, the [OverallState](storepackageupdateresult_overallstate.md) property of the [StorePackageUpdateResult](storepackageupdateresult.md) return value has the value **Canceled**. To silently install an app package without displaying a notification dialog, use [DownloadAndInstallStorePackagesAsync](storecontext_downloadandinstallstorepackagesasync_1940804668.md) (this method requires access to a restricted capability).
     * 
     * The Store ID for a DLC add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the DLC add-on. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * 
     * This operation will not block. The [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) object returned by this method will complete after the packages are downloaded and installed.
     * 
     * The method that you assign to handle [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) notifications is called one time for each step in the download and installation process for each package in this request. The [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) handler receives a [StorePackageUpdateStatus](storepackageupdatestatus.md) argument that provides info about the package that raised the progress notification.
     * 
     * > [!NOTE]
     * > DLC packages are not available to all developer accounts.
     * @param {IIterable<HSTRING>} storeIds The Store IDs of the DLC add-on packages to install.
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestdownloadandinstallstorepackagesasync
     */
    RequestDownloadAndInstallStorePackagesAsync(storeIds) {
        if (!this.HasProp("__IStoreContext")) {
            if ((queryResult := this.QueryInterface(IStoreContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext := IStoreContext(outPtr)
        }

        return this.__IStoreContext.RequestDownloadAndInstallStorePackagesAsync(storeIds)
    }

    /**
     * Gets Store product details for the app or add-on that is associated with the specified package.
     * @remarks
     * Use this method to get Store product details (such as the Store ID) for a package that is associated with the current app or an add-on for the current app. This method may return errors if the package is not associated with the current app, the current device is offline, or if the current app was not installed from the Store (for example, if the app was sideloaded). In these cases, you can examine the [ExtendedError](storeproductresult_extendederror.md) property of the [StoreProductResult](storeproductresult.md) return object to get more details about the error.
     * @param {IIterable<HSTRING>} productKinds An array of strings that specify the types of Store products that might be associated with the package. For a list of the supported string values, see the [ProductKind](storeproduct_productkind.md) property.
     * @param {Package} package_ A [Package](../windows.applicationmodel/package.md) that represents the package for which you want to get the corresponding Store product details.
     * @returns {IAsyncOperation<StoreProductResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.findstoreproductforpackageasync
     */
    FindStoreProductForPackageAsync(productKinds, package_) {
        if (!this.HasProp("__IStoreContext2")) {
            if ((queryResult := this.QueryInterface(IStoreContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext2 := IStoreContext2(outPtr)
        }

        return this.__IStoreContext2.FindStoreProductForPackageAsync(productKinds, package_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSilentlyDownloadStorePackageUpdates() {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.get_CanSilentlyDownloadStorePackageUpdates()
    }

    /**
     * Attempts to download the specified package updates for the current app from the Microsoft Store without displaying a notification UI to the user.
     * @remarks
     * Use this method to attempt to download package updates for the current app silently (without displaying a notification UI that asks the user's permission to proceed with the download). Before calling this method, first check the [CanSilentlyDownloadStorePackageUpdates](storecontext_cansilentlydownloadstorepackageupdates.md) property to determine whether package updates can be silently downloaded based on the user's settings and network configuration. This method is an alternative to [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md), which displays a notification UI.
     * 
     * To get the list of packages that have updates available, use the [GetAppAndOptionalStorePackageUpdatesAsync](storecontext_getappandoptionalstorepackageupdatesasync_399599716.md) method. After you download the packages, you can install them by using the [TrySilentDownloadAndInstallStorePackageUpdatesAsync](storecontext_trysilentdownloadandinstallstorepackageupdatesasync_788206773.md) method. 
     * 
     * This operation will not block. The [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) object returned by this method will complete after the update packages are downloaded.
     * 
     * The method that you assign to handle [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) notifications is called one time for each step in the download process for each package in this request. The [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) handler receives a [StorePackageUpdateStatus](storepackageupdatestatus.md) argument that provides info about the update package that raised the progress notification.
     * 
     * > [!NOTE]
     * > If the connection is terminated during a download, a subsequent call to this method will not resume transferring from the prior location. The download will restart from the beginning.
     * @param {IIterable<StorePackageUpdate>} storePackageUpdates The set of [StorePackageUpdate](storepackageupdate.md) objects that represent the updated packages to download.
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.trysilentdownloadstorepackageupdatesasync
     */
    TrySilentDownloadStorePackageUpdatesAsync(storePackageUpdates) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.TrySilentDownloadStorePackageUpdatesAsync(storePackageUpdates)
    }

    /**
     * Attempts to download and install the specified package updates for the current app from the Microsoft Store without displaying a notification UI to the user.
     * @remarks
     * Use this method to attempt to download package updates for the current app silently (without displaying a notification UI that asks the user's permission to proceed with the download). Before calling this method, first check the [CanSilentlyDownloadStorePackageUpdates](storecontext_cansilentlydownloadstorepackageupdates.md) property to determine whether package updates can be silently downloaded based on the user's settings and network configuration. This method is an alternative to [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md), which displays a notification UI.
     * 
     * To get the list of packages that have updates available, use the [GetAppAndOptionalStorePackageUpdatesAsync](storecontext_getappandoptionalstorepackageupdatesasync_399599716.md) method. If you have already download package updates silently by using [TrySilentDownloadStorePackageUpdatesAsync](storecontext_trysilentdownloadstorepackageupdatesasync_227038344.md), this method will install the updates without trying to download them again. 
     * 
     * This operation will not block. The [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) object returned by this method will complete after the update packages are downloaded and installed.
     * @param {IIterable<StorePackageUpdate>} storePackageUpdates The set of [StorePackageUpdate](storepackageupdate.md) objects that represent the updated packages to download and install.
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.trysilentdownloadandinstallstorepackageupdatesasync
     */
    TrySilentDownloadAndInstallStorePackageUpdatesAsync(storePackageUpdates) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.TrySilentDownloadAndInstallStorePackageUpdatesAsync(storePackageUpdates)
    }

    /**
     * Gets a value that indicates whether a license can be acquired for the specified downloadable content (DLC) package of the current app for the current user.
     * @remarks
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @param {Package} optionalPackage The DLC package to check.
     * @returns {IAsyncOperation<StoreCanAcquireLicenseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.canacquirestorelicenseforoptionalpackageasync
     */
    CanAcquireStoreLicenseForOptionalPackageAsync(optionalPackage) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.CanAcquireStoreLicenseForOptionalPackageAsync(optionalPackage)
    }

    /**
     * Gets a value that indicates whether a license can be acquired for the specified downloadable content (DLC) add-on of the current app for the current user.
     * @remarks
     * The Store ID for an add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the add-on.
     * 
     * > [!NOTE]
     * > Downloadable content (DLC) add-on are not available to all developer accounts.
     * @param {HSTRING} productStoreId The Store ID of the DLC add-on to check.
     * @returns {IAsyncOperation<StoreCanAcquireLicenseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.canacquirestorelicenseasync
     */
    CanAcquireStoreLicenseAsync(productStoreId) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.CanAcquireStoreLicenseAsync(productStoreId)
    }

    /**
     * Gets Microsoft Store listing info for the specified products that are associated with the current app.
     * @remarks
     * This method returns listing info for the specified products that are associated with the current app, regardless of whether the products are currently available for purchase within the current app. To retrieve info for all the products that can currently be purchased from within the current app, use the [GetStoreProductsAsync](storecontext_getstoreproductsasync_915504661.md) overload or the [GetAssociatedStoreProductsAsync](storecontext_getassociatedstoreproductsasync_1833928682.md) method instead.
     * 
     * The Store ID for a product is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the product. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * 
     * For more information about using this method, including a code example, see [Get product info for apps and add-ons](/windows/uwp/monetize/get-product-info-for-apps-and-add-ons).
     * @param {IIterable<HSTRING>} productKinds An array of strings that specify the types of products for which you want to retrieve listing info. For a list of the supported string values, see the [ProductKind](storeproduct_productkind.md) property.
     * @param {IIterable<HSTRING>} storeIds An array of the Store ID strings for the products for which you want to retrieve listing info.
     * @param {StoreProductOptions} storeProductOptions_ 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getstoreproductsasync
     */
    GetStoreProductsWithOptionsAsync(productKinds, storeIds, storeProductOptions_) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.GetStoreProductsWithOptionsAsync(productKinds, storeIds, storeProductOptions_)
    }

    /**
     * Gets info about all the new or updated packages that are in the download and installation queue for the current app.
     * @remarks
     * If your app supports downloading and installing new or updated packages by using the [RequestDownloadAndInstallStorePackagesAsync](storecontext_requestdownloadandinstallstorepackagesasync_1733414901.md) or [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md) methods, in some cases your app may close before it successfully completes the download and install of the packages (for example, a user may close your app before the process is completed). You can use this method to get progress info about any packages that are currently in the queue so your app can display the download or install status of the packages.
     * @returns {IAsyncOperation<IVectorView<StoreQueueItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getassociatedstorequeueitemsasync
     */
    GetAssociatedStoreQueueItemsAsync() {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.GetAssociatedStoreQueueItemsAsync()
    }

    /**
     * Gets info about the specified new or updated packages that are in the download and installation queue for the current app.
     * @remarks
     * If your app supports downloading and installing new or updated packages by using the [RequestDownloadAndInstallStorePackagesAsync](storecontext_requestdownloadandinstallstorepackagesasync_1733414901.md) or [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md) methods, in some cases your app may close before it successfully completes the download and install of the packages (for example, a user may close your app before the process is completed). You can use this method to get progress info about any packages that are currently in the queue so your app can display the download or install status of the packages.
     * 
     * The Store ID for a product is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the product. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * @param {IIterable<HSTRING>} storeIds An array of Store ID strings that correspond to the packages for which you want to get download and installation queue info.
     * @returns {IAsyncOperation<IVectorView<StoreQueueItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.getstorequeueitemsasync
     */
    GetStoreQueueItemsAsync(storeIds) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.GetStoreQueueItemsAsync(storeIds)
    }

    /**
     * Attempts to download and install the specified downloadable content (DLC) packages for the current app from the Microsoft Store. This method also displays a UI dialog that requests permission for the operation.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * @remarks
     * Use this method to download and install new DLC packages for the current app. When you call this method, the OS displays a dialog that tells the user that an app package is available to download and install, and asks the user's permission to proceed with the operation. If the user does not grant permission, the [OverallState](storepackageupdateresult_overallstate.md) property of the [StorePackageUpdateResult](storepackageupdateresult.md) return value has the value **Canceled**. To silently install an app package without displaying a notification dialog, use [DownloadAndInstallStorePackagesAsync](storecontext_downloadandinstallstorepackagesasync_1940804668.md) (this method requires access to a restricted capability).
     * 
     * The Store ID for a DLC add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the DLC add-on. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * 
     * This operation will not block. The [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) object returned by this method will complete after the packages are downloaded and installed.
     * 
     * The method that you assign to handle [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) notifications is called one time for each step in the download and installation process for each package in this request. The [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) handler receives a [StorePackageUpdateStatus](storepackageupdatestatus.md) argument that provides info about the package that raised the progress notification.
     * 
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @param {IIterable<HSTRING>} storeIds The Store IDs of the DLC add-on packages to install.
     * @param {StorePackageInstallOptions} storePackageInstallOptions_ 
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestdownloadandinstallstorepackagesasync
     */
    RequestDownloadAndInstallStorePackagesWithInstallOptionsAsync(storeIds, storePackageInstallOptions_) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.RequestDownloadAndInstallStorePackagesWithInstallOptionsAsync(storeIds, storePackageInstallOptions_)
    }

    /**
     * Downloads and installs the specified downloadable content (DLC) packages for the current app from the Microsoft Store without displaying a notification UI dialog to the user.
     * @remarks
     * Use this method to download and install new DLC packages for the current app. When you call this method, the OS silently downloads and installs the packages without displaying a notification dialog. This method requires the restricted **storeOptionalPackageInstallManagement** capability to perform this operation.
     * 
     * > [!NOTE]
     * > If you don't have access to the **storeOptionalPackageInstallManagement** restricted capability, you can use the [RequestDownloadAndInstallStorePackagesAsync](storecontext_requestdownloadandinstallstorepackagesasync_1733414901.md) methods instead (these methods display a notification dialog that requests the user's permission to install the package).
     * 
     * > [!NOTE]
     * > DLC packages are not available to all developer accounts.
     * 
     * The Store ID for an add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the DLC add-on. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * 
     * This operation will not block. The [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) object returned by this method will complete after the packages are downloaded and installed.
     * 
     * The method that you assign to handle [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) notifications is called one time for each step in the download and installation process for each package in this request. The [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) handler receives a [StorePackageUpdateStatus](storepackageupdatestatus.md) argument that provides info about the package that raised the progress notification.
     * @param {IIterable<HSTRING>} storeIds The Store IDs of the add-ons that correspond to the DLC packages to install for the current app.
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.downloadandinstallstorepackagesasync
     */
    DownloadAndInstallStorePackagesAsync(storeIds) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.DownloadAndInstallStorePackagesAsync(storeIds)
    }

    /**
     * Attempts to uninstall the specified optional package for the current app. This method also displays a UI dialog that requests permission for the operation.
     * @remarks
     * You can use this method to free up disk space by uninstalling optional packages that are no longer needed. For example, a game that offers both a single player campaign and a multiplayer campaign might use this method to uninstall the single player campaign at the user's request, after the user has completed that campaign.
     * 
     * When you call this method, the OS displays a dialog that asks the user's permission to uninstall the app package. To silently uninstall an app package without displaying a notification dialog, use [UninstallStorePackageAsync](storecontext_uninstallstorepackageasync_597217492.md) or [UninstallStorePackageByStoreIdAsync](storecontext_uninstallstorepackagebystoreidasync_262618884.md) (these methods require access to a restricted capability).
     * 
     * > [!NOTE]
     * > Optional packages and DLC packages are not available to all developer accounts.
     * @param {Package} package_ The optional package to uninstall for the current app.
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestuninstallstorepackageasync
     */
    RequestUninstallStorePackageAsync(package_) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.RequestUninstallStorePackageAsync(package_)
    }

    /**
     * Attempts to uninstall the specified downloadable content (DLC) package for the current app. This method also displays a UI dialog that requests permission for the operation.
     * @remarks
     * You can use this method to free up disk space by uninstalling DLC packages that are no longer needed. For example, a game that offers both a single player campaign and a multiplayer campaign might use this method to uninstall the single player campaign at the user's request, after the user has completed that campaign.
     * 
     * When you call this method, the OS displays a dialog that asks the user's permission to uninstall the app package. To silently uninstall an app package without displaying a notification dialog, use [UninstallStorePackageAsync](storecontext_uninstallstorepackageasync_597217492.md) or [UninstallStorePackageByStoreIdAsync](storecontext_uninstallstorepackagebystoreidasync_262618884.md) (these methods require access to a restricted capability).
     * 
     * The Store ID for an add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the add-on. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * 
     * > [!NOTE]
     * > DLC packages are not available to all developer accounts.
     * @param {HSTRING} storeId The Store ID of the add-on that corresponds to the downloadable content (DLC) package to uninstall for the current app.
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestuninstallstorepackagebystoreidasync
     */
    RequestUninstallStorePackageByStoreIdAsync(storeId) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.RequestUninstallStorePackageByStoreIdAsync(storeId)
    }

    /**
     * Uninstalls the specified optional package for the current app without displaying a notification UI dialog to the user.
     * @remarks
     * You can use this method to free up disk space by uninstalling DLC packages that are no longer needed. For example, a game that offers both a single player campaign and a multiplayer campaign might use this method to uninstall the single player campaign at the user's request, after the user has completed that campaign.
     * 
     * > [!NOTE]
     * > Optional packages and DLC packages are not available to all developer accounts.
     * 
     * When you call this method, the OS silently uninstalls the app package without displaying a notification dialog. This method requires the restricted **storeOptionalPackageInstallManagement** capability to perform this operation. 
     * 
     * > [!NOTE]
     * > If you don't have access to the **storeOptionalPackageInstallManagement** restricted capability, you can use the [RequestUninstallStorePackageAsync](storecontext_requestuninstallstorepackageasync_1329597038.md) or [RequestUninstallStorePackageByStoreIdAsync](storecontext_requestuninstallstorepackagebystoreidasync_1267943069.md) methods instead (these methods display a notification dialog that requests the user's permission to uninstall the package).
     * @param {Package} package_ The optional package to uninstall for the current app.
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.uninstallstorepackageasync
     */
    UninstallStorePackageAsync(package_) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.UninstallStorePackageAsync(package_)
    }

    /**
     * Uninstalls the specified downloadable content (DLC) package for the current app without displaying a notification UI dialog to the user.
     * @remarks
     * You can use this method to free up disk space by uninstalling DLC packages that are no longer needed. For example, a game that offers both a single player campaign and a multiplayer campaign might use this method to uninstall the single player campaign at the user's request, after the user has completed that campaign.
     * 
     * > [!NOTE]
     * > DLC packages are not available to all developer accounts.
     * 
     * When you call this method, the OS silently uninstalls the package without displaying a notification dialog. This method requires the restricted **storeOptionalPackageInstallManagement** capability to perform this operation. 
     * 
     * > [!NOTE]
     * > If you don't have access to the **storeOptionalPackageInstallManagement** restricted capability, you can use the [RequestUninstallStorePackageAsync](storecontext_requestuninstallstorepackageasync_1329597038.md) or [RequestUninstallStorePackageByStoreIdAsync](storecontext_requestuninstallstorepackagebystoreidasync_1267943069.md) methods instead (these methods display a notification dialog that requests the user's permission to uninstall the package).
     * 
     * 
     * The Store ID for an add-on is available in [Partner Center](https://partner.microsoft.com/dashboard), and it also is returned by the [StoreId](storeproduct_storeid.md) property of the [StoreProduct](storeproduct.md) that represents the add-on. For more information, see [Store IDs](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids).
     * @param {HSTRING} storeId The Store ID of the add-on that corresponds to the DLC package to uninstall for the current app.
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.uninstallstorepackagebystoreidasync
     */
    UninstallStorePackageByStoreIdAsync(storeId) {
        if (!this.HasProp("__IStoreContext3")) {
            if ((queryResult := this.QueryInterface(IStoreContext3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext3 := IStoreContext3(outPtr)
        }

        return this.__IStoreContext3.UninstallStorePackageByStoreIdAsync(storeId)
    }

    /**
     * Requests the user to rate and review the app. This method will display the UI for the user to select a Store rating and add an optional Store review for the product.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app rate and review functionality is not supported in evelated applications.
     * @returns {IAsyncOperation<StoreRateAndReviewResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.requestrateandreviewappasync
     */
    RequestRateAndReviewAppAsync() {
        if (!this.HasProp("__IStoreContext4")) {
            if ((queryResult := this.QueryInterface(IStoreContext4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext4 := IStoreContext4(outPtr)
        }

        return this.__IStoreContext4.RequestRateAndReviewAppAsync()
    }

    /**
     * Sets the order in which to install the specified packages in the download and installation queue for the current app.
     * @param {IIterable<StoreQueueItem>} items A list of [StoreQueueItem](storequeueitem.md) objects that represents the packages in the install queue, in the order in which you want the packages to be installed.
     * @returns {IAsyncOperation<IVectorView<StoreQueueItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecontext.setinstallorderforassociatedstorequeueitemsasync
     */
    SetInstallOrderForAssociatedStoreQueueItemsAsync(items) {
        if (!this.HasProp("__IStoreContext4")) {
            if ((queryResult := this.QueryInterface(IStoreContext4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext4 := IStoreContext4(outPtr)
        }

        return this.__IStoreContext4.SetInstallOrderForAssociatedStoreQueueItemsAsync(items)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetUserPurchaseHistoryAsync(productKinds) {
        if (!this.HasProp("__IStoreContext5")) {
            if ((queryResult := this.QueryInterface(IStoreContext5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext5 := IStoreContext5(outPtr)
        }

        return this.__IStoreContext5.GetUserPurchaseHistoryAsync(productKinds)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} inAppOfferTokens 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetAssociatedStoreProductsByInAppOfferTokenAsync(inAppOfferTokens) {
        if (!this.HasProp("__IStoreContext5")) {
            if ((queryResult := this.QueryInterface(IStoreContext5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext5 := IStoreContext5(outPtr)
        }

        return this.__IStoreContext5.GetAssociatedStoreProductsByInAppOfferTokenAsync(inAppOfferTokens)
    }

    /**
     * 
     * @param {HSTRING} inAppOfferToken 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     */
    RequestPurchaseByInAppOfferTokenAsync(inAppOfferToken) {
        if (!this.HasProp("__IStoreContext5")) {
            if ((queryResult := this.QueryInterface(IStoreContext5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreContext5 := IStoreContext5(outPtr)
        }

        return this.__IStoreContext5.RequestPurchaseByInAppOfferTokenAsync(inAppOfferToken)
    }

;@endregion Instance Methods
}
