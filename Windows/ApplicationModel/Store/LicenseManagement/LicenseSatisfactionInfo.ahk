#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILicenseSatisfactionInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains license entitlement info for a product.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo
 * @namespace Windows.ApplicationModel.Store.LicenseManagement
 * @version WindowsRuntime 1.4
 */
class LicenseSatisfactionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILicenseSatisfactionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILicenseSatisfactionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the license entitlement is associated with the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo.satisfiedbydevice
     * @type {Boolean} 
     */
    SatisfiedByDevice {
        get => this.get_SatisfiedByDevice()
    }

    /**
     * Gets a value that indicates whether the license entitlement is associated with an open license.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo.satisfiedbyopenlicense
     * @type {Boolean} 
     */
    SatisfiedByOpenLicense {
        get => this.get_SatisfiedByOpenLicense()
    }

    /**
     * Gets a value that indicates whether the license entitlement is associated with a trial.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo.satisfiedbytrial
     * @type {Boolean} 
     */
    SatisfiedByTrial {
        get => this.get_SatisfiedByTrial()
    }

    /**
     * Gets a value that indicates whether the license entitlement is associated with a pass.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo.satisfiedbypass
     * @type {Boolean} 
     */
    SatisfiedByPass {
        get => this.get_SatisfiedByPass()
    }

    /**
     * Gets a value that indicates whether the license entitlement is associated with installation media.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo.satisfiedbyinstallmedia
     * @type {Boolean} 
     */
    SatisfiedByInstallMedia {
        get => this.get_SatisfiedByInstallMedia()
    }

    /**
     * Gets a value that indicates whether the license entitlement is associated with the current signed in user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo.satisfiedbysignedinuser
     * @type {Boolean} 
     */
    SatisfiedBySignedInUser {
        get => this.get_SatisfiedBySignedInUser()
    }

    /**
     * Gets a value that indicates whether a license entitlement exists for the product.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactioninfo.issatisfied
     * @type {Boolean} 
     */
    IsSatisfied {
        get => this.get_IsSatisfied()
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
    get_SatisfiedByDevice() {
        if (!this.HasProp("__ILicenseSatisfactionInfo")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionInfo := ILicenseSatisfactionInfo(outPtr)
        }

        return this.__ILicenseSatisfactionInfo.get_SatisfiedByDevice()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SatisfiedByOpenLicense() {
        if (!this.HasProp("__ILicenseSatisfactionInfo")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionInfo := ILicenseSatisfactionInfo(outPtr)
        }

        return this.__ILicenseSatisfactionInfo.get_SatisfiedByOpenLicense()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SatisfiedByTrial() {
        if (!this.HasProp("__ILicenseSatisfactionInfo")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionInfo := ILicenseSatisfactionInfo(outPtr)
        }

        return this.__ILicenseSatisfactionInfo.get_SatisfiedByTrial()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SatisfiedByPass() {
        if (!this.HasProp("__ILicenseSatisfactionInfo")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionInfo := ILicenseSatisfactionInfo(outPtr)
        }

        return this.__ILicenseSatisfactionInfo.get_SatisfiedByPass()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SatisfiedByInstallMedia() {
        if (!this.HasProp("__ILicenseSatisfactionInfo")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionInfo := ILicenseSatisfactionInfo(outPtr)
        }

        return this.__ILicenseSatisfactionInfo.get_SatisfiedByInstallMedia()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SatisfiedBySignedInUser() {
        if (!this.HasProp("__ILicenseSatisfactionInfo")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionInfo := ILicenseSatisfactionInfo(outPtr)
        }

        return this.__ILicenseSatisfactionInfo.get_SatisfiedBySignedInUser()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSatisfied() {
        if (!this.HasProp("__ILicenseSatisfactionInfo")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionInfo := ILicenseSatisfactionInfo(outPtr)
        }

        return this.__ILicenseSatisfactionInfo.get_IsSatisfied()
    }

;@endregion Instance Methods
}
