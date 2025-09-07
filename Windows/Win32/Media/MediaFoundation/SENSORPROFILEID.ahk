#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a sensor profile ID.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-sensorprofileid
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class SENSORPROFILEID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/medfound/sensor-profile-guids">Sensor Profile GUID</a> that describes the type of sensor profile.
     * @type {Pointer<Guid>}
     */
    Type {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The index of the sensor profile.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Not currently used.
     * @type {Integer}
     */
    Unused {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
