#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_BALANCED_LINKS.ahk" { RTL_BALANCED_LINKS }

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

    CompareRoutine : IntPtr

    AllocateRoutine : IntPtr

    FreeRoutine : IntPtr

    TableContext : IntPtr

}
