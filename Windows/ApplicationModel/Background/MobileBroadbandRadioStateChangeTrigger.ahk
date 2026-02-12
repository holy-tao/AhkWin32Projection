#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that indicates when mobile broadband radio state has changed. For example, this trigger activates when a mobile device transitions to or from airplane mode.
  * 
  * This functionality is available only to mobile operator apps and UWP app given privileged access by mobile network operators. For more information, see [Mobile broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * When this trigger activates, the [IBackgroundTaskInstance.TriggerDetails](ibackgroundtaskinstance_triggerdetails.md) for the background task is a [MobileBroadbandRadioStateChangeTriggerDetails](../windows.networking.networkoperators/mobilebroadbandradiostatechangetriggerdetails.md) instance.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.mobilebroadbandradiostatechangetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandRadioStateChangeTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Constructs a MobileBroadbandRadioStateChangeTrigger object.
     * 
     * This functionality is available only to mobile operator apps and UWP app given privileged access by mobile network operators. For more information, see [Mobile broadband](/windows-hardware/drivers/mobilebroadband/index).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.MobileBroadbandRadioStateChangeTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
