#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CRITICAL_SECTION_DEBUG.ahk" { CRITICAL_SECTION_DEBUG }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct CRITICAL_SECTION {
    #StructPack 8

    __DebugInfo_ptr : IntPtr
    DebugInfo {
        get => (addr := this.__DebugInfo_ptr) ? CRITICAL_SECTION_DEBUG.At(addr) : unset
        set => this.__DebugInfo_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    LockCount : Int32

    RecursionCount : Int32

    OwningThread : HANDLE

    LockSemaphore : HANDLE

    SpinCount : IntPtr

}
