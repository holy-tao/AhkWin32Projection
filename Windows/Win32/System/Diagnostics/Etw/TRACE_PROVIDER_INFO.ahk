#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the GUID and name for a provider.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-trace_provider_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_PROVIDER_INFO {
    #StructPack 4

    /**
     * GUID that uniquely identifies the provider.
     */
    ProviderGuid : Guid

    /**
     * Is zero if the provider uses a XML manifest to provide a description of its events. Otherwise, the value is 1 if the provider uses a WMI MOF class to provide a description of its events.
     */
    SchemaSource : UInt32

    /**
     * Offset to a null-terminated Unicode string that contains the name of the provider. The offset is from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_enumeration_info">PROVIDER_ENUMERATION_INFO</a> buffer that <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviders">TdhEnumerateProviders</a> returns.
     */
    ProviderNameOffset : UInt32

}
