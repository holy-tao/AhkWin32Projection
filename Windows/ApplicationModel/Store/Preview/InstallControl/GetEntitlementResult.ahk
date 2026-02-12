#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGetEntitlementResult.ahk
#Include .\IGetEntitlementResult2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides access to the result of a request to grant a free entitlement.
 * @remarks
 * An instance of this class is returned by the following methods: 
 * 
 * * [GetFreeDeviceEntitlementAsync](appinstallmanager_getfreedeviceentitlementasync_1427505322.md)
 * * [GetFreeUserEntitlementAsync](appinstallmanager_getfreeuserentitlementasync_107347343.md)
 * * [GetFreeUserEntitlementForUserAsync](appinstallmanager_getfreeuserentitlementforuserasync_376670896.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.getentitlementresult
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class GetEntitlementResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGetEntitlementResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGetEntitlementResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates the result of a request to grant a free entitlement.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.getentitlementresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Boolean} 
     */
    IsAlreadyOwned {
        get => this.get_IsAlreadyOwned()
    }

    /**
     * @type {HSTRING} 
     */
    OrderId {
        get => this.get_OrderId()
    }

    /**
     * @type {HSTRING} 
     */
    SkuId {
        get => this.get_SkuId()
    }

    /**
     * @type {HSTRING} 
     */
    AvailabilityId {
        get => this.get_AvailabilityId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IGetEntitlementResult")) {
            if ((queryResult := this.QueryInterface(IGetEntitlementResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGetEntitlementResult := IGetEntitlementResult(outPtr)
        }

        return this.__IGetEntitlementResult.get_Status()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlreadyOwned() {
        if (!this.HasProp("__IGetEntitlementResult2")) {
            if ((queryResult := this.QueryInterface(IGetEntitlementResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGetEntitlementResult2 := IGetEntitlementResult2(outPtr)
        }

        return this.__IGetEntitlementResult2.get_IsAlreadyOwned()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OrderId() {
        if (!this.HasProp("__IGetEntitlementResult2")) {
            if ((queryResult := this.QueryInterface(IGetEntitlementResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGetEntitlementResult2 := IGetEntitlementResult2(outPtr)
        }

        return this.__IGetEntitlementResult2.get_OrderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SkuId() {
        if (!this.HasProp("__IGetEntitlementResult2")) {
            if ((queryResult := this.QueryInterface(IGetEntitlementResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGetEntitlementResult2 := IGetEntitlementResult2(outPtr)
        }

        return this.__IGetEntitlementResult2.get_SkuId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AvailabilityId() {
        if (!this.HasProp("__IGetEntitlementResult2")) {
            if ((queryResult := this.QueryInterface(IGetEntitlementResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGetEntitlementResult2 := IGetEntitlementResult2(outPtr)
        }

        return this.__IGetEntitlementResult2.get_AvailabilityId()
    }

;@endregion Instance Methods
}
