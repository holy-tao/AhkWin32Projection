#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDetectionConfigurationAvailabilityInfo.ahk
#Include .\IDetectionConfigurationAvailabilityInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides availability details for the [ActivationSignalDetector](activationsignaldetector.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilityinfo
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class DetectionConfigurationAvailabilityInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDetectionConfigurationAvailabilityInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDetectionConfigurationAvailabilityInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the [ActivationSignalDetector](activationsignaldetector.md) is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilityinfo.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets whether the [ActivationSignalDetector](activationsignaldetector.md) can access system resources.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilityinfo.hassystemresourceaccess
     * @type {Boolean} 
     */
    HasSystemResourceAccess {
        get => this.get_HasSystemResourceAccess()
    }

    /**
     * Gets whether the [ActivationSignalDetector](activationsignaldetector.md) has user permission to listen for activation keywords.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilityinfo.haspermission
     * @type {Boolean} 
     */
    HasPermission {
        get => this.get_HasPermission()
    }

    /**
     * Gets whether the [ActivationSignalDetector](activationsignaldetector.md) has user permission to operate above the lock screen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilityinfo.haslockscreenpermission
     * @type {Boolean} 
     */
    HasLockScreenPermission {
        get => this.get_HasLockScreenPermission()
    }

    /**
     * Gets a list of unavailable system resources as indicated by [HasSystemResourceAccess](detectionconfigurationavailabilityinfo_hassystemresourceaccess.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilityinfo.unavailablesystemresources
     * @type {IVectorView<Integer>} 
     */
    UnavailableSystemResources {
        get => this.get_UnavailableSystemResources()
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
    get_IsEnabled() {
        if (!this.HasProp("__IDetectionConfigurationAvailabilityInfo")) {
            if ((queryResult := this.QueryInterface(IDetectionConfigurationAvailabilityInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectionConfigurationAvailabilityInfo := IDetectionConfigurationAvailabilityInfo(outPtr)
        }

        return this.__IDetectionConfigurationAvailabilityInfo.get_IsEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasSystemResourceAccess() {
        if (!this.HasProp("__IDetectionConfigurationAvailabilityInfo")) {
            if ((queryResult := this.QueryInterface(IDetectionConfigurationAvailabilityInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectionConfigurationAvailabilityInfo := IDetectionConfigurationAvailabilityInfo(outPtr)
        }

        return this.__IDetectionConfigurationAvailabilityInfo.get_HasSystemResourceAccess()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPermission() {
        if (!this.HasProp("__IDetectionConfigurationAvailabilityInfo")) {
            if ((queryResult := this.QueryInterface(IDetectionConfigurationAvailabilityInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectionConfigurationAvailabilityInfo := IDetectionConfigurationAvailabilityInfo(outPtr)
        }

        return this.__IDetectionConfigurationAvailabilityInfo.get_HasPermission()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasLockScreenPermission() {
        if (!this.HasProp("__IDetectionConfigurationAvailabilityInfo")) {
            if ((queryResult := this.QueryInterface(IDetectionConfigurationAvailabilityInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectionConfigurationAvailabilityInfo := IDetectionConfigurationAvailabilityInfo(outPtr)
        }

        return this.__IDetectionConfigurationAvailabilityInfo.get_HasLockScreenPermission()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_UnavailableSystemResources() {
        if (!this.HasProp("__IDetectionConfigurationAvailabilityInfo2")) {
            if ((queryResult := this.QueryInterface(IDetectionConfigurationAvailabilityInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectionConfigurationAvailabilityInfo2 := IDetectionConfigurationAvailabilityInfo2(outPtr)
        }

        return this.__IDetectionConfigurationAvailabilityInfo2.get_UnavailableSystemResources()
    }

;@endregion Instance Methods
}
