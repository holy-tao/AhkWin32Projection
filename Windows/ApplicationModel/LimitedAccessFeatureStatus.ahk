#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Provides the result of an attempt to authorize the use of a Limited Access Feature with the [LimitedAccessFeatures.TryUnlockFeature](limitedaccessfeatures_tryunlockfeature_180193416.md) API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.limitedaccessfeaturestatus
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class LimitedAccessFeatureStatus extends Win32Enum{

    /**
     * Indicates that the user does not have access to the feature.
     * @type {Integer (Int32)}
     */
    static Unavailable => 0

    /**
     * Indicates that the user has permission to use the feature, and that the feature is still in the "limited access" state.
     * @type {Integer (Int32)}
     */
    static Available => 1

    /**
     * Indicates that the feature is no longer in the "limited access" state, and that permission is no longer required for its use.
     * @type {Integer (Int32)}
     */
    static AvailableWithoutToken => 2

    /**
     * Indicates that the feature could not be found. This is likely due to an incorrect or deleted feature ID.
     * @type {Integer (Int32)}
     */
    static Unknown => 3
}
