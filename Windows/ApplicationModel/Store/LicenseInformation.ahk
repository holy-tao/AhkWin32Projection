#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILicenseInformation.ahk
#Include .\LicenseChangedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the current app's license metadata.
 * @remarks
 * For app trial versions of an app, [IsActive](licenseinformation_isactive.md) will return true so long as the trial hasn’t expired. During the trial period the [IsTrial](licenseinformation_istrial.md) returns true; returning false when the customer upgrades to the full version of the app.
 * 
 * You access this object through the [LicenseInformation](currentappsimulator_licenseinformation.md) property of the [CurrentAppSimulator](currentappsimulator.md) object during testing, or the [LicenseInformation](currentapp_licenseinformation.md) property of the [CurrentApp](currentapp.md) object when the app is distributed through the Microsoft Store.
 * 
 * > [!NOTE]
 * > The [CurrentApp](currentapp.md) object obtains its data from the Microsoft Store, which requires that you have a Microsoft Store developer account and that the app has been published in the Microsoft Store. If you don't have a Microsoft Store developer account, you can test the functions of this class by using the [CurrentAppSimulator](currentappsimulator.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licenseinformation
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class LicenseInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILicenseInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILicenseInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the associative list of licenses for in-app products that the user is currently entitled to.
     * @remarks
     * To determine if the user is entitled to the in-app products, use the [IsActive](productlicense_isactive.md) property of the [ProductLicense](productlicense.md) objects.
     * 
     * > [!IMPORTANT]
     * > The returned list of [ProductLicense](productlicense.md) objects will always represent all in-app products that the user is currently entitled to (where **IsActive = true**). However, this list may or may not also contain [ProductLicense](productlicense.md) objects for products that the user is not currently entitled to (where **IsActive = false**).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licenseinformation.productlicenses
     * @type {IMapView<HSTRING, ProductLicense>} 
     */
    ProductLicenses {
        get => this.get_ProductLicenses()
    }

    /**
     * Gets a value that indicates whether the license is active.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licenseinformation.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets a value that indicates whether the license is a trial license.
     * @remarks
     * For a trial experience with a trial period, there are some special considerations for interpreting the value of IsTrial. IsTrial returns **true** even after the trial period ends, because a trial license is logically considered to be a trial license both during and after the trial period. After purchase, when the license becomes full, IsTrial returns **false**. While IsTrial returns **true**, there are two ways to tell whether the trial period has expired. If you want to take action the moment the trial period expires then compare the current Coordinated Universal Time (or Zulu time) with [ExpirationDate](licenseinformation_expirationdate.md). Otherwise, you can check [IsActive](licenseinformation_isactive.md), which returns **true** during the trial period and **false** some time after the trial period ends.
     * 
     * > [!NOTE]
     * > Be aware that, for an app installed from the Microsoft Store, it can take some hours after the trial period ends for [IsActive](licenseinformation_isactive.md) to begin returning a value of **false**. When testing your app with [CurrentAppSimulator](currentappsimulator.md), [IsActive](licenseinformation_isactive.md) will return **false** at the exact datetime set in the configuration file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licenseinformation.istrial
     * @type {Boolean} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     * Gets the license expiration date and time relative to the system clock.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licenseinformation.expirationdate
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Raises a notification event when the status of the app's license changes.
     * @remarks
     * LicenseChanged events aren't always immediate. If you’ve registered for the event, the event should fire within an hour; if not, it should occur within 6 hours. Generally, it's recommended to wait up to 6 hours when testing with [CurrentApp](currentapp.md), knowing that it will most likely take less time if the app has registered the event.
     * @type {LicenseChangedEventHandler}
    */
    OnLicenseChanged {
        get {
            if(!this.HasProp("__OnLicenseChanged")){
                this.__OnLicenseChanged := WinRTEventHandler(
                    LicenseChangedEventHandler,
                    LicenseChangedEventHandler.IID
                )
                this.__OnLicenseChangedToken := this.add_LicenseChanged(this.__OnLicenseChanged.iface)
            }
            return this.__OnLicenseChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLicenseChangedToken")) {
            this.remove_LicenseChanged(this.__OnLicenseChangedToken)
            this.__OnLicenseChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, ProductLicense>} 
     */
    get_ProductLicenses() {
        if (!this.HasProp("__ILicenseInformation")) {
            if ((queryResult := this.QueryInterface(ILicenseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseInformation := ILicenseInformation(outPtr)
        }

        return this.__ILicenseInformation.get_ProductLicenses()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__ILicenseInformation")) {
            if ((queryResult := this.QueryInterface(ILicenseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseInformation := ILicenseInformation(outPtr)
        }

        return this.__ILicenseInformation.get_IsActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrial() {
        if (!this.HasProp("__ILicenseInformation")) {
            if ((queryResult := this.QueryInterface(ILicenseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseInformation := ILicenseInformation(outPtr)
        }

        return this.__ILicenseInformation.get_IsTrial()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__ILicenseInformation")) {
            if ((queryResult := this.QueryInterface(ILicenseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseInformation := ILicenseInformation(outPtr)
        }

        return this.__ILicenseInformation.get_ExpirationDate()
    }

    /**
     * 
     * @param {LicenseChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LicenseChanged(handler) {
        if (!this.HasProp("__ILicenseInformation")) {
            if ((queryResult := this.QueryInterface(ILicenseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseInformation := ILicenseInformation(outPtr)
        }

        return this.__ILicenseInformation.add_LicenseChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_LicenseChanged(cookie) {
        if (!this.HasProp("__ILicenseInformation")) {
            if ((queryResult := this.QueryInterface(ILicenseInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseInformation := ILicenseInformation(outPtr)
        }

        return this.__ILicenseInformation.remove_LicenseChanged(cookie)
    }

;@endregion Instance Methods
}
