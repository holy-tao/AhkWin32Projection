#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used for enumerating provider contexts.
 * @remarks
 * 
 * <b>FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Uniquely identifies a provider. If this value is non-NULL, only options with the specifies provider will be returned.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Only return provider contexts of the specified type.
     * 
     * See [FWPM_PROVIDER_CONTEXT_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_provider_context_type) for more information.
     * @type {Integer}
     */
    providerContextType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
