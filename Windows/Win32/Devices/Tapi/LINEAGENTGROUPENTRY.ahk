#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTGROUPENTRY structure provides information on ACD agent groups. The LINEAGENTGROUPLIST structure can contain an array of LINEAGENTGROUPENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentgroupentry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTGROUPENTRY {
    #StructPack 4


    struct _GroupID {
        dwGroupID1 : UInt32

        dwGroupID2 : UInt32

        dwGroupID3 : UInt32

        dwGroupID4 : UInt32

    }

    GroupID : LINEAGENTGROUPENTRY._GroupID

    /**
     * Size of the ACD group or queue name including the <b>null</b> terminator, in bytes.
     */
    dwNameSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string specifying the name and other identifying information of an ACD group or queue into which the agent can log in. This string can contain such information as supervisor and skill level, to assist the agent in selecting the correct group from a list displayed on their workstation screen. The size of the field is specified by <b>dwNameSize</b>.
     */
    dwNameOffset : UInt32

}
