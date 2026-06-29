#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAGE_PROTECTION_FLAGS.ahk" { PAGE_PROTECTION_FLAGS }
#Import ".\VIRTUAL_ALLOCATION_TYPE.ahk" { VIRTUAL_ALLOCATION_TYPE }
#Import ".\PAGE_TYPE.ahk" { PAGE_TYPE }

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct MEMORY_BASIC_INFORMATION32 {
    #StructPack 4

    BaseAddress : UInt32

    AllocationBase : UInt32

    AllocationProtect : PAGE_PROTECTION_FLAGS

    RegionSize : UInt32

    State : VIRTUAL_ALLOCATION_TYPE

    Protect : PAGE_PROTECTION_FLAGS

    Type : PAGE_TYPE

}
