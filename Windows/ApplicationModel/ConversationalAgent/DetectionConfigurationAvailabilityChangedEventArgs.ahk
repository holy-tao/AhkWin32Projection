#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDetectionConfigurationAvailabilityChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the [ActivationSignalDetectionConfiguration.AvailabilityChanged](activationsignaldetectionconfiguration_availabilitychanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilitychangedeventargs
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class DetectionConfigurationAvailabilityChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDetectionConfigurationAvailabilityChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDetectionConfigurationAvailabilityChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the permission levels granted by a user to the [ActivationSignalDetector](activationsignaldetector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilitychangedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
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
    get_Kind() {
        if (!this.HasProp("__IDetectionConfigurationAvailabilityChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDetectionConfigurationAvailabilityChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectionConfigurationAvailabilityChangedEventArgs := IDetectionConfigurationAvailabilityChangedEventArgs(outPtr)
        }

        return this.__IDetectionConfigurationAvailabilityChangedEventArgs.get_Kind()
    }

;@endregion Instance Methods
}
