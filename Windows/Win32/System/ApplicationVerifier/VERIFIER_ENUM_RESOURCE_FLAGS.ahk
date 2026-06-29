#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct VERIFIER_ENUM_RESOURCE_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static AVRF_ENUM_RESOURCES_FLAGS_DONT_RESOLVE_TRACES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AVRF_ENUM_RESOURCES_FLAGS_SUSPEND => 1
}
