#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRITICAL_SECTION.ahk" { CRITICAL_SECTION }
#Import "..\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct CRITICAL_SECTION_DEBUG {
    #StructPack 8

    Type : UInt16

    CreatorBackTraceIndex : UInt16

    __CriticalSection_ptr : IntPtr
    CriticalSection {
        get => (addr := this.__CriticalSection_ptr) ? CRITICAL_SECTION.At(addr) : unset
        set => this.__CriticalSection_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    ProcessLocksList : LIST_ENTRY

    EntryCount : UInt32

    ContentionCount : UInt32

    Flags : UInt32

    CreatorBackTraceIndexHigh : UInt16

    Identifier : UInt16

}
