#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the types of Provider Traits supported by Event Tracing for Windows (ETW).
 * @remarks
 * Providers are applications that can generate event logs.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ne-evntcons-etw_provider_trait_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_PROVIDER_TRAIT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
