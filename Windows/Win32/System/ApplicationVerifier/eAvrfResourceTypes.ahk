#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the types of resources that can be enumerated using the VerifierEnumerateResource function.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-eavrfresourcetypes
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct eAvrfResourceTypes {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates heap-allocation information is being obtained.
     * @type {Integer (Int32)}
     */
    static AvrfResourceHeapAllocation => 0

    /**
     * Indicates handle trace information is being obtained.
     * @type {Integer (Int32)}
     */
    static AvrfResourceHandleTrace => 1

    /**
     * Indicates the upper boundary of the current implementation's resource type.
     * @type {Integer (Int32)}
     */
    static AvrfResourceMax => 2
}
