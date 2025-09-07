#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains process mitigation policy settings for the ???.
 * @remarks
 * The [GetProcessMitigationPolicy](../processthreadsapi/nf-processthreadsapi-getprocessmitigationpolicy.md)  and [SetProcessMitigationPolicy](../processthreadsapi/nf-processthreadsapi-setprocessmitigationpolicy.md)  functions use this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process-mitigation-redirection-trust-policy
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_MITIGATION_REDIRECTION_TRUST_POLICY extends Win32Struct
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
