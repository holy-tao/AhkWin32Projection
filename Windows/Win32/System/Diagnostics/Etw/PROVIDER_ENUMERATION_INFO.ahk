#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRACE_PROVIDER_INFO.ahk" { TRACE_PROVIDER_INFO }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the array of providers that have registered a MOF or manifest on the computer.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_enumeration_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PROVIDER_ENUMERATION_INFO {
    #StructPack 4

    /**
     * Number of elements in the <b>TraceProviderInfoArray</b> array.
     */
    NumberOfProviders : UInt32

    Reserved : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_provider_info">TRACE_PROVIDER_INFO</a> structures that contain information about each provider such as its name and unique identifier.
     */
    TraceProviderInfoArray : TRACE_PROVIDER_INFO[1]

}
