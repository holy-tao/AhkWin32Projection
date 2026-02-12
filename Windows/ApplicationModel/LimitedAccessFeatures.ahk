#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILimitedAccessFeaturesStatics.ahk
#Include ..\..\Guid.ahk

/**
 * This API enables applications to request access to Limited Access Features.
 * @remarks
 * Limited Access Features are Windows platform features which require specific approval to be used in an application. This may be because these are features which are not ready for broad consumption, or because these are features which have legitimate use-cases but may be abused by malicious apps.
 * 
 * To use a Limited Access Feature in your app, you need explicit permission from Microsoft. You cannot call the APIs needed to enable one of these features without a specific feature ID and use token. For more information about any Limited Access Feature or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.limitedaccessfeatures
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class LimitedAccessFeatures extends IInspectable {
;@region Static Methods
    /**
     * Submits a request to Microsoft to authorize use of a specific Limited Access Feature. Users must have previously obtained a feature ID and a token from Microsoft in order to successfully call this API.
     * @param {HSTRING} featureId The ID, provided by Microsoft. that identifies the feature being requested.
     * @param {HSTRING} token The string receieved from Microsoft upon agreeing to the requirements for use of the feature.
     * @param {HSTRING} attestation A plain-english statement declaring that the publisher has permission to use the feature.
     * @returns {LimitedAccessFeatureRequestResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.limitedaccessfeatures.tryunlockfeature
     */
    static TryUnlockFeature(featureId, token, attestation) {
        if (!LimitedAccessFeatures.HasProp("__ILimitedAccessFeaturesStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.LimitedAccessFeatures")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILimitedAccessFeaturesStatics.IID)
            LimitedAccessFeatures.__ILimitedAccessFeaturesStatics := ILimitedAccessFeaturesStatics(factoryPtr)
        }

        return LimitedAccessFeatures.__ILimitedAccessFeaturesStatics.TryUnlockFeature(featureId, token, attestation)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
