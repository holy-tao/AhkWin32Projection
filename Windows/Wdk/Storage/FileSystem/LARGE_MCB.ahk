#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FAST_MUTEX.ahk" { FAST_MUTEX }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct LARGE_MCB {
    #StructPack 8

    GuardedMutex : FAST_MUTEX.Ptr

    BaseMcb : IntPtr

}
