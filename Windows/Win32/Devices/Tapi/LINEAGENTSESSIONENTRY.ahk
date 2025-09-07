#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTSESSIONENTRY structure describes an ACD agent session. The LINEAGENTSESSIONLIST structure can contain an array of LINEAGENTSESSIONENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentsessionentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTSESSIONENTRY extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * Unique identifier for an agent session. It is the responsibility of the agent handler to generate and maintain uniqueness of these identifiers.
     * @type {Integer}
     */
    hAgentSession {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Unique identifier for an agent. It is the responsibility of the agent handler to generate and maintain uniqueness of these identifiers.
     * @type {Integer}
     */
    hAgent {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Universally unique identifier for an ACD group. It is the responsibility of the agent handler to generate and maintain uniqueness of this identifier.
     * @type {Pointer<Guid>}
     */
    GroupID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Address identifier on which the agent will receive calls for this session.
     * @type {Integer}
     */
    dwWorkingAddressID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
