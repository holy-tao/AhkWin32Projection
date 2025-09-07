#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains process mitigation policy settings for data execution prevention (DEP).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_dep_policy
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_MITIGATION_DEP_POLICY extends Win32Struct
{
    static sizeof => 8

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

    /**
     * DEP is permanently enabled and cannot be disabled if this field is set to TRUE.
     * @type {Integer}
     */
    Permanent {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
