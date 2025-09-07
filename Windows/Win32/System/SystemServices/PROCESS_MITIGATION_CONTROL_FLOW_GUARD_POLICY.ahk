#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains process mitigation policy settings for Control Flow Guard (CFG).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_control_flow_guard_policy
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_MITIGATION_CONTROL_FLOW_GUARD_POLICY extends Win32Struct
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
