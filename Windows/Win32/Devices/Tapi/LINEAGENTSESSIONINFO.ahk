#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\CY.ahk" { CY }

/**
 * The LINEAGENTSESSIONINFO structure contains information about the ACD agent session. The lineGetAgentSessionInfo function returns the LINEAGENTSESSIONINFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentsessioninfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTSESSIONINFO {
    #StructPack 8

    /**
     * Total size allocated to this structure, in bytes.
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
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentsessionstate--constants">LINEAGENTSESSIONSTATE_ constants</a>.
     */
    dwAgentSessionState : UInt32

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentsessionstate--constants">LINEAGENTSESSIONSTATE_ constants</a>.
     */
    dwNextAgentSessionState : UInt32

    /**
     * Time session was created.
     */
    dateSessionStartTime : Float64

    /**
     * Duration of the agent session in seconds. Active period only; timing stops when a session enters the ASST_SESSION_ENDED state.
     */
    dwSessionDuration : UInt32

    /**
     * Number of ACD calls handled during this agent session by this agent.
     */
    dwNumberOfCalls : UInt32

    /**
     * Number of seconds spent talking in ACD calls during this agent session by this agent.
     */
    dwTotalTalkTime : UInt32

    /**
     * Average time spent talking for each ACD call during this agent session by this agent, in seconds.
     */
    dwAverageTalkTime : UInt32

    /**
     * Number of seconds spent on ACD calls during this agent session by this agent. It includes time on the phone plus wrap-up time.
     */
    dwTotalCallTime : UInt32

    /**
     * Average time spent for each ACD call during this agent session, in seconds. Includes time on the phone plus wrap-up time.
     */
    dwAverageCallTime : UInt32

    /**
     * Number of seconds spent on ACD call wrap-up (after-call work) during this agent session by this agent.
     */
    dwTotalWrapUpTime : UInt32

    /**
     * Average time for each ACD call spent in wrap-up (after-call work) during this agent session, in seconds.
     */
    dwAverageWrapUpTime : UInt32

    /**
     * Call rate for each agent session. This is a fixed-point decimal number.
     */
    cyACDCallRate : CY

    /**
     * Longest time a call was waiting to be answered, in seconds.
     */
    dwLongestTimeToAnswer : UInt32

    /**
     * Average time calls waited to be answered, in seconds.
     */
    dwAverageTimeToAnswer : UInt32

}
