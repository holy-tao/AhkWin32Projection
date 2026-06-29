#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RTL_SPLAY_LINKS.ahk" { RTL_SPLAY_LINKS }
#Import "..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_GENERIC_TABLE {
    #StructPack 8

    TableRoot : RTL_SPLAY_LINKS.Ptr

    InsertOrderList : IntPtr

    OrderedPointer : LIST_ENTRY.Ptr

    WhichOrderedElement : UInt32

    NumberGenericTableElements : UInt32

    CompareRoutine : IntPtr

    AllocateRoutine : IntPtr

    FreeRoutine : IntPtr

    TableContext : IntPtr

}
