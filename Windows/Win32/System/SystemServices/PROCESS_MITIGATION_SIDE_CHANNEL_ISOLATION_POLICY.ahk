#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This data structure provides the status of process policies that are related to the mitigation of side channels. This can include side channel attacks involving speculative execution and page combining.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-process_mitigation_side_channel_isolation_policy
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_MITIGATION_SIDE_CHANNEL_ISOLATION_POLICY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
