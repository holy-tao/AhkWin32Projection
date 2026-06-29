#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * This structure is used to set the over or under temperature threshold of a storage device (via IOCTL_STORAGE_SET_TEMPERATURE_THRESHOLD).
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_temperature_threshold
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_TEMPERATURE_THRESHOLD {
    #StructPack 4

    /**
     * The version of the structure.
     */
    Version : UInt32

    /**
     * The size of this structure. This should be set to sizeof(<b>STORAGE_TEMPERATURE_THRESHOLD</b>).
     */
    Size : UInt32

    /**
     * Flags set for this request. The following are valid flags.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_COMMAND_FLAG_ADAPTER_REQUEST</b></td>
     * <td>This flag indicates the request to target an adapter instead of device.</td>
     * </tr>
     * </table>
     */
    Flags : UInt16

    /**
     * Identifies the instance of temperature information. Starts from 0. Index 0 may indicate a composite value.
     */
    Index : UInt16

    /**
     * A signed value that indicates the temperature of the threshold, in degrees Celsius.
     */
    Threshold : Int16

    /**
     * Indicates if the <i>Threshold</i> specifies the over or under temperature threshold. If <b>true</b>, set the <b>OverThreshold</b> temperature value of the device; otherwise, set the <b>UnderThreshold</b> temperature value.
     */
    OverThreshold : BOOLEAN

    /**
     * Reserved for future use.
     */
    Reserved : Int8

}
