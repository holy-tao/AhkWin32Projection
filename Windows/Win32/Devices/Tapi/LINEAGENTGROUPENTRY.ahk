#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTGROUPENTRY structure provides information on ACD agent groups. The LINEAGENTGROUPLIST structure can contain an array of LINEAGENTGROUPENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentgroupentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTGROUPENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * @type {Integer}
     */
    dwGroupID1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwGroupID2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwGroupID3 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwGroupID4 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the ACD group or queue name including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwNameSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string specifying the name and other identifying information of an ACD group or queue into which the agent can log in. This string can contain such information as supervisor and skill level, to assist the agent in selecting the correct group from a list displayed on their workstation screen. The size of the field is specified by <b>dwNameSize</b>.
     * @type {Integer}
     */
    dwNameOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
