#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTACTIVITYENTRY structure describes a single ACD agent activity. The LINEAGENTACTIVITYLIST structure can contain an array of LINEAGENTACTIVITYENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentactivityentry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTACTIVITYENTRY {
    #StructPack 4

    /**
     * Unique identifier for an activity. It is the responsibility of the agent handler to generate and maintain uniqueness of this identifier.
     */
    dwID : UInt32

    /**
     * Size of the activity name including the <b>null</b> terminator, in bytes.
     */
    dwNameSize : UInt32

    /**
     * Offset from the beginning of this structure to a <b>null</b>-terminated string specifying the name and other identifying information of an activity that can be selected by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentactivity">lineSetAgentActivity</a> function. The size of the string is specified by <b>dwNameSize</b>.
     */
    dwNameOffset : UInt32

}
