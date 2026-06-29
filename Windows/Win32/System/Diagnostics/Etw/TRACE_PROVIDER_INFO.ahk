#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Defines the GUID and name for a provider.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-trace_provider_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class TRACE_PROVIDER_INFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * GUID that uniquely identifies the provider.
     * @type {Guid}
     */
    ProviderGuid {
        get {
            if(!this.HasProp("__ProviderGuid"))
                this.__ProviderGuid := Guid(0, this)
            return this.__ProviderGuid
        }
    }

    /**
     * Is zero if the provider uses a XML manifest to provide a description of its events. Otherwise, the value is 1 if the provider uses a WMI MOF class to provide a description of its events.
     * @type {Integer}
     */
    SchemaSource {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset to a null-terminated Unicode string that contains the name of the provider. The offset is from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_enumeration_info">PROVIDER_ENUMERATION_INFO</a> buffer that <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviders">TdhEnumerateProviders</a> returns.
     * @type {Integer}
     */
    ProviderNameOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
