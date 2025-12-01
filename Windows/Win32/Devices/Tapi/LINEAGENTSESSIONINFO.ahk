#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk

/**
 * The LINEAGENTSESSIONINFO structure contains information about the ACD agent session. The lineGetAgentSessionInfo function returns the LINEAGENTSESSIONINFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentsessioninfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTSESSIONINFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Total size allocated to this structure, in bytes.
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
     * Size of the portion of this structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentsessionstate--constants">LINEAGENTSESSIONSTATE_ constants</a>.
     * @type {Integer}
     */
    dwAgentSessionState {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentsessionstate--constants">LINEAGENTSESSIONSTATE_ constants</a>.
     * @type {Integer}
     */
    dwNextAgentSessionState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Time session was created.
     * @type {Float}
     */
    dateSessionStartTime {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * Duration of the agent session in seconds. Active period only; timing stops when a session enters the ASST_SESSION_ENDED state.
     * @type {Integer}
     */
    dwSessionDuration {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Number of ACD calls handled during this agent session by this agent.
     * @type {Integer}
     */
    dwNumberOfCalls {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Number of seconds spent talking in ACD calls during this agent session by this agent.
     * @type {Integer}
     */
    dwTotalTalkTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Average time spent talking for each ACD call during this agent session by this agent, in seconds.
     * @type {Integer}
     */
    dwAverageTalkTime {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Number of seconds spent on ACD calls during this agent session by this agent. It includes time on the phone plus wrap-up time.
     * @type {Integer}
     */
    dwTotalCallTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Average time spent for each ACD call during this agent session, in seconds. Includes time on the phone plus wrap-up time.
     * @type {Integer}
     */
    dwAverageCallTime {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Number of seconds spent on ACD call wrap-up (after-call work) during this agent session by this agent.
     * @type {Integer}
     */
    dwTotalWrapUpTime {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Average time for each ACD call spent in wrap-up (after-call work) during this agent session, in seconds.
     * @type {Integer}
     */
    dwAverageWrapUpTime {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Call rate for each agent session. This is a fixed-point decimal number.
     * @type {CY}
     */
    cyACDCallRate{
        get {
            if(!this.HasProp("__cyACDCallRate"))
                this.__cyACDCallRate := CY(64, this)
            return this.__cyACDCallRate
        }
    }

    /**
     * Longest time a call was waiting to be answered, in seconds.
     * @type {Integer}
     */
    dwLongestTimeToAnswer {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Average time calls waited to be answered, in seconds.
     * @type {Integer}
     */
    dwAverageTimeToAnswer {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}
