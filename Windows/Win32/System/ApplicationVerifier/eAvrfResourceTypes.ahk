#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of resources that can be enumerated using the VerifierEnumerateResource function.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-eavrfresourcetypes
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
class eAvrfResourceTypes extends Win32Enum {

    /**
     * Indicates heap-allocation information is being obtained.
     * Native name: AvrfResourceHeapAllocation
     * @type {Integer (Int32)}
     */
    static HeapAllocation => 0

    /**
     * Indicates handle trace information is being obtained.
     * Native name: AvrfResourceHandleTrace
     * @type {Integer (Int32)}
     */
    static HandleTrace => 1

    /**
     * Indicates the upper boundary of the current implementation's resource type.
     * Native name: AvrfResourceMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
