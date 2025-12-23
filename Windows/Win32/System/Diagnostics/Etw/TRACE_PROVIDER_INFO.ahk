#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the GUID and name for a provider.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-trace_provider_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_PROVIDER_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * GUID that uniquely identifies the provider.
     * @type {Pointer<Guid>}
     */
    ProviderGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Is zero if the provider uses a XML manifest to provide a description of its events. Otherwise, the value is 1 if the provider uses a WMI MOF class to provide a description of its events.
     * @type {Integer}
     */
    SchemaSource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Offset to a null-terminated Unicode string that contains the name of the provider. The offset is from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_enumeration_info">PROVIDER_ENUMERATION_INFO</a> buffer that <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviders">TdhEnumerateProviders</a> returns.
     * @type {Integer}
     */
    ProviderNameOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
