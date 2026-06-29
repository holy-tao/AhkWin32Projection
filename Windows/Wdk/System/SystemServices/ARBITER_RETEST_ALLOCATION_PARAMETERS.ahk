#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CM_PARTIAL_RESOURCE_DESCRIPTOR.ahk" { CM_PARTIAL_RESOURCE_DESCRIPTOR }
#Import "..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_RETEST_ALLOCATION_PARAMETERS {
    #StructPack 8

    ArbitrationList : LIST_ENTRY.Ptr

    AllocateFromCount : UInt32

    AllocateFrom : CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr

}
