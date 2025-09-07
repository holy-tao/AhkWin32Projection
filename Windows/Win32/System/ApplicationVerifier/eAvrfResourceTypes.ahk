#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of resources that can be enumerated using the VerifierEnumerateResource function.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-eavrfresourcetypes
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class eAvrfResourceTypes{

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
