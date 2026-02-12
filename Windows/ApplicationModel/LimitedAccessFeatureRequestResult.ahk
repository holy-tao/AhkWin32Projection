#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILimitedAccessFeatureRequestResult.ahk
#Include ..\..\Guid.ahk

/**
 * An object returned from a [LimitedAccessFeatures.TryUnlockFeature](limitedaccessfeatures_tryunlockfeature_180193416.md) request, which contains information on the feature and its availability.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.limitedaccessfeaturerequestresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class LimitedAccessFeatureRequestResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILimitedAccessFeatureRequestResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILimitedAccessFeatureRequestResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides the feature ID associated with the request made.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.limitedaccessfeaturerequestresult.featureid
     * @type {HSTRING} 
     */
    FeatureId {
        get => this.get_FeatureId()
    }

    /**
     * Provides the result of the feature request, which indicates the availability of the feature in question.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.limitedaccessfeaturerequestresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Provides the estimate date that the current version of the requested feature will become unavailable.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.limitedaccessfeaturerequestresult.estimatedremovaldate
     * @type {IReference<DateTime>} 
     */
    EstimatedRemovalDate {
        get => this.get_EstimatedRemovalDate()
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
    get_FeatureId() {
        if (!this.HasProp("__ILimitedAccessFeatureRequestResult")) {
            if ((queryResult := this.QueryInterface(ILimitedAccessFeatureRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILimitedAccessFeatureRequestResult := ILimitedAccessFeatureRequestResult(outPtr)
        }

        return this.__ILimitedAccessFeatureRequestResult.get_FeatureId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ILimitedAccessFeatureRequestResult")) {
            if ((queryResult := this.QueryInterface(ILimitedAccessFeatureRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILimitedAccessFeatureRequestResult := ILimitedAccessFeatureRequestResult(outPtr)
        }

        return this.__ILimitedAccessFeatureRequestResult.get_Status()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_EstimatedRemovalDate() {
        if (!this.HasProp("__ILimitedAccessFeatureRequestResult")) {
            if ((queryResult := this.QueryInterface(ILimitedAccessFeatureRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILimitedAccessFeatureRequestResult := ILimitedAccessFeatureRequestResult(outPtr)
        }

        return this.__ILimitedAccessFeatureRequestResult.get_EstimatedRemovalDate()
    }

;@endregion Instance Methods
}
