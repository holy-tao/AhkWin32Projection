#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\CY.ahk" { CY }

/**
 * The LINEAGENTINFO structure contains information about an ACD agent. The lineGetAgentInfo function returns the LINEAGENTINFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTINFO {
    #StructPack 8

    /**
     * Total size allocated to this structure including the null terminator, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed to hold all the information requested, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstateex--constants">LINEAGENTSTATEEX_ constants</a>.
     */
    dwAgentState : UInt32

    /**
     * Must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstateex--constants">LINEAGENTSTATEEX_ constants</a>.
     */
    dwNextAgentState : UInt32

    /**
     * Period for which the switch or implementation stores and calculates information, in seconds. For example, <b>dwNumberOfACDCalls</b> holds the number of calls the agent handled; <b>dwMeasurementPeriod</b> indicates if this value referenced the calls handed in the last hour, day, or month.
     */
    dwMeasurementPeriod : UInt32

    /**
     * Agent's call rate (calls per agent hour — where agent hour represents the time that an agent was active in one or more agent sessions) across all agent sessions. This is a fixed-point decimal number.
     */
    cyOverallCallRate : CY

    /**
     * Number of ACD calls handled by this agent across all sessions.
     */
    dwNumberOfACDCalls : UInt32

    /**
     * Number of incoming non-ACD calls handled by this agent.
     */
    dwNumberOfIncomingCalls : UInt32

    /**
     * Number of outgoing non-ACD calls handled by this agent.
     */
    dwNumberOfOutgoingCalls : UInt32

    /**
     * Number of seconds spent talking in ACD calls by this agent across all sessions.
     */
    dwTotalACDTalkTime : UInt32

    /**
     * Number of seconds spent on ACD calls by this agent (across all sessions). Includes the time on phone plus wrap-up time.
     */
    dwTotalACDCallTime : UInt32

    /**
     * Number of seconds spent on ACD call wrap-up (after call work) by this agent across all sessions.
     */
    dwTotalACDWrapUpTime : UInt32

}
