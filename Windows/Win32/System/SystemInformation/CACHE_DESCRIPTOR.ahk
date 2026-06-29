#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESSOR_CACHE_TYPE.ahk" { PROCESSOR_CACHE_TYPE }

/**
 * Describes the cache attributes.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-cache_descriptor
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct CACHE_DESCRIPTOR {
    #StructPack 4

    Level : Int8

    /**
     * The cache associativity. If this member is CACHE_FULLY_ASSOCIATIVE (0xFF), the cache is fully associative.
     */
    Associativity : Int8

    /**
     * The cache line size, in bytes.
     */
    LineSize : UInt16

    /**
     * The cache size, in bytes.
     */
    Size : UInt32

    /**
     * The cache type. This member is a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-processor_cache_type">PROCESSOR_CACHE_TYPE</a> value.
     */
    Type : PROCESSOR_CACHE_TYPE

}
