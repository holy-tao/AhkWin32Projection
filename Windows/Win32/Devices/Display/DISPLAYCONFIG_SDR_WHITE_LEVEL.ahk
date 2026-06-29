#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * The DISPLAYCONFIG_SDR_WHITE_LEVEL structure (wingdi.h) contains information about a display's current SDR white level.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_sdr_white_level
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_SDR_WHITE_LEVEL {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information for getting the SDR white level. The <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER is set to DISPLAYCONFIG_DEVICE_INFO_GET_SDR_WHITE_LEVEL. DISPLAYCONFIG_DEVICE_INFO_HEADER also contains the adapter and target identifiers of the target to get the SDR white level for. The <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER is set to at least the size of the DISPLAYCONFIG_SDR_WHITE_LEVEL structure.
     */
    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * The monitor's current SDR white level, specified as a multiplier of 80 nits, multiplied by 1000. E.g. a value of 1000 would indicate that the SDR white level is 80 nits, while a value of 2000 would indicate an SDR white level of 160 nits.
     * 
     * ```cpp
     * DISPLAYCONFIG_SDR_WHITE_LEVEL sdrWhiteLevel;
     * ...
     * float SDRWhiteLevelInNits = (float)sdrWhiteLevel.SDRWhiteLevel / 1000 * 80;
     * ```
     */
    SDRWhiteLevel : UInt32

}
