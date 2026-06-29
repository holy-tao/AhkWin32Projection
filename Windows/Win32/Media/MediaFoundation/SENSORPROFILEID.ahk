#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a sensor profile ID.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-sensorprofileid
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct SENSORPROFILEID {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/medfound/sensor-profile-guids">Sensor Profile GUID</a> that describes the type of sensor profile.
     */
    Type : Guid

    /**
     * The index of the sensor profile.
     */
    Index : UInt32

    /**
     * Not currently used.
     */
    Unused : UInt32

}
