#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAlarmApplicationManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Requests permission from the user to set alarms, and retrieves the status of user permission for the app to set alarms.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.alarmapplicationmanager
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class AlarmApplicationManager extends IInspectable {
;@region Static Methods
    /**
     * Requests permission from the user to set alarms.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.alarmapplicationmanager.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!AlarmApplicationManager.HasProp("__IAlarmApplicationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.AlarmApplicationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAlarmApplicationManagerStatics.IID)
            AlarmApplicationManager.__IAlarmApplicationManagerStatics := IAlarmApplicationManagerStatics(factoryPtr)
        }

        return AlarmApplicationManager.__IAlarmApplicationManagerStatics.RequestAccessAsync()
    }

    /**
     * Retrieves the status of user permission for the app to set alarms.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.alarmapplicationmanager.getaccessstatus
     */
    static GetAccessStatus() {
        if (!AlarmApplicationManager.HasProp("__IAlarmApplicationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.AlarmApplicationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAlarmApplicationManagerStatics.IID)
            AlarmApplicationManager.__IAlarmApplicationManagerStatics := IAlarmApplicationManagerStatics(factoryPtr)
        }

        return AlarmApplicationManager.__IAlarmApplicationManagerStatics.GetAccessStatus()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
