#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTACTIVITYENTRY structure describes a single ACD agent activity. The LINEAGENTACTIVITYLIST structure can contain an array of LINEAGENTACTIVITYENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentactivityentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTACTIVITYENTRY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * Unique identifier for an activity. It is the responsibility of the agent handler to generate and maintain uniqueness of this identifier.
     * @type {Integer}
     */
    dwID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the activity name including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset from the beginning of this structure to a <b>null</b>-terminated string specifying the name and other identifying information of an activity that can be selected by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentactivity">lineSetAgentActivity</a> function. The size of the string is specified by <b>dwNameSize</b>.
     * @type {Integer}
     */
    dwNameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
