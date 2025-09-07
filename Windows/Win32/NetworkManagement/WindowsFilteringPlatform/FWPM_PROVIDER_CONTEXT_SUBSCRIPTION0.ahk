#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to subscribe for change notifications. (FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0)
 * @remarks
 * <b>FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0</b> is a specific implementation of FWPM_PROVIDER_CONTEXT_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Notifications are only dispatched for objects that match the template. If the template is <b>NULL</b>, it matches all objects.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0">FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</a> for more information
     * @type {Pointer<FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0>}
     */
    enumTemplate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Uniquely identifies this session.
     * @type {Pointer<Guid>}
     */
    sessionKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
