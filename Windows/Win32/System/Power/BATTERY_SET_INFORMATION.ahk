#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BATTERY_SET_INFORMATION_LEVEL.ahk" { BATTERY_SET_INFORMATION_LEVEL }

/**
 * Contains battery information to be set.
 * @remarks
 * The **BATTERY\_SET\_INFORMATION** structure is a variable-length structure, and you must allocate a buffer of suitable size for the information to be included in the structure.
 * @see https://learn.microsoft.com/windows/win32/Power/battery-set-information-str
 * @namespace Windows.Win32.System.Power
 */
export default struct BATTERY_SET_INFORMATION {
    #StructPack 4

    /**
     * The current battery tag for the battery. Information for a battery matching the tag can only be returned. Whenever this value does not match the battery's current tag, the IOCTL request will be completed with ERROR\_FILE\_NOT\_FOUND, which indicates to the caller that the battery for which it has a tag for no longer exists. The caller may opt to use the [**IOCTL\_BATTERY\_QUERY\_TAG**](ioctl-battery-query-tag.md) operation to determine the tag of the newly installed battery, if one exists. (See [Battery Tags](battery-information.md) for more information.)
     * 
     * When a query information request is made, this value is verified. In addition, if the request is in progress while this value changes, the request is aborted with the status of ERROR\_FILE\_NOT\_FOUND.
     */
    BatteryTag : UInt32

    /**
     * The battery information to be set. The type of data in the **Buffer** member depends on the value of this member. This member can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                                       | Meaning                                                                                                                                                                                                                                                                                                                                              |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="BatteryCharge"></span><span id="batterycharge"></span><span id="BATTERYCHARGE"></span><dl> <dt>**BatteryCharge**</dt> <dt>1</dt> </dl>                         | Informs the battery device that the user has requested that the battery should be charging at this time. For example, with a smart battery/charger/selector, the application could charge one battery at a time. The **Buffer** member of this structure is ignored.<br/>                                                                      |
     * | <span id="BatteryCriticalBias"></span><span id="batterycriticalbias"></span><span id="BATTERYCRITICALBIAS"></span><dl> <dt>**BatteryCriticalBias**</dt> <dt>0</dt> </dl> | Sets the battery's critical bias adjustment. Note it is not envisioned that this value would normally be changed by software, and is present in the interfaces only as a maintenance feature. Not all batteries can maintain such a setting, and the battery information should be read to confirm that the battery accepted the setting.<br/> |
     * | <span id="BatteryDischarge"></span><span id="batterydischarge"></span><span id="BATTERYDISCHARGE"></span><dl> <dt>**BatteryDischarge**</dt> <dt>2</dt> </dl>             | Informs the battery device that the user has requested that the battery be discharging at this time. For example, this could be used to indicate which battery the user currently wants to power the system. The **Buffer** member of this structure is ignored.<br/>                                                                          |
     */
    InformationLevel : BATTERY_SET_INFORMATION_LEVEL

    /**
     * The battery information to be set. The data depends on the value of **InformationLevel**.
     */
    Buffer : Int8[1]

}
