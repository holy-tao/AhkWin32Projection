#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_sdr_white_level
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_SDR_WHITE_LEVEL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DISPLAYCONFIG_DEVICE_INFO_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DISPLAYCONFIG_DEVICE_INFO_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * @type {Integer}
     */
    SDRWhiteLevel {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
