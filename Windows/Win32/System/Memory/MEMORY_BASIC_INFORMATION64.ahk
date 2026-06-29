#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAGE_PROTECTION_FLAGS.ahk" { PAGE_PROTECTION_FLAGS }
#Import ".\VIRTUAL_ALLOCATION_TYPE.ahk" { VIRTUAL_ALLOCATION_TYPE }
#Import ".\PAGE_TYPE.ahk" { PAGE_TYPE }

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct MEMORY_BASIC_INFORMATION64 {
    #StructPack 8

    BaseAddress : Int64

    AllocationBase : Int64

    AllocationProtect : PAGE_PROTECTION_FLAGS

    __alignment1 : UInt32

    RegionSize : Int64

    State : VIRTUAL_ALLOCATION_TYPE

    Protect : PAGE_PROTECTION_FLAGS

    Type : PAGE_TYPE

    __alignment2 : UInt32

}
