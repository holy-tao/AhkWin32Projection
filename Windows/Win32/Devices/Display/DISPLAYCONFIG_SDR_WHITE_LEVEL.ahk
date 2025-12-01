#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * The DISPLAYCONFIG_SDR_WHITE_LEVEL structure (wingdi.h) contains information about a display's current SDR white level.
 * @remarks
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information for getting the SDR white level. The <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER is set to DISPLAYCONFIG_DEVICE_INFO_GET_SDR_WHITE_LEVEL. DISPLAYCONFIG_DEVICE_INFO_HEADER also contains the adapter and target identifiers of the target to get the SDR white level for. The <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER is set to at least the size of the DISPLAYCONFIG_SDR_WHITE_LEVEL structure.
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
     * The monitor's current SDR white level, specified as a multiplier of 80 nits, multiplied by 1000. E.g. a value of 1000 would indicate that the SDR white level is 80 nits, while a value of 2000 would indicate an SDR white level of 160 nits.
     * 
     * ```cpp
     * DISPLAYCONFIG_SDR_WHITE_LEVEL sdrWhiteLevel;
     * ...
     * float SDRWhiteLevelInNits = (float)sdrWhiteLevel.SDRWhiteLevel / 1000 * 80;
     * ```
     * @type {Integer}
     */
    SDRWhiteLevel {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
