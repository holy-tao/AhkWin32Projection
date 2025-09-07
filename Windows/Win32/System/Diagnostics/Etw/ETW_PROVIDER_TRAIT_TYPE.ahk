#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of Provider Traits supported by Event Tracing for Windows (ETW).
 * @remarks
 * Providers are applications that can generate event logs.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ne-evntcons-etw_provider_trait_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_PROVIDER_TRAIT_TYPE{

    /**
     * ETW Provider trait group.
     * @type {Integer (Int32)}
     */
    static EtwProviderTraitTypeGroup => 1

    /**
     * ETW Provider trait decode GUID.
     * @type {Integer (Int32)}
     */
    static EtwProviderTraitDecodeGuid => 2

    /**
     * ETW Provider trait type maximum.
     * @type {Integer (Int32)}
     */
    static EtwProviderTraitTypeMax => 3
}
