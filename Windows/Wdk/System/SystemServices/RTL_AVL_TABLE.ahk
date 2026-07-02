#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRTL_AVL_COMPARE_ROUTINE.ahk" { PRTL_AVL_COMPARE_ROUTINE }
#Import ".\RTL_BALANCED_LINKS.ahk" { RTL_BALANCED_LINKS }
#Import ".\PRTL_AVL_ALLOCATE_ROUTINE.ahk" { PRTL_AVL_ALLOCATE_ROUTINE }
#Import ".\PRTL_AVL_FREE_ROUTINE.ahk" { PRTL_AVL_FREE_ROUTINE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_AVL_TABLE {
    #StructPack 8

    BalancedRoot : IntPtr

    OrderedPointer : IntPtr

    WhichOrderedElement : UInt32

    NumberGenericTableElements : UInt32

    DepthOfTree : UInt32

    RestartKey : RTL_BALANCED_LINKS.Ptr

    DeleteCount : UInt32

    CompareRoutine : PRTL_AVL_COMPARE_ROUTINE

    AllocateRoutine : PRTL_AVL_ALLOCATE_ROUTINE

    FreeRoutine : PRTL_AVL_FREE_ROUTINE

    TableContext : IntPtr

}
