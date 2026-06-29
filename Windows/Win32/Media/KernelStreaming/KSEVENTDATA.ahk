#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSEVENTDATA {
    #StructPack 8


    struct _EventHandle {
        Event : HANDLE

        Reserved : IntPtr[2]

    }

    struct _SemaphoreHandle {
        Semaphore : HANDLE

        Reserved : UInt32

        Adjustment : Int32

    }

    struct _Alignment {
        Unused : IntPtr

        Alignment : IntPtr[2]

    }

    NotificationType : UInt32

    EventHandle : KSEVENTDATA._EventHandle

    static __New() {
        DefineProp(this.Prototype, 'SemaphoreHandle', { type: KSEVENTDATA._SemaphoreHandle, offset: 8 })
        DefineProp(this.Prototype, 'Alignment', { type: KSEVENTDATA._Alignment, offset: 8 })
        this.DeleteProp("__New")
    }
}
