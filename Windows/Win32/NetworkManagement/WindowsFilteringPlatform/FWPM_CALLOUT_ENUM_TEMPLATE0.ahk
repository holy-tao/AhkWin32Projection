#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used for limiting callout enumerations.
 * @remarks
 * <b>FWPM_CALLOUT_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_CALLOUT_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_callout_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CALLOUT_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Uniquely identifies the provider associated with the callout. If this member is non-NULL, only objects associated with the specified provider will be returned.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Uniquely identifies a layer. If this member is non-NULL, only callouts associated with the specified layer will be returned.
     * @type {Pointer<Guid>}
     */
    layerKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
