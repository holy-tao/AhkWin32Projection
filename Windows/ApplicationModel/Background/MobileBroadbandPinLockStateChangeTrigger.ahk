#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that indicates when the SIM PIN lock state has changed.
  * 
  * This functionality is available only to mobile operator apps and UWP app given privileged access by mobile network operators. For more information, see [Mobile broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * When this trigger activates, the [IBackgroundTaskInstance.TriggerDetails](ibackgroundtaskinstance_triggerdetails.md) for the background task is a [MobileBroadbandPinLockStateChangeTriggerDetails](../windows.networking.networkoperators/mobilebroadbandpinlockstatechangetriggerdetails.md) instance.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.mobilebroadbandpinlockstatechangetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinLockStateChangeTrigger extends IInspectable {
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
     * Constructs a MobileBroadbandPinLockStateChangeTrigger object.
     * 
     * This functionality is available only to mobile operator apps and UWP app given privileged access by mobile network operators. For more information, see [Mobile broadband](/windows-hardware/drivers/mobilebroadband/index).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.MobileBroadbandPinLockStateChangeTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
