#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEDEVSTATUS structure describes the current status of a line device. The lineGetLineDevStatus function and the TSPI_lineGetLineDevStatus function return the LINEDEVSTATUS structure.
 * @remarks
 * 
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * The members <b>dwAvailableMediaModes</b> through <b>dwAppInfoOffset</b> are available only to applications that open the line device with an API version of 2.0 or later.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linedevstatus
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEDEVSTATUS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of active opens on the line device.
     * @type {Integer}
     */
    dwNumOpens {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Bit array that indicates for which media types the line device is currently open.
     * @type {Integer}
     */
    dwOpenMediaModes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of calls on the line in call states other than <i>idle</i>, <i>onhold</i>, <i>onholdpendingtransfer</i>, and <i>onholdpendingconference</i>.
     * @type {Integer}
     */
    dwNumActiveCalls {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of calls on the line in the <i>onhold</i> state.
     * @type {Integer}
     */
    dwNumOnHoldCalls {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Number of calls on the line in the <i>onholdpendingtransfer</i> or <i>onholdpendingconference</i> state.
     * @type {Integer}
     */
    dwNumOnHoldPendCalls {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Line-related functions that are currently available on this line. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linefeature--constants">LINEFEATURE_ Constants</a>.
     * @type {Integer}
     */
    dwLineFeatures {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Number of outstanding call completion requests on the line.
     * @type {Integer}
     */
    dwNumCallCompletions {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Current ring mode on the line device.
     * @type {Integer}
     */
    dwRingMode {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Current signal level of the connection on the line. This is a value in the range 0x00000000 (weakest signal) to 0x0000FFFF (strongest signal).
     * @type {Integer}
     */
    dwSignalLevel {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Current battery level of the line device hardware. This is a value in the range 0x00000000 (battery empty) to 0x0000FFFF (battery full).
     * @type {Integer}
     */
    dwBatteryLevel {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Current roam mode of the line device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineroammode--constants">LINEROAMMODE_ Constants</a>.
     * @type {Integer}
     */
    dwRoamMode {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Flags that indicate status information, such as whether the device is locked. It consists of one or more members of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedevstatusflags--constants">LINEDEVSTATUSFLAGS_ Constants</a>.
     * @type {Integer}
     */
    dwDevStatusFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Size of the variably-sized device field containing an array of current terminal modes, in bytes.
     * @type {Integer}
     */
    dwTerminalModesSize {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Offset from the beginning of the structure to an array of current terminal modes, in bytes. This array is indexed by terminal IDs, in the range from zero to <b>dwNumTerminals</b> minus one. Each entry in the array specifies the current terminal modes for the corresponding terminal set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetterminal">lineSetTerminal</a> function for this line. Each entry is a <b>DWORD</b> that specifies one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ Constants</a>. The size of the array is specified by <b>dwTerminalModesSize</b>.
     * @type {Integer}
     */
    dwTerminalModesOffset {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Size of the variably sized device-specific field, in bytes. If the device-specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Offset from the beginning of the structure to the device-specific field, in bytes. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Indicates the media types that can be invoked on new calls created on this line device, when the <b>dwLineFeatures</b> member indicates that new calls are possible. If this member is zero, it indicates that the service provider either does not know or cannot indicate which media types are available, in which case any or all of the media types indicated in the <b>dwMediaModes</b> member in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> may be available.
     * @type {Integer}
     */
    dwAvailableMediaModes {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Size of the array that identifies the applications that have the line open, in bytes.
     * @type {Integer}
     */
    dwAppInfoSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineappinfo">LINEAPPINFO</a> structures. The <b>dwNumOpens</b> member indicates the number of elements in the array. Each element in the array identifies an application that has the line open. The size of the array is specified by <b>dwAppInfoSize</b>.
     * @type {Integer}
     */
    dwAppInfoOffset {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}
