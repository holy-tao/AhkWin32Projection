#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTSTATUS structure describes the current status of an ACD agent. The lineGetAgentStatus function returns the LINEAGENTSTATUS structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentstatus
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTSTATUS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 1

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size needed to hold all the information requested, in bytes.
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
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures that appear in the <i>GroupList</i> array. The value is 0 if no agent is logged in on the address.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the group list array, in bytes.
     * @type {Integer}
     */
    dwGroupListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of this structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures. The size is <b>dwNumEntries</b> times SIZEOF(LINEAGENTGROUPENTRY). The array contains groups into which the agent is currently logged in on the address. The size of the field is specified by <b>dwGroupListSize</b>.
     * @type {Integer}
     */
    dwGroupListOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Current state of the agent. One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * State into which the agent is automatically placed when the current call completes. One of the <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     * @type {Integer}
     */
    dwNextState {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Identifier of the current agent activity.
     * @type {Integer}
     */
    dwActivityID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Size of the agent activity string, in bytes.
     * @type {Integer}
     */
    dwActivitySize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Offset from the beginning of the structure to a null-terminated string specifying the current agent activity. The size of the string is specified by <b>dwActivitySize</b>.
     * @type {Integer}
     */
    dwActivityOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Agent-related features available at the time the status was obtained, using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentfeature--constants">LINEAGENTFEATURE_ constants</a>.
     * @type {Integer}
     */
    dwAgentFeatures {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Agent states that could be selected, at this point in time, using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a>. Consists of one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     * @type {Integer}
     */
    dwValidStates {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Next agent states that could be selected, at this point in time, by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a> function. Consists of one or more of the <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     * @type {Integer}
     */
    dwValidNextStates {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
