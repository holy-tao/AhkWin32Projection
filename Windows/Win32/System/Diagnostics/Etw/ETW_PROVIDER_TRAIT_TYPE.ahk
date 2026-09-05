#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of Provider Traits supported by Event Tracing for Windows (ETW).
 * @remarks
 * Providers are applications that can generate event logs.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ne-evntcons-etw_provider_trait_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_PROVIDER_TRAIT_TYPE extends Win32Enum {

    /**
     * ETW Provider trait group.
     * Native name: EtwProviderTraitTypeGroup
     * @type {Integer (Int32)}
     */
    static Group => 1

    /**
     * ETW Provider trait decode GUID.
     * Native name: EtwProviderTraitDecodeGuid
     * @type {Integer (Int32)}
     */
    static DecodeGuid => 2

    /**
     * ETW Provider trait type maximum.
     * Native name: EtwProviderTraitTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
