#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimProfilePolicy.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents the policy for an eSIM profile.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * The policy for an eSIM profile includes PPR1 (Profile Policy Rule) and PPR2 as defined in [SGP.22](https://www.gsma.com/newsroom/resources/sgp-22-v2-2-technical-specification/) (the published eSIM standard). PPR1 (can disable) and PPR2 (can delete) are defined by the eSIM standard to be present in eSIM profiles. The policy also includes whether the eSIM profile is managed by an enterprise.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilepolicy
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimProfilePolicy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimProfilePolicy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimProfilePolicy.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the eSIM profile policy represented by this object instance allows the profile to be deleted.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilepolicy.candelete
     * @type {Boolean} 
     */
    CanDelete {
        get => this.get_CanDelete()
    }

    /**
     * Gets a value indicating whether the eSIM profile policy represented by this object instance allows the profile to be disabled.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilepolicy.candisable
     * @type {Boolean} 
     */
    CanDisable {
        get => this.get_CanDisable()
    }

    /**
     * Gets a value indicating whether the eSIM profile policy represented by this object instance calls for the profile to be managed by the enterprise.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilepolicy.ismanagedbyenterprise
     * @type {Boolean} 
     */
    IsManagedByEnterprise {
        get => this.get_IsManagedByEnterprise()
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
    get_CanDelete() {
        if (!this.HasProp("__IESimProfilePolicy")) {
            if ((queryResult := this.QueryInterface(IESimProfilePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfilePolicy := IESimProfilePolicy(outPtr)
        }

        return this.__IESimProfilePolicy.get_CanDelete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDisable() {
        if (!this.HasProp("__IESimProfilePolicy")) {
            if ((queryResult := this.QueryInterface(IESimProfilePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfilePolicy := IESimProfilePolicy(outPtr)
        }

        return this.__IESimProfilePolicy.get_CanDisable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsManagedByEnterprise() {
        if (!this.HasProp("__IESimProfilePolicy")) {
            if ((queryResult := this.QueryInterface(IESimProfilePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfilePolicy := IESimProfilePolicy(outPtr)
        }

        return this.__IESimProfilePolicy.get_IsManagedByEnterprise()
    }

;@endregion Instance Methods
}
