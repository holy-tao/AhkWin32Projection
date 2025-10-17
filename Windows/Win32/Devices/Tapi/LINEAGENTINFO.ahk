#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk

/**
 * The LINEAGENTINFO structure contains information about an ACD agent. The lineGetAgentInfo function returns the LINEAGENTINFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineagentinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTINFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Total size allocated to this structure including the null terminator, in bytes.
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
     * Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstateex--constants">LINEAGENTSTATEEX_ constants</a>.
     * @type {Integer}
     */
    dwAgentState {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstateex--constants">LINEAGENTSTATEEX_ constants</a>.
     * @type {Integer}
     */
    dwNextAgentState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Period for which the switch or implementation stores and calculates information, in seconds. For example, <b>dwNumberOfACDCalls</b> holds the number of calls the agent handled; <b>dwMeasurementPeriod</b> indicates if this value referenced the calls handed in the last hour, day, or month.
     * @type {Integer}
     */
    dwMeasurementPeriod {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Agent's call rate (calls per agent hour — where agent hour represents the time that an agent was active in one or more agent sessions) across all agent sessions. This is a fixed-point decimal number.
     * @type {CY}
     */
    cyOverallCallRate{
        get {
            if(!this.HasProp("__cyOverallCallRate"))
                this.__cyOverallCallRate := CY(24, this)
            return this.__cyOverallCallRate
        }
    }

    /**
     * Number of ACD calls handled by this agent across all sessions.
     * @type {Integer}
     */
    dwNumberOfACDCalls {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Number of incoming non-ACD calls handled by this agent.
     * @type {Integer}
     */
    dwNumberOfIncomingCalls {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Number of outgoing non-ACD calls handled by this agent.
     * @type {Integer}
     */
    dwNumberOfOutgoingCalls {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Number of seconds spent talking in ACD calls by this agent across all sessions.
     * @type {Integer}
     */
    dwTotalACDTalkTime {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Number of seconds spent on ACD calls by this agent (across all sessions). Includes the time on phone plus wrap-up time.
     * @type {Integer}
     */
    dwTotalACDCallTime {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Number of seconds spent on ACD call wrap-up (after call work) by this agent across all sessions.
     * @type {Integer}
     */
    dwTotalACDWrapUpTime {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
