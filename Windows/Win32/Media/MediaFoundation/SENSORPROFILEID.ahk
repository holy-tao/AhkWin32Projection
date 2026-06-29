#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a sensor profile ID.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-sensorprofileid
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class SENSORPROFILEID extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/medfound/sensor-profile-guids">Sensor Profile GUID</a> that describes the type of sensor profile.
     * @type {Guid}
     */
    Type {
        get {
            if(!this.HasProp("__Type"))
                this.__Type := Guid(0, this)
            return this.__Type
        }
    }

    /**
     * The index of the sensor profile.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Not currently used.
     * @type {Integer}
     */
    Unused {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
