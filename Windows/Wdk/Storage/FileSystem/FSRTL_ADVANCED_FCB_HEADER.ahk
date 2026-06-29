#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FAST_MUTEX.ahk" { FAST_MUTEX }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSRTL_ADVANCED_FCB_HEADER {
    #StructPack 8

    Base : IntPtr

    FastMutex : FAST_MUTEX.Ptr

    FilterContexts : IntPtr

    PushLock : IntPtr

    FileContextSupportPointer : IntPtr

    Oplock : IntPtr

    AePushLock : IntPtr

    BypassIoOpenCount : UInt32

    static __New() {
        DefineProp(this.Prototype, 'ReservedForRemote', { type: IntPtr, offset: 40 })
        this.DeleteProp("__New")
    }
}
