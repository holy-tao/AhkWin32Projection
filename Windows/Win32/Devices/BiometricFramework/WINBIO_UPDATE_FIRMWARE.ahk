#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_UPDATE_FIRMWARE extends Win32Struct
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
     * @type {WINBIO_DATA}
     */
    FirmwareData{
        get {
            if(!this.HasProp("__FirmwareData"))
                this.__FirmwareData := WINBIO_DATA(this.ptr + 8)
            return this.__FirmwareData
        }
    }
}
