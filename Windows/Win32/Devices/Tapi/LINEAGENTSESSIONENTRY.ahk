#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The LINEAGENTSESSIONENTRY structure describes an ACD agent session. The LINEAGENTSESSIONLIST structure can contain an array of LINEAGENTSESSIONENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentsessionentry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTSESSIONENTRY {
    #StructPack 4

    /**
     * Unique identifier for an agent session. It is the responsibility of the agent handler to generate and maintain uniqueness of these identifiers.
     */
    hAgentSession : UInt32

    /**
     * Unique identifier for an agent. It is the responsibility of the agent handler to generate and maintain uniqueness of these identifiers.
     */
    hAgent : UInt32

    /**
     * Universally unique identifier for an ACD group. It is the responsibility of the agent handler to generate and maintain uniqueness of this identifier.
     */
    GroupID : Guid

    /**
     * Address identifier on which the agent will receive calls for this session.
     */
    dwWorkingAddressID : UInt32

}
