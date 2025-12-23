#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the version of the TBS context implementation.
 * @see https://learn.microsoft.com/windows/win32/api/tbs/ns-tbs-tbs_context_params
 * @namespace Windows.Win32.System.TpmBaseServices
 * @version v4.0.30319
 */
class TBS_CONTEXT_PARAMS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The version of the TBS context implementation. This parameter must be TBS_CONTEXT_VERSION_ONE.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
