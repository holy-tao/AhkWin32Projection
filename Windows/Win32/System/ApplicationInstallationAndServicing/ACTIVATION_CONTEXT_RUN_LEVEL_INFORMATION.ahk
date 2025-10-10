#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION structure is used by the QueryActCtxW function.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-activation_context_run_level_information
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * This parameter is reserved for future use. This parameter currently returns 0.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-actctx_requested_run_level">ACTCTX_REQUESTED_RUN_LEVEL</a> enumeration value that gives the requested run level of the activation context.
     * @type {Integer}
     */
    RunLevel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * This parameter returns zero if the <b>uiAccess</b> attribute in the application manifest is false. This parameter returns a non-zero value if the <b>uiAccess</b> attribute in the manifest is true. True means that UI accessibility applications require access higher privileges.
     * @type {Integer}
     */
    UiAccess {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
