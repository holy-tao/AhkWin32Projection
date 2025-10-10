#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTENTRY structure describes an individual ACD agent. The LINEAGENTLIST structure can contain an array of LINEAGENTENTRY structures.
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineagententry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTENTRY extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Unique identifier for an agent. It is the responsibility of the agent handler to generate and maintain uniqueness of these identifiers.
     * @type {Integer}
     */
    hAgent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the agent name string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the name of the agent, which is also the operating system's user name. The size of the string is specified by <b>dwNameSize</b>.
     * @type {Integer}
     */
    dwNameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the ID string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwIDSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the ID of the agent. Used by legacy ACD systems to identify the agent. The size of the string is specified by <b>dwIDSize</b>.
     * @type {Integer}
     */
    dwIDOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of the PIN string, in bytes.
     * @type {Integer}
     */
    dwPINSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the PIN or password of the agent. Used by legacy ACD systems for agent authorization. The size of the string is specified by <b>dwPINSize</b>.
     * @type {Integer}
     */
    dwPINOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
