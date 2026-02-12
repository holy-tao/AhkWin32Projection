#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILicenseSatisfactionResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides license entitlement information that is returned by the [GetSatisfactionInfosAsync](licensemanager_getsatisfactioninfosasync_1186889928.md) method for the specified products.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactionresult
 * @namespace Windows.ApplicationModel.Store.LicenseManagement
 * @version WindowsRuntime 1.4
 */
class LicenseSatisfactionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILicenseSatisfactionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILicenseSatisfactionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides access to entitlement info that is returned by the [GetSatisfactionInfosAsync](licensemanager_getsatisfactioninfosasync_1186889928.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactionresult.licensesatisfactioninfos
     * @type {IMapView<HSTRING, LicenseSatisfactionInfo>} 
     */
    LicenseSatisfactionInfos {
        get => this.get_LicenseSatisfactionInfos()
    }

    /**
     * Contains the error code that was returned by [GetSatisfactionInfosAsync](licensemanager_getsatisfactioninfosasync_1186889928.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensesatisfactionresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, LicenseSatisfactionInfo>} 
     */
    get_LicenseSatisfactionInfos() {
        if (!this.HasProp("__ILicenseSatisfactionResult")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionResult := ILicenseSatisfactionResult(outPtr)
        }

        return this.__ILicenseSatisfactionResult.get_LicenseSatisfactionInfos()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ILicenseSatisfactionResult")) {
            if ((queryResult := this.QueryInterface(ILicenseSatisfactionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILicenseSatisfactionResult := ILicenseSatisfactionResult(outPtr)
        }

        return this.__ILicenseSatisfactionResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
