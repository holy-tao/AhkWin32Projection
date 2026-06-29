#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GROUP_AFFINITY.ahk" { GROUP_AFFINITY }
#Import ".\PROCESSOR_CACHE_TYPE.ahk" { PROCESSOR_CACHE_TYPE }

/**
 * Describes cache attributes. This structure is used with the GetLogicalProcessorInformationEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-cache_relationship
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct CACHE_RELATIONSHIP {
    #StructPack 8

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
    CacheSize : UInt32

    /**
     * The cache type. This member is a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-processor_cache_type">PROCESSOR_CACHE_TYPE</a> value.
     */
    Type : PROCESSOR_CACHE_TYPE

    /**
     * This member is reserved.
     */
    Reserved : Int8[18]

    GroupCount : UInt16

    GroupMask : GROUP_AFFINITY

    static __New() {
        DefineProp(this.Prototype, 'GroupMasks', { type: GROUP_AFFINITY[1], offset: 32 })
        this.DeleteProp("__New")
    }
}
