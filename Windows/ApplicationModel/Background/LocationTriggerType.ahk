#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates a type of location event for a location background task trigger.
 * @remarks
 * Only one trigger for geofencing can be registered per app. This trigger will be executed for all geofences registered by the app.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.locationtriggertype
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class LocationTriggerType extends Win32Enum{

    /**
     * Indicates a geofence location trigger.
     * @type {Integer (Int32)}
     */
    static Geofence => 0
}
