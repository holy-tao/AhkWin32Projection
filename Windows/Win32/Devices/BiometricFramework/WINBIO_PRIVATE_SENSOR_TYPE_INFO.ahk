#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PRIVATE_SENSOR_TYPE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PayloadSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HRESULT}
     */
    WinBioHresult {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {WINBIO_DATA}
     */
    PrivateSensorTypeInfo{
        get {
            if(!this.HasProp("__PrivateSensorTypeInfo"))
                this.__PrivateSensorTypeInfo := WINBIO_DATA(this.ptr + 8)
            return this.__PrivateSensorTypeInfo
        }
    }
}
