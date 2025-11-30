#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ne-evntcons-etw_provider_trait_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_PROVIDER_TRAIT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EtwProviderTraitTypeGroup => 1

    /**
     * @type {Integer (Int32)}
     */
    static EtwProviderTraitDecodeGuid => 2

    /**
     * @type {Integer (Int32)}
     */
    static EtwProviderTraitTypeMax => 3
}
