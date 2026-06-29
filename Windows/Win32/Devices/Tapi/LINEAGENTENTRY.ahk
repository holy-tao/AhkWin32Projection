#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTENTRY structure describes an individual ACD agent. The LINEAGENTLIST structure can contain an array of LINEAGENTENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagententry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTENTRY {
    #StructPack 4

    /**
     * Unique identifier for an agent. It is the responsibility of the agent handler to generate and maintain uniqueness of these identifiers.
     */
    hAgent : UInt32

    /**
     * Size of the agent name string including the <b>null</b> terminator, in bytes.
     */
    dwNameSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the name of the agent, which is also the operating system's user name. The size of the string is specified by <b>dwNameSize</b>.
     */
    dwNameOffset : UInt32

    /**
     * Size of the ID string including the <b>null</b> terminator, in bytes.
     */
    dwIDSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the ID of the agent. Used by legacy ACD systems to identify the agent. The size of the string is specified by <b>dwIDSize</b>.
     */
    dwIDOffset : UInt32

    /**
     * Size of the PIN string, in bytes.
     */
    dwPINSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the PIN or password of the agent. Used by legacy ACD systems for agent authorization. The size of the string is specified by <b>dwPINSize</b>.
     */
    dwPINOffset : UInt32

}
